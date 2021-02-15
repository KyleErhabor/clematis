//
//  CharacterMediaView.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 1/22/21.
//

import SDWebImageSwiftUI
import SwiftUI

/// A view for displaying a preview of an anime/manga a character is associated with.
struct CharacterMediaView: View {
    /// The current vertical size state from the environment.
    @Environment(\.verticalSizeClass) private var verticalSizeClass

    /// The view model from the `CharacterView`.
    @EnvironmentObject private var viewModel: CharacterViewModel

    /// A state indicating whether to present the list editor for the anime/manga or not.
    @State private var isPresenting = false

    /// The edge including anime/manga and voice staff data.
    var edge: CharacterMediaEdge

    var body: some View {
        let media = edge.node!
        let staff = edge.voiceActors?.compactMap { $0 }.first

        HStack {
            CharacterMediaLeadingView(edge: edge)

            Spacer()

            if let staff = staff {
                CharacterMediaTrailingView(staff: staff)
            }
        }.frame(height: 120)
        .contextMenu {
            CharacterMediaContextView(isPresenting: $isPresenting, media: media, staff: staff)
        }.sheet(isPresented: $isPresenting) {
            MediaEditorView(viewModel: .init(id: media.id))
        }
    }
}

/// A view for displaying the leading preview information about the anime/manga.
fileprivate struct CharacterMediaLeadingView: View {
    /// The current vertical size state from the environment.
    @Environment(\.verticalSizeClass) private var verticalSizeClass

    /// The edge including the anime/manga data.
    var edge: CharacterMediaEdge

    var body: some View {
        let media = edge.node!

        HStack {
            NavigationLink(destination: MediaView(viewModel: .init(id: media.id))) {
                CharacterMediaImageView(url: URL(string: media.coverImage?.extraLarge ?? "")) {
                    if let hex = media.coverImage?.color,
                       let color = Int(hex, radix: 16) {
                        Color(hex: color)
                    } else {
                        Color.accentColor
                    }
                }
            }.animation(.default)

            VStack(alignment: .leading) {
                NavigationLink(destination: MediaView(viewModel: .init(id: media.id))) {
                    Text("\(media.title?.userPreferred ?? "")")
                        .font(verticalSizeClass == .regular ? .caption : .headline)
                        .bold()
                }.buttonStyle(PlainButtonStyle())

                Spacer()

                if let role = edge.characterRole {
                    Text("\(role.rawValue.capitalized)")
                        .font(verticalSizeClass == .regular ? .caption2 : .caption)
                        .foregroundColor(.secondary)
                }
            }
        }
    }
}

/// A view for displaying the trailing preview information about the voice actor.
fileprivate struct CharacterMediaTrailingView: View {
    /// The current vertical size state from the environment.
    @Environment(\.verticalSizeClass) private var verticalSizeClass

    /// The voice actor.
    var staff: CharacterMediaEdge.VoiceActor

    var body: some View {
        HStack {
            VStack(alignment: .trailing) {
                NavigationLink(destination: StaffView()) {
                    VStack(alignment: .trailing) {
                        Text("\(staff.name?.full ?? "")")
                            .font(verticalSizeClass == .regular ? .caption : .headline)
                            .bold()


                        Text("\(staff.name?.native ?? "")")
                            .font(verticalSizeClass == .regular ? .caption2 : .caption)
                            .foregroundColor(.secondary)
                    }
                }.buttonStyle(PlainButtonStyle())

                Spacer()

                if let language = staff.language {
                    Text("\(language.rawValue.capitalized)")
                        .font(verticalSizeClass == .regular ? .caption2 : .caption)
                        .foregroundColor(.secondary)
                }
            }

            NavigationLink(destination: StaffView()) {
                CharacterMediaImageView(url: URL(string: staff.image?.large ?? "")) {
                    Color.accentColor
                }
            }.animation(.default)
        }.multilineTextAlignment(.trailing)
    }
}

/// A view for displaying an image for the character/voice actor.
fileprivate struct CharacterMediaImageView<Placeholder: View>: View {
    /// The URL to the image.
    private let url: URL?

    /// A view to display as a placeholder before the image is loaded.
    private let placeholder: Placeholder

    var body: some View {
        WebImage(url: url)
            .resizable()
            .placeholder { placeholder }
            .scaledToFill()
            .frame(width: 80)
            .clipped()
            .cornerRadius(4)
    }

    /// Initializes the view.
    ///
    /// - Parameters:
    ///   - url: The URL to the image.
    ///   - placeholder: A view to display as a placeholder before the image is loaded.
    init(url: URL?, @ViewBuilder placeholder: () -> Placeholder) {
        self.url = url
        self.placeholder = placeholder()
    }
}
