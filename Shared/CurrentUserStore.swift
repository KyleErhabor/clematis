//
//  CurrentUserStore.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 2/8/21.
//

import Foundation

class CurrentUserStore: ObservableObject {
    @Published private(set) var users = [CurrentUserQuery.Data.Viewer]()

    static let shared = CurrentUserStore()

    func load() {
        
    }
}
