////
////  MediaPageOverviewView.swift
////  Amincapp
////
////  Created by Kyle Erhabor on 12/22/20.
////
//
//import SwiftUI
//
//struct MediaPageOverviewView: View {
//    var body: some View {
//        VStack {
//            Divider()
//            MediaPageOverviewMetadataView()
//            Divider()
//            MediaPageOverviewLinksView()
//            Divider()
//        }
//    }
//}
//
//fileprivate struct MediaPageOverviewMetadataView: View {
//    @EnvironmentObject private var viewModel: MediaViewModel
//
//    var body: some View {
//        ScrollView(.horizontal, showsIndicators: false) {
//            HStack {
//                if let format = viewModel.media?.format {
//                    GroupBox(label: Text("Format")) {
//                        Text(formatName(format: format))
//                    }
//                }
//
//                if let title = viewModel.media?.title {
//                    if let english = title.english {
//                        GroupBox(label: Text("English")) {
//                            Text(english).help(english)
//                        }
//                    }
//
//                    if let romaji = title.romaji {
//                        GroupBox(label: Text("Romaji")) {
//                            Text(romaji).help(romaji)
//                        }
//                    }
//
//                    if let native = title.native {
//                        GroupBox(label: Text("Native")) {
//                            Text(native).help(native)
//                        }
//                    }
//                }
//            }.padding()
//        }
//    }
//
//    func formatName(format: MediaFormat) -> String {
//        switch format {
//            case .tv: return "TV"
//            case .tvShort: return "TV Short"
//            case .movie: return "Movie"
//            case .special: return "Special"
//            case .ova: return "OVA"
//            case .ona: return "ONA"
//            case .music: return "Music"
//            case .manga: return "Manga"
//            case .novel: return "Novel"
//            case .oneShot: return "One Shot"
//            case let .__unknown(name): return name.capitalized
//        }
//    }
//}
//
//fileprivate struct MediaPageOverviewLinksView: View {
//    @EnvironmentObject private var viewModel: MediaViewModel
//
//    var body: some View {
//        if let idMal = viewModel.media?.idMal,
//           let type = viewModel.media?.type?.rawValue,
//           let malUrl = URL(string: "https://myanimelist.net/\(type.lowercased())/\(idMal)") {
//            MediaPageOverviewLinksButtonView(
//                name: "MyAnimeList",
//                url: malUrl,
//                color: Color("myanimelist-theme-color")
//            )
//        }
//    }
//}
//
//fileprivate struct MediaPageOverviewLinksButtonView: View {
//    private(set) var name: String
//    private(set) var url: URL
//    private(set) var color: Color
//
//    var body: some View {
//        Link(destination: url) {
//            Text(name)
//                .font(.headline)
//                .padding()
//                .frame(maxWidth: .infinity)
//                .background(color)
//                .foregroundColor(.white)
//                .cornerRadius(8)
//                .padding()
//        }
//    }
//}
