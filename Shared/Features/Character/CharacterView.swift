//
//  CharacterView.swift
//  Clematis (iOS)
//
//  Created by Kyle Erhabor on 1/14/21.
//

import SDWebImageSwiftUI
import SwiftUI

typealias CharacterMediaEdge = CharacterQuery.Data.Character.Medium.Edge

/// A view for displaying a character.
struct CharacterView: View {
    /// The view model for this view.
    @StateObject var viewModel: CharacterViewModel

    var body: some View {
        ScrollView {
            VStack {
                CharacterSummaryView()
                CharacterMediaListView()
            }.padding()
        }.navigationTitle("\(viewModel.character?.name?.full ?? "")")
        .navigationBarTitleDisplayMode(.large)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    viewModel.toggleFavorite()
                } label: {
                    // Toolbar items don't support labels with both a title and an image (SF in this case). To get
                    // around this restriction, the text and image are separate instead of joined.
                    Text("\(viewModel.character?.favourites ?? 0)")
                        .font(.headline)

                    Image(systemName: viewModel.character?.isFavourite == true ? "heart.fill" : "heart")
                }
            }
        }.alert(item: $viewModel.error) { err in
            Alert(
                title: Text("Error"),
                message: Text("\(err.message ?? "An unknown error has occurred.")"),
                dismissButton: .default(Text("OK"))
            )
        }.environmentObject(viewModel)
        .onAppear {
            viewModel.load()
        }
    }
}

struct CharacterView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterView(viewModel: CharacterViewModel(id: 4835))
    }
}
