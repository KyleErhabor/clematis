//
//  ActivityTextView.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 1/31/21.
//

import SwiftUI

/// A view for displaying a text activity (`TextActivityFragment`).
struct ActivityTextView: View {
    /// The view model for the text activity.
    @StateObject var viewModel: ActivityTextViewModel

    /// A state detailing whether to present an alert confirming if the user wants to delete this activity.
    @State private var isPresentingAlert = false

    /// A state detailing whether to present the list of users who liked this activity.
    @State private var isPresentingSheet = false


    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                let creationDate = Date(timeIntervalSince1970: TimeInterval(viewModel.activity.createdAt))

                if let user = viewModel.activity.user?.fragments.userPreviewFragment {
                    UserPreviewView(user: user)
                }

                Spacer()

                Text("\(creationDate, formatter: RelativeDateTimeFormatter())")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }

            Text("\(viewModel.activity.text ?? "")")
                .fixedSize(horizontal: false, vertical: true)

            HStack {
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
        }.contextMenu {
            ActivityTextContextView(isPresentingAlert: $isPresentingAlert, isPresentingSheet: $isPresentingSheet)
        }.alert(isPresented: $isPresentingAlert) {
            Alert(
                title: Text("Are you sure you want to delete this activity?"),
                message: Text("This action cannot be undone."),
                primaryButton: .destructive(Text("Delete")) {
                    viewModel.delete()
                },
                secondaryButton: .cancel()
            )
        }.sheet(isPresented: $isPresentingSheet) {
            LikeNavigationView(users: viewModel.activity.likes?.compactMap { $0?.fragments.userPreviewFragment } ?? [])
        }.environmentObject(viewModel)
    }
}

/// The context menu controls for `ActivityTextView`.
fileprivate struct ActivityTextContextView: View {
    /// The view model from the parent `ActivityTextView` view.
    @EnvironmentObject private var viewModel: ActivityTextViewModel

    /// The model object representing the list of authenticated users in the app.
    @EnvironmentObject private var currentUser: CurrentUser

    /// A binding detailing whether to present an alert confirming if the user wants to delete this activity.
    @Binding var isPresentingAlert: Bool

    /// A binding detailing whether to present the list of users who liked this activity.
    @Binding var isPresentingSheet: Bool

    var body: some View {
        Button {
            viewModel.like()
        } label: {
            let isLiked = viewModel.activity.isLiked == true

            Label(isLiked ? "Unlike" : "Like", systemImage: isLiked ? "heart.fill" : "heart")
        }

        Button {
            viewModel.subscribe()
        } label: {
            let isSubscribed = viewModel.activity.isSubscribed == true

            Label(isSubscribed ? "Unsubscribe" : "Subscribe", systemImage: isSubscribed ? "bell.fill" : "bell")
        }

        if (viewModel.activity.likes?.count ?? 0) > 0 {
            Button {
                isPresentingSheet = true
            } label: {
                Label("See Likes", systemImage: "list.bullet")
            }
        }

        if currentUser.users.first?.id == viewModel.activity.user?.fragments.userPreviewFragment.id {
            Button {
                isPresentingAlert = true
            } label: {
                Label("Delete", systemImage: "trash")
            }
        }
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
