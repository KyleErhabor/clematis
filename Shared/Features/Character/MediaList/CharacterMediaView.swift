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

    /// An edge featuring the character and voice staff information.
    private let edge: CharacterQuery.Data.Character.Medium.Edge

    var body: some View {
        let media = edge.node!
        let staff = edge.voiceActors?.compactMap{ $0 }.first(where: firstVoiceActor)

        HStack {
            NavigationLink(destination: MediaView(viewModel: .init(id: media.id))) {
                CharacterMediaImageView(url: URL(string: media.coverImage?.extraLarge ?? "")) {
                    if let hex = media.coverImage?.color,
                       let color = Int(hex, radix: 16) {
                        Color(hex: color)
                    } else {
                        Color.accentColor
                    }
                }.animation(.default)
            }

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

            Spacer()

            if let staff = staff {
                VStack(alignment: .trailing) {
                    NavigationLink(destination: StaffView()) {
                        VStack(alignment: .trailing) {
                            Text("\(staff.name?.full ?? "")")
                                .font(verticalSizeClass == .regular ? .caption : .headline)
                                .bold()

                            Text("\(staff.name?.full ?? "")")
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
                }.multilineTextAlignment(.trailing)
            }

            if let staff = staff {
                NavigationLink(destination: StaffView()) {
                    CharacterMediaImageView(url: URL(string: staff.image?.large ?? "")) {
                        Color.accentColor
                    }.animation(.default)
                }
            }
        }.frame(height: 120)

//            HStack {
//                CharacterMediaSummaryView(
//                    name: media.title?.userPreferred,
//                    footer: edge.characterRole?.rawValue.capitalized,
//                    alignment: .leading,
//                    destination: MediaView(viewModel: MediaViewModel(id: media.id))
//                )
//
//                Spacer()
//
//                if let staff = staff {
//                    CharacterMediaSummaryView(
//                        name: staff.name?.full,
//                        native: staff.name?.native,
//                        footer: staff.language?.rawValue.capitalized,
//                        alignment: .trailing,
//                        destination: StaffView()
//                    )
//                }
//            }.padding(.horizontal, 8)
    }

    /// Initializes the view.
    /// - Parameter edge: An edge featuring the character and voice staff information.
    init(edge: CharacterMediaEdge) {
        self.edge = edge
    }

    /// Filters a voice actor to see if it passes.
    ///
    /// This method checks the `viewModel`'s `voiceActorLanguage` state to find the first staff member with the correct language. If the state is `nil`,
    /// this is a free-pass method.
    ///
    /// - Parameter voiceActor: The voice actor to filter.
    /// - Returns: A boolean indicating if the voice actor passed.
    func firstVoiceActor(voiceActor: CharacterMediaEdge.VoiceActor) -> Bool {
        if let language = viewModel.voiceActorLanguage {
            guard voiceActor.language == language else {
                return false
            }
        }

        return true
    }
}

fileprivate struct CharacterMediaImageView<Placeholder: View>: View {
    private let url: URL?
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

    init(url: URL?, @ViewBuilder placeholder: () -> Placeholder) {
        self.url = url
        self.placeholder = placeholder()
    }
}
//
//fileprivate struct CharacterMediaSummaryView<Destination: View>: View {
//    @Environment(\.verticalSizeClass) private var verticalSizeClass
//    private(set) var name: String?
//    private(set) var native: String?
//    private(set) var footer: String?
//    private(set) var alignment: HorizontalAlignment
//    private(set) var destination: Destination
//
//    var body: some View {
//        VStack(alignment: alignment) {
//            NavigationLink(destination: destination) {
//                VStack(alignment: alignment) {
//                    if let name = name {
//                        Text(name)
//                            .font(verticalSizeClass == .regular ? .caption : .headline)
//                            .bold()
//                    }
//
//                    if let native = native {
//                        Text(native)
//                            .font(verticalSizeClass == .regular ? .caption2 : .caption)
//                            .foregroundColor(.secondary)
//                    }
//                }
//            }.buttonStyle(PlainButtonStyle())
//
//            Spacer()
//
//            if let footer = footer {
//                Text(footer)
//                    .font(verticalSizeClass == .regular ? .caption2 : .caption)
//                    .foregroundColor(.secondary)
//            }
//        }
//    }
//}
