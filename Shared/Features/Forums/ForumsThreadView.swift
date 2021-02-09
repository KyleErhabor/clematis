//
//  ForumsThreadView.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 2/1/21.
//

import SDWebImageSwiftUI
import SwiftUI

struct ForumsThreadView: View {
    @EnvironmentObject private var viewModel: ForumsViewModel
    @State private var isPresenting = false
    private(set) var thread: ForumsQuery.Data.Page.Thread

    var body: some View {
        GroupBox(label: NavigationLink(destination: ThreadView(viewModel: ThreadViewModel(id: thread.id))) {
            Label {
                Text("\(thread.title ?? "")")
            } icon: {
                if thread.isSticky == true {
                    Image(systemName: "pin")
                        .foregroundColor(.yellow)
                }

                if thread.isLocked == true {
                    Image(systemName: "lock")
                        .foregroundColor(.red)
                }
            }
        }.buttonStyle(PlainButtonStyle())) {
            VStack(alignment: .leading) {
                Text("\(thread.body?.components(separatedBy: .newlines).first ?? "")")
                    .foregroundColor(.secondary)
                    .lineLimit(2)

                ForumsThreadPropertiesView(thread: thread)
                ForumsThreadReplyView(thread: thread)
                ForumsThreadCategoriesView(thread: thread)
            }.font(.caption)
        }.sheet(isPresented: $isPresenting) {
            ForumsThreadLikeListView(likes: thread.likes?.compactMap { $0 } ?? [])
        }.contextMenu {
            ForumsThreadContextView(isPresenting: $isPresenting, thread: thread)
        }
    }
}

fileprivate struct ForumsThreadPropertiesView: View {
    @EnvironmentObject private var viewModel: ForumsViewModel
    private(set) var thread: ForumsQuery.Data.Page.Thread

    var body: some View {
        Divider()

        HStack {
            NavigationLink(destination: ThreadView(viewModel: ThreadViewModel(id: thread.id))) {
                Text("View")
                    .bold()
            }

            Spacer()

            if let count = thread.viewCount {
                Label("\(count)", systemImage: "eye")
                    .foregroundColor(.secondary)
            }

            if let count = thread.replyCount {
                Label("\(count)", systemImage: "bubble.left.and.bubble.right")
                    .foregroundColor(.secondary)
            }

            Button {
                viewModel.like(id: thread.id)
            } label: {
                Label("\(thread.likeCount)", systemImage: thread.isLiked == true ? "heart.fill" : "heart")
            }
        }
    }
}

fileprivate struct ForumsThreadReplyView: View {
    private(set) var thread: ForumsQuery.Data.Page.Thread

    var body: some View {
        if let user = thread.replyUser {
            Divider()

            HStack {
                NavigationLink(destination: UserView(viewModel: UserViewModel(id: user.id))) {
                    WebImage(url: URL(string: user.avatar?.large ?? ""))
                        .resizable()
                        .placeholder { Color.accentColor }
                        .scaledToFill()
                        .frame(width: 24, height: 24, alignment: .top)
                        .clipped()
                        .cornerRadius(4)
                }

                NavigationLink(destination: UserView(viewModel: UserViewModel(id: user.id))) {
                    Text("\(user.name)")
                        .bold()
                }.buttonStyle(PlainButtonStyle())

                if let repliedAt = thread.repliedAt {
                    let replyDate = Date(timeIntervalSince1970: TimeInterval(repliedAt))

                    Text(replyDate, formatter: RelativeDateTimeFormatter())
                        .foregroundColor(.secondary)
                }
            }
        }
    }
}

fileprivate struct ForumsThreadCategoriesView: View {
    private(set) var thread: ForumsQuery.Data.Page.Thread

    var body: some View {
        Divider()

        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                if let categories = thread.mediaCategories?.compactMap({ $0 }) {
                    ForEach(categories, id: \.id) { media in
                        NavigationLink(destination: MediaView(viewModel: MediaViewModel(id: media.id))) {
                            Text("\(media.title?.userPreferred ?? "")")
                                .padding(4)
                                .background(Color.green)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                    }
                }

                if let categories = thread.categories?.compactMap({ $0 }) {
                    ForEach(categories, id: \.id) { media in
                        Text("\(media.name)")
                            .padding(4)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }
            }
        }
    }
}

fileprivate struct ForumsThreadContextView: View {
    @EnvironmentObject private var viewModel: ForumsViewModel
    @Binding private(set) var isPresenting: Bool
    private(set) var thread: ForumsQuery.Data.Page.Thread

    var body: some View {
        let isSubscribed = thread.isSubscribed == true

        Button {
            isPresenting = true
        } label: {
            Label("See Likes", systemImage: "list.bullet")
        }

        Button {
            viewModel.subscribe(id: thread.id, subscribe: !isSubscribed)
        } label: {
            Label(isSubscribed ? "Unsubscribe" : "Subscribe", systemImage: isSubscribed ? "bell.fill" : "bell")
        }
    }
}

fileprivate struct ForumsThreadLikeListView: View {
    private(set) var likes: [ForumsQuery.Data.Page.Thread.Like]

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

//struct ForumsThreadView_Previews: PreviewProvider {
//    static var previews: some View {
//        ForumsThreadView()
//    }
//}
