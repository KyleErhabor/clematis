//
//  ActivityReplyView.swift
//  Clematis (iOS)
//
//  Created by Kyle Erhabor on 2/1/21.
//

import SDWebImageSwiftUI
import SwiftUI

struct ActivityReplyView: View {
    @EnvironmentObject private var viewModel: ActivityReplyListViewModel
    @EnvironmentObject private var currentUser: CurrentUser
    @State private var sheet: ActivityReplySheet?
    private(set) var reply: ActivityReplyFragment

    var body: some View {
        VStack(alignment: .leading) {
            if let user = reply.user {
                HStack {
                    let creationDate = Date(timeIntervalSince1970: TimeInterval(reply.createdAt))

                    NavigationLink(destination: UserView(viewModel: UserViewModel(id: user.id))) {
                        WebImage(url: URL(string: "\(user.avatar?.large ?? "")"))
                            .resizable()
                            .placeholder { Color.accentColor }
                            .scaledToFill()
                            .frame(width: 32, height: 32, alignment: .top)
                            .clipped()
                            .cornerRadius(4)
                    }.animation(.default)

                    NavigationLink(destination: UserView(viewModel: UserViewModel(id: user.id))) {
                        Text("\(user.name)")
                            .fontWeight(.medium)
                    }.buttonStyle(PlainButtonStyle())

                    Spacer()

                    Text(creationDate, formatter: RelativeDateTimeFormatter())
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }

            Text("\(reply.text ?? "")")
                .fixedSize(horizontal: false, vertical: true)

            HStack {
                Spacer()

                Button {
                    viewModel.like(id: reply.id)
                } label: {
                    Label("\(reply.likeCount)", systemImage: reply.isLiked == true ? "heart.fill" : "heart")
                }
            }
        }.padding(4)
        .contextMenu {
            ActivityReplyContextView(sheet: $sheet, reply: reply)
        }.sheet(item: $sheet) { sheet in
            switch sheet {
                case .likes:
                    ActivityReplyLikeListView(likes: reply.likes?.compactMap { $0 } ?? [])
                case .editor:
                    ActivityReplyEditorView(reply: reply)
                        .environmentObject(currentUser)
            }
        }
    }
}

fileprivate struct ActivityReplyContextView: View {
    @EnvironmentObject private var currentUser: CurrentUser
    @Binding private(set) var sheet: ActivityReplySheet?
    private(set) var reply: ActivityReplyFragment

    var body: some View {
        if reply.likes?.isEmpty == false {
            Button {
                sheet = .likes
            } label: {
                Label("See Likes", systemImage: "list.bullet")
            }
        }

        if currentUser.users.first?.id == reply.user?.id {
            Button {
                sheet = .editor
            } label: {
                Label("Edit Reply", systemImage: "square.and.pencil")
            }
        }
    }
}

fileprivate struct ActivityReplyLikeListView: View {
    private(set) var likes: [ActivityReplyFragment.Like]

    var body: some View {
        NavigationView {
            List(likes, id: \.id) { user in
                NavigationLink(destination: UserView(viewModel: UserViewModel(id: user.id))) {
                    WebImage(url: URL(string: "\(user.avatar?.large ?? "")"))
                        .resizable()
                        .placeholder { Color.accentColor }
                        .scaledToFill()
                        .frame(width: 32, height: 32, alignment: .top)
                        .clipped()
                        .cornerRadius(4)

                    Text("\(user.name)")
                        .font(.headline)
                }.animation(.default)
            }.navigationTitle("Likes")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

fileprivate enum ActivityReplySheet: Int, Identifiable {
    case likes
    case editor

    var id: Int { rawValue }
}

struct ActivityReplyView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityReplyView(reply: ActivityReplyFragment(
            id: -1,
            isLiked: true,
            createdAt: Int(Date().timeIntervalSince1970),
            likeCount: 10,
            text: "the peeps",
            user: .init(id: 22662, name: "RogueTofu"),
            likes: [.init(id: 861701, name: "zheitama")]
        ))
    }
}
