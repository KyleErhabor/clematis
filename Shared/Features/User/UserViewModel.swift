//
//  UserViewModel.swift
//  Anime Catalog
//
//  Created by Kyle Erhabor on 9/26/20.
//

import SwiftUI
import Down

class UserViewModel: ObservableObject {
    let id: Int

    var user: UserQuery.Data.User?

    init(id: Int) {
        self.id = id
    }

    func loadUser() {
        ApolloNetwork.shared.anilist.fetch(query: UserQuery(id: id)) { result in
            switch result {
                case .success(let queryData):
                    if let user = queryData.data?.user {
                        self.user = user

                        self.transformUserBioToHTML {
                            self.objectWillChange.send()
                        }
                    }
                case .failure(let err): print(err)
            }
        }
    }

    func transformUserBioToHTML(callback: @escaping () -> Void) {
        ApolloNetwork.shared.anilist.fetch(query: MarkdownParseQuery(markdown: user!.about!)) { result in
            switch result {
                case .success(let queryData):
                    if let html = queryData.data?.markdown?.html {
                        if let html = try? Down(markdownString: html).toCommonMark() {
                            self.user?.about = html
                        }
                    }

                case .failure(let err): print(err)
            }

            callback()
        }
    }
}
