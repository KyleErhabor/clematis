//
//  ActivityView.swift
//  Amincapp
//
//  Created by Kyle Erhabor on 11/25/20.
//

import SDWebImageSwiftUI
import SwiftSoup
import SwiftUI

struct ActivityView: View {
    @StateObject var viewModel: ActivityViewModel

    var body: some View {
        List {
            ForEach(viewModel.replies, id: \.id) { reply in
                ScrollView {
                    VStack(alignment: .leading) {
                        ActivityReplyView(reply: reply)
                    }
                }
            }.padding(.vertical, 8)
        }.navigationTitle("Replies")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            viewModel.fetchActivity()
        }
    }
}

struct ActivityReplyView: View {
    private let reply: ActivityReplyFragment

    private let dateFormatter: RelativeDateTimeFormatter = {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full

        return formatter
    }()

    var body: some View {
        HStack {
            NavigationLink(destination: UserView()) {
                WebImage(url: URL(string: reply.user?.avatar?.large ?? ""))
                    .resizable()
                    .placeholder { Color.accentColor }
                    .scaledToFill()
                    .frame(width: 36, height: 36)
                    .cornerRadius(8)

                Text(reply.user?.name ?? "?").fontWeight(.medium)
            }

            Spacer()

            Image(systemName: reply.isLiked == true ? "heart.fill" : "heart")
                .foregroundColor(.accentColor)

            Text(dateFormatter.localizedString(
                for: Date(timeIntervalSince1970: TimeInterval(reply.createdAt)),
                relativeTo: Date()
            )).font(.caption)
            .fontWeight(.semibold)
            .foregroundColor(.gray)
        }

        if let text = reply.text {
            Text(removeHTML(html: text))
                .fixedSize(horizontal: false, vertical: true)
        }
    }

    init(reply: ActivityReplyFragment) {
        self.reply = reply
    }
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView(viewModel: ActivityViewModel(id: 140602996))
    }
}
