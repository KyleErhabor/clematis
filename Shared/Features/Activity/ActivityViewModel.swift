//
//  ActivityViewModel.swift
//  Amincapp
//
//  Created by Kyle Erhabor on 11/25/20.
//

import Combine

class ActivityViewModel: ObservableObject {
    private let id: Int

    @Published private(set) var replies = [ActivityReplyFragment]()

    init(id: Int) {
        self.id = id
    }

    func fetchActivity() {
        GraphQLNetwork.shared.anilist.fetch(query: ActivityQuery(id: id)) { result in
            switch result {
                case .success(let query):
                    if let activity = query.data?.activity {
                        // The property types are all separate structs, making it difficult to elegantly merge all
                        // three without type erasure, which is not what we want.
                        let listReplies = activity.asListActivity?.replies?
                            .compactMap { $0?.fragments.activityReplyFragment }

                        let textReplies = activity.asTextActivity?.replies?
                            .compactMap { $0?.fragments.activityReplyFragment }

                        let messageReplies = activity.asMessageActivity?.replies?
                            .compactMap { $0?.fragments.activityReplyFragment }

                        // Instead of using `Array.append(contentsOf:)`, we'll be setting the array's contents as a
                        // whole. AniList returns all replies under the activity for one single request, so appending
                        // elements only opens up the chance of the same activity being repeated.
                        if (listReplies ?? textReplies ?? messageReplies) != nil {
                            self.replies = (listReplies ?? textReplies ?? messageReplies)!
                        }
                    }
                case .failure(let err): print(err)
            }
        }
    }

    func convertToHTML(markdown: String) -> Future<String, Error> {
        return Future { promise in
            GraphQLNetwork.shared.anilist.fetch(query: MarkdownQuery(markdown: markdown)) { result in
                switch result {
                    case .success(let query):
                        if let html = query.data?.markdown?.html {
                            promise(.success(html))
                        }
                    case .failure(let err): promise(.failure(err))
                }
            }
        }
    }
}
