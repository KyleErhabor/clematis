//
//  ActivityTextView.swift
//  Clematis (iOS)
//
//  Created by Kyle Erhabor on 1/31/21.
//

import SwiftUI

/// A view for displaying a text activity (`TextActivityFragment`).
struct ActivityTextView: View {
    /// The view model for the text activity.
    @StateObject var viewModel: ActivityTextViewModel

    /// A state indicating whether to present an alert confirming if the user wants to delete this activity.
    @State private var isPresentingAlert = false

    /// A state indicating whether to present the list of users who liked this activity.
    @State private var sheet: ActivityTextViewSheet?

    /// A state indicating whether to show all the contents of the message. When `false`, only 8 lines are shown.
    @State private var isExpanded = false

    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .firstTextBaseline) {
                let creationDate = Date(timeIntervalSince1970: TimeInterval(viewModel.activity.createdAt))

                if let user = viewModel.activity.user?.fragments.userPreviewFragment {
                    UserPreviewView(user: user)
                }

                Spacer()

                Text("\(creationDate, formatter: RelativeDateTimeFormatter())")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }.alert(isPresented: $isPresentingAlert) {
                Alert(
                    title: Text("Are you sure you want to delete this activity?"),
                    message: Text("This action cannot be undone."),
                    primaryButton: .destructive(Text("Delete")) {
                        viewModel.delete()
                    },
                    secondaryButton: .cancel()
                )
            }

            Text("\(viewModel.activity.text ?? "")")
                .lineLimit(isExpanded ? nil : 8)
                .fixedSize(horizontal: false, vertical: true)
                .id(UUID())

            HStack {
                Button(isExpanded ? "Read Less" : "Read More") {
                    withAnimation {
                        isExpanded.toggle()
                    }
                }

                Spacer()

                Button {
                    viewModel.like()
                } label: {
                    let isLiked = viewModel.activity.isLiked == true

                    Label("\(viewModel.activity.likeCount)", systemImage: isLiked ? "heart.fill" : "heart")
                }

                NavigationLink(destination: ActivityReplyListView(viewModel: .init(id: viewModel.activity.id))) {
                    Label("\(viewModel.activity.replyCount)", systemImage: "bubble.left")
                }
            }.padding(.top, 2)
            .alert(item: $viewModel.error) { err in
                Alert(
                    title: Text("Error"),
                    message: Text("\(err.message ?? "An unknown error has occurred.")"),
                    dismissButton: .default(Text("OK"))
                )
            }
        }.contextMenu {
            ActivityTextContextView(isPresentingAlert: $isPresentingAlert, sheet: $sheet)
        }.sheet(item: $sheet) { sheet in
            switch sheet {
                case .editor:
                    MarkdownEditorView(viewModel: viewModel, text: viewModel.activity.text ?? "")
                case .likes:
                    let users = viewModel.activity.likes?.compactMap { $0?.fragments.userPreviewFragment } ?? []

                    LikeNavigationView(users: users)
            }
        }.environmentObject(viewModel)
    }
}

/// The context menu controls for `ActivityTextView`.
fileprivate struct ActivityTextContextView: View {
    /// The view model from the parent `ActivityTextView` view.
    @EnvironmentObject private var viewModel: ActivityTextViewModel

    /// The global environment object for user accounts logged in.
    @EnvironmentObject private var userStore: CurrentUserStore

    /// A binding detailing whether to present an alert confirming if the user wants to delete this activity.
    @Binding var isPresentingAlert: Bool

    /// A binding detailing whether to present the list of users who liked this activity.
    @Binding var sheet: ActivityTextViewSheet?

    var body: some View {
        let isActivityOwner = userStore.users.first?.id == viewModel.activity.user?.fragments.userPreviewFragment.id

        if isActivityOwner {
            Button {
                sheet = .editor
            } label: {
                Label("Edit", systemImage: "pencil")
            }
        }

        if viewModel.activity.likes?.isEmpty == false {
            Button {
                sheet = .likes
            } label: {
                Label("See Likes", systemImage: "list.bullet")
            }
        }

        if userStore.isSignedIn {
            Button {
                viewModel.subscribe()
            } label: {
                let isSubscribed = viewModel.activity.isSubscribed == true

                Label(isSubscribed ? "Unsubscribe" : "Subscribe", systemImage: isSubscribed ? "bell.fill" : "bell")
            }
        }

        if isActivityOwner {
            Button {
                isPresentingAlert = true
            } label: {
                Label("Delete", systemImage: "trash")
            }
        }
    }
}

/// An enum to represent what kind of view to represent for the `ActivityTextView` view.
fileprivate enum ActivityTextViewSheet: Int, Identifiable {
    /// A sheet for editing the contents of the text activity.
    case editor

    /// A sheet for displaying the list of users who liked this activity.
    case likes

    var id: Int {
        rawValue
    }
}

struct ActivityTextView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityTextView(viewModel: .init(activity: .init(
            id: 170868820,
            isLiked: false,
            createdAt: Int(Date().timeIntervalSince1970),
            likeCount: 21,
            replyCount: 1,
            isSubscribed: true,
            text: "i wake up now, time to read and vibe to some music",
            user: .init(unsafeResultMap: UserPreviewFragment(id: 974777, name: "krraa").resultMap),
            likes: [.init(unsafeResultMap: UserPreviewFragment(id: 340718, name: "paprikaosk").resultMap)]
        )))
    }
}
