//
//  CharacterMediaView.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 1/22/21.
//

import SDWebImageSwiftUI
import SwiftUI

struct CharacterMediaView: View {
    private(set) var edge: CharacterQuery.Data.Character.Medium.Edge

    var body: some View {
        let media = edge.node!
        let staff = edge.voiceActors?.isEmpty == false ? edge.voiceActors![0] : nil

        HStack(spacing: 0) {
            NavigationLink(destination: MediaView(viewModel: MediaViewModel(id: media.id))) {
                CharacterMediaImageView(url: URL(string: media.coverImage?.extraLarge ?? "")) {
                    if let colorHex = media.coverImage?.color,
                       let colorInt = Int(colorHex.dropFirst(), radix: 16) {
                        Color(hex: colorInt)
                    } else {
                        Color.accentColor
                    }
                }
            }.animation(.default)

            HStack {
                CharacterMediaSummaryView(
                    name: media.title?.userPreferred,
                    footer: edge.characterRole?.rawValue.capitalized,
                    alignment: .leading,
                    destination: MediaView(viewModel: MediaViewModel(id: media.id))
                )

                Spacer()

                if let staff = staff {
                    CharacterMediaSummaryView(
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
                    CharacterMediaImageView(url: URL(string: staff.image?.large ?? "")) {
                        Color.accentColor
                    }
                }.animation(.default)
            }
        }.frame(height: 120)
        .animation(nil)
    }
}

fileprivate struct CharacterMediaImageView<Placeholder: View>: View {
    private(set) var url: URL?
    private(set) var placeholder: Placeholder

    var body: some View {
        WebImage(url: url)
            .resizable()
            .placeholder { placeholder }
            .scaledToFill()
            .frame(width: 80)
            .clipped()
            .cornerRadius(4)
    }

    init(url: URL?, @ViewBuilder placeholder: () -> Placeholder) {
        self.url = url
        self.placeholder = placeholder()
    }
}

fileprivate struct CharacterMediaSummaryView<Destination: View>: View {
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
