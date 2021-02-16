//
//  MediaEditorAdvancedScoresView.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 2/16/21.
//

import SwiftUI

struct MediaEditorAdvancedScoresView: View {
    @EnvironmentObject private var viewModel: MediaEditorViewModel
    @EnvironmentObject private var userStore: CurrentUserStore

    var body: some View {
        Text("?")
    }

    func advancedScoresEnabled() -> Bool {
        switch viewModel.media?.type {
            // .animeList vs. .mangaList
            case .anime: return userStore.users.first?.mediaListOptions?.animeList?.advancedScoringEnabled == true
            case .manga: return userStore.users.first?.mediaListOptions?.mangaList?.advancedScoringEnabled == true
            default: return false
        }
    }
}

struct MediaEditorAdvancedScoresView_Previews: PreviewProvider {
    static var previews: some View {
        MediaEditorAdvancedScoresView()
    }
}
