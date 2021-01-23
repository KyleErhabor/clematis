//
//  CharacterView.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 1/14/21.
//

import SDWebImageSwiftUI
import SwiftUI

struct CharacterView: View {
    @StateObject var viewModel: CharacterViewModel

    var body: some View {
        ScrollView {
            VStack {
                CharacterSummaryView()
                CharacterMediaListView()
            }.padding()
        }.environmentObject(viewModel)
        .navigationTitle("\(viewModel.character?.name?.full ?? "")")
        .navigationBarTitleDisplayMode(.large)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    viewModel.toggleFavorite()
                } label: {
                    Text("\(viewModel.character?.favourites ?? 0)")
                    Image(systemName: viewModel.character?.isFavourite == true ? "heart.fill" : "heart")
                }
            }
        }.onAppear {
            viewModel.load()
        }
    }
}

struct CharacterView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterView(viewModel: CharacterViewModel(id: 122444))
    }
}
