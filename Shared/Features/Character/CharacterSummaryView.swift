//
//  CharacterSummaryView.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 1/22/21.
//

import SDWebImageSwiftUI
import SwiftUI

struct CharacterSummaryView: View {
    @EnvironmentObject private var viewModel: CharacterViewModel

    var body: some View {
        HStack(alignment: .top) {
            WebImage(url: URL(string: viewModel.character?.image?.large ?? ""))
                .resizable()
                .placeholder { Color.accentColor }
                .scaledToFill()
                .frame(width: 160)
                .clipped()
                .cornerRadius(4)

            VStack(alignment: .leading) {
                Text("\(viewModel.character?.name?.native ?? "")")
                    .font(.title)
                    .bold()

                ForEach(viewModel.character?.name?.alternative?.compactMap { $0 } ?? [], id: \.self) { name in
                    Text(name)
                        .font(.system(.headline, design: .rounded))
                        .foregroundColor(.secondary)
                }
            }

            Spacer()
        }.frame(height: 240)
        .animation(.default)

        Divider().padding(.vertical)

        Text("\(viewModel.character?.description ?? "")")

        Divider().padding(.vertical)
    }
}

struct CharacterSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterSummaryView()
    }
}
