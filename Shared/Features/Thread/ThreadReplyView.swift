//
//  ThreadReplyView.swift
//  Clematis (iOS)
//
//  Created by Kyle Erhabor on 2/2/21.
//

import Apollo
import SDWebImageSwiftUI
import SwiftUI

struct ThreadReplyView: View {
    private(set) var comment: ThreadQuery.Data.Page.ThreadComment

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                if let user = comment.user {
                    UserPreviewView(user: user.fragments.userPreviewFragment)
                }

                Spacer()

                if let createdAt = comment.createdAt {
                    Text(Date(timeIntervalSince1970: TimeInterval(createdAt)), formatter: RelativeDateTimeFormatter())
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
            }

            Text("\(comment.comment ?? "-")")
                .fixedSize(horizontal: false, vertical: true)
        }


    }
}

//struct ThreadReplyView_Previews: PreviewProvider {
//    static var previews: some View {
//        ThreadReplyView()
//    }
//}
