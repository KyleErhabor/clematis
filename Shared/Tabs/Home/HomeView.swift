//
//  HomeView.swift
//  Anime Catalog
//
//  Created by Kyle Erhabor on 9/4/20.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            Text("SwiftUI").navigationBarTitle("Welcome").navigationBarItems(trailing: CurrentUserNavigationView())
        }
    }
}
//struct HomeView: View {
//    @StateObject private var viewModel = HomeViewModel()
//
//    var body: some View {
//        NavigationView {
//            List {
//                ForEach(viewModel.activities) { activity in
//                    if let activity = activity.listActivityFragment {
//                        HomeListActivityView(activity: activity)
//                    }
//                }
//            }.navigationBarTitle("Activity Feed")
//        }.listStyle(InsetListStyle())
//        .onAppear {
//            viewModel.loadActivities()
//        }
//    }
//}
//
//fileprivate struct HomeListActivityView: View {
//    fileprivate let activity: ListActivityFragment
//
//    var body: some View {
//        NavigationLink(destination: HomeActivityRepliesView(viewModel: HomeActivityRepliesViewModel(activityID: activity.id))) {
//            let coverImageURL = activity.media?.coverImage?.extraLarge == nil
//                ? nil
//                : URL(string: (activity.media?.coverImage?.extraLarge)!)
//
//            let coverImageColor = activity.media?.coverImage?.color == nil
//                ? Color.primary
//                : Color.init(hex: Int((activity.media?.coverImage?.color?.dropFirst())!, radix: 16)!)
//
//            WebImage(url: coverImageURL)
//                .resizable()
//                .background(coverImageColor)
//                .scaledToFit()
//                .cornerRadius(5)
//                .frame(width: 80, height: 128)
//
//
//            HomeListActivitySummaryView(activity: activity).padding(5)
//        }.animation(.easeIn(duration: 0.3))
//    }
//}
//
//fileprivate struct HomeListActivitySummaryView: View {
//    fileprivate let activity: ListActivityFragment
//
//    private var dateFormatter: DateFormatter {
//        let formatter = DateFormatter()
//        formatter.timeStyle = .short
//        formatter.dateStyle = .short
//
//        return formatter
//    }
//
//    var body: some View {
//        VStack(alignment: .leading) {
//            HStack {
//                Text(activity.user?.name ?? "?").bold()
//                Spacer()
//                Text(dateFormatter.string(from: Date(timeIntervalSince1970: TimeInterval(activity.createdAt))))
//                    .foregroundColor(.gray)
//                    .font(.footnote)
//            }
//
//            let status = activity.status?.capitalizeFirstLetter() ?? "?"
//            let title = activity.media?.title?.userPreferred ?? "?"
//
//            if activity.progress == nil {
//                // Completed <x>
//                Text("\(status) ") + Text("\(title)").bold()
//            } else {
//                // Watched episode (<x> - <y> | <x>) of <z>
//                Text("\(status) \(activity.progress!) of ") + Text("\(title)").bold()
//            }
//
//            HStack {
//                if let avatar = activity.user?.avatar?.large,
//                   let avatarURL = URL(string: avatar) {
//                    WebImage(url: avatarURL)
//                        .resizable()
//                        .scaledToFit()
//                        .cornerRadius(5)
//                        .frame(width: 40, height: 40)
//                }
//
//                Spacer()
//                Label("\(activity.replyCount)", systemImage: "bubble.left").foregroundColor(.accentColor)
//
//                Button {} label: {
//                    // TODO: Use `heart.fill` and an animation if the user is logged in and has liked this.
//                    Label("\(activity.likeCount)", systemImage: "heart")
//                        .foregroundColor(.accentColor)
//                }
//            }
//        }
//    }
//}
//
//fileprivate struct HomeActivityRepliesView: View {
//    @StateObject fileprivate var viewModel: HomeActivityRepliesViewModel
//
//    var body: some View {
//        ScrollView {
//            LazyVStack(spacing: 50) {
//                ForEach(viewModel.replies, id: \.id) { reply in
//
//                }
//            }
//        }
//        .onAppear {
//            viewModel.loadReplies()
//        }
//    }
//}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
