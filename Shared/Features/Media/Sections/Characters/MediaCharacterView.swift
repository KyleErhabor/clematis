//
//  MediaCharacterView.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 1/16/21.
//

import SDWebImageSwiftUI
import SwiftUI

struct MediaCharacterView: View {
    @EnvironmentObject private var viewModel: MediaViewModel
    private(set) var edge: MediaQuery.Data.Medium.Character.Edge

    var body: some View {
        let character = edge.node!
        let staff = edge.voiceActors?.isEmpty == true ? nil : edge.voiceActors![0]

        HStack(spacing: 0) {
            NavigationLink(destination: CharacterView(viewModel: CharacterViewModel(id: character.id))) {
                MediaCharacterImageView(url: URL(string: character.image?.large ?? ""))
            }.animation(.default)

            // On an iPhone in portrait mode, size is limitd
            HStack {
                MediaCharacterSummaryView(
                    name: character.name?.full,
                    native: character.name?.native,
                    footer: edge.role?.rawValue.capitalized,
                    alignment: .leading,
                    destination: CharacterView(viewModel: CharacterViewModel(id: character.id))
                )

                Spacer()

                if let staff = staff {
                    MediaCharacterSummaryView(
                        name: staff.name?.full,
                        native: staff.name?.native,
                        footer: staff.language?.rawValue.capitalized,
                        alignment: .trailing,
                        destination: StaffView()
                    )
                }
            }.padding(.horizontal, 8)

            if let staff = staff {
                NavigationLink(destination: StaffView()) {
                    MediaCharacterImageView(url: URL(string: staff.image?.large ?? ""))
                }.animation(.default)
            }
        }.frame(height: 120)
        .contextMenu {
            MediaCharacterContextMenuView(edge: edge)
        }
    }
}

fileprivate struct MediaCharacterImageView: View {
    private(set) var url: URL?

    var body: some View {
        WebImage(url: url)
            .resizable()
            .placeholder { Color.accentColor }
            .scaledToFill()
            .frame(width: 80)
            .clipped()
            .cornerRadius(4)
    }
}

fileprivate struct MediaCharacterSummaryView<Destination: View>: View {
    @Environment(\.verticalSizeClass) private var verticalSizeClass
    private(set) var name: String?
    private(set) var native: String?
    private(set) var footer: String?
    private(set) var alignment: HorizontalAlignment
    private(set) var destination: Destination

    var body: some View {
        VStack(alignment: alignment) {
            NavigationLink(destination: destination) {
                VStack(alignment: alignment) {
                    if let name = name {
                        Text(name)
                            .font(verticalSizeClass == .regular ? .caption : .headline)
                            .bold()
                    }

                    if let native = native {
                        Text(native)
                            .font(verticalSizeClass == .regular ? .caption2 : .caption)
                            .foregroundColor(.secondary)
                    }
                }
            }.buttonStyle(PlainButtonStyle())

            Spacer()

            if let footer = footer {
                Text(footer)
                    .font(verticalSizeClass == .regular ? .caption2 : .caption)
                    .foregroundColor(.secondary)
            }
        }
    }
}

fileprivate struct MediaCharacterContextMenuView: View {
    @EnvironmentObject private var viewModel: MediaViewModel
    private(set) var edge: MediaQuery.Data.Medium.Character.Edge

    var body: some View {
        let character = edge.node!
        let staff = edge.voiceActors?.isEmpty == true ? nil : edge.voiceActors![0]

        #if DEBUG
        Button {
            UIPasteboard.general.string = "\(character.id)"
        } label: {
            Label("Copy Character ID", systemImage: "doc.on.doc")
        }

        if let staff = staff {
            Button {
                UIPasteboard.general.string = "\(staff.id)"
            } label: {
                Label("Copy Voice Actor ID", systemImage: "doc.on.doc")
            }
        }

        #endif

        Button {
            viewModel.toggleFavorite(id: character.id, for: .character)
        } label: {
            Label(character.isFavourite ? "Remove Favorite Character" : "Add Favorite Character",
                  systemImage: character.isFavourite ? "heart.fill" : "heart")
        }

        if let staff = staff {
            Button {
                viewModel.toggleFavorite(id: staff.id, for: .staff)
            } label: {
                Label(staff.isFavourite ? "Remove Favorite Voice Actor" : "Add Favorite Voice Actor",
                      systemImage: staff.isFavourite ? "heart.fill" : "heart")
            }
        }
    }
}
