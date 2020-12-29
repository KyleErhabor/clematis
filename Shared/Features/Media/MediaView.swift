//
//  MediaView.swift
//  Amincapp
//
//  Created by Kyle Erhabor on 11/23/20.
//

import SDWebImageSwiftUI
import SwiftUI

struct MediaView: View {
    @StateObject var viewModel: MediaViewModel

    var body: some View {
        ScrollView {
            MediaHeaderView()
            MediaOverviewView()
                .padding(.horizontal)
                .padding(.horizontal)
        }.navigationTitle("\(viewModel.media?.title?.userPreferred ?? "")")
        .navigationBarTitleDisplayMode(.inline)
        .edgesIgnoringSafeArea(.all)
        .environmentObject(viewModel)
        .onAppear {
            viewModel.fetchMedia()
        }
    }
}

fileprivate struct MediaHeaderView: View {
    @EnvironmentObject private var viewModel: MediaViewModel

    var body: some View {
        GeometryReader { geo in
            let bannerImage = viewModel.media?.bannerImage ?? viewModel.media?.coverImage?.extraLarge ?? ""
            let placeholderColor: Color = {
                if viewModel.media?.bannerImage == nil, let color = viewModel.media?.coverImage?.color {
                    return Color(hex: Int(color.dropFirst(), radix: 16)!)
                } else {
                    return Color.accentColor
                }
            }()

            let bannerWebImage = WebImage(url: URL(string: bannerImage))
                .resizable()
                .placeholder { placeholderColor.colorMultiply(.gray) }
                .scaledToFill()
                .blur(radius: bannerImage == viewModel.media?.coverImage?.extraLarge ? 32 : 0)

            if geo.frame(in: .global).minY <= 0 {
                bannerWebImage
                    .frame(width: geo.size.width, height: geo.size.height)
                    .offset(y: geo.frame(in: .global).minY / 9)
                    .clipped()
            } else {
                bannerWebImage
                    .frame(width: geo.size.width, height: geo.size.height + geo.frame(in: .global).minY)
                    .clipped()
                    .offset(y: -geo.frame(in: .global).minY)
            }
        }.frame(height: 330)
    }
}

fileprivate struct MediaOverviewView: View {
    @EnvironmentObject private var currentUser: CurrentUser
    @EnvironmentObject private var viewModel: MediaViewModel
    @State private var error: AniList.ErrorKind?
    @State private var isPresenting = false
    @State private var isFavorited = false

    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 16) {
                VStack {
                    WebImage(url: URL(string: viewModel.media?.coverImage?.extraLarge ?? ""))
                        .resizable()
                        .placeholder {
                            if let color = viewModel.media?.coverImage?.color {
                                Color(hex: Int(color.dropFirst(), radix: 16)!)
                            } else {
                                Color.accentColor
                            }
                        }.frame(width: 200, height: 300)
                        .cornerRadius(4)

                    Button {
                        if currentUser.users.isEmpty {
                            error = .unauthorized
                        } else {
                            isPresenting = true
                        }
                    } label: {
                        let title = viewModel.media?.mediaListEntry?.status == nil
                            ? "Add to List"
                            : AniList.statusName(
                                status: viewModel.media!.mediaListEntry!.status!,
                                type: viewModel.media!.type!
                            )

                        Label(title, systemImage: "bookmark")
                            .font(.headline)
                            .padding()
                            .frame(width: 200)
                            .background(Color.accentColor)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }.offset(y: -64)

                VStack(alignment: .leading) {
                    HStack {
                        Text(viewModel.media?.title?.userPreferred ?? "")
                            .fontWeight(.bold)
                            .font(.largeTitle)
                            .padding(.bottom, 2)

                        Spacer()

                        Button {
                            if currentUser.users.isEmpty {
                                error = .unauthorized
                            } else {
                                viewModel.favorite()
                            }
                        } label: {
                            Image(systemName: viewModel.media?.isFavourite == true ? "heart.fill" : "heart")
                        }
                    }

                    // FIXME: https://github.com/LiteLT/Amincapp-Apple/issues/1
                    Text(viewModel.media?.description ?? "")
                        .fixedSize(horizontal: false, vertical: true)
                }
            }

            Divider()

            HStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        MediaOverviewMetadataView()
                    }
                }
            }
        }.alert(item: $error) { err in
            Alert(title: Text(err.message()))
        }.sheet(isPresented: $isPresenting) {
            MediaEditorView(viewModel: MediaEditorViewModel(id: viewModel.media!.id))
                .environmentObject(currentUser)
        }
    }
}

fileprivate struct MediaOverviewMetadataView: View {
    @EnvironmentObject private var viewModel: MediaViewModel

    var body: some View {
        if let format = viewModel.media?.format {
            GroupBox(label: Text("Format")) {
                MediaOverviewMetadataFormatView(format: format)
            }
        }

        if let status = viewModel.media?.status {
            GroupBox(label: Text("Status")) {
                Text(mediaStatus(status: status))
            }
        }

        if let season = viewModel.media?.season {
            GroupBox(label: Text("Season")) {
                Text(mediaSeason(season: season))
            }
        }

        if let episodes = viewModel.media?.episodes {
            GroupBox(label: Text("Episodes")) {
                Text("\(episodes)")
            }
        }

        if let duration = viewModel.media?.duration {
            GroupBox(label: Text("Episode Duration")) {
                Text("\(duration) minutes")
            }
        }

        if let chapters = viewModel.media?.chapters {
            GroupBox(label: Text("Chapters")) {
                Text("\(chapters)")
            }
        }

        if let volumes = viewModel.media?.volumes {
            GroupBox(label: Text("Volumes")) {
                Text("\(volumes)")
            }
        }

//        MediaOverviewMetadataStartDateView()
//        MediaOverviewMetadataEndDateView()
//        MediaOverviewMetadataCountryOriginView()
//
//        if let title = viewModel.media?.title {
//            MediaOverviewMetadataTitleView(title: title)
//        }
    }

    func mediaStatus(status: MediaStatus) -> String {
        switch status {
            case .finished: return "Finished"
            case .releasing: return "Releasing"
            case .notYetReleased: return "Not Yet Released"
            case .cancelled: return "Canceled"
            case .hiatus: return "Hiatus"
            case let .__unknown(status): return status.capitalized
        }
    }

    func mediaSeason(season: MediaSeason) -> String {
        switch season {
            case .winter: return "Winter"
            case .spring: return "Spring"
            case .summer: return "Summer"
            case .fall: return "Fall"
            case .__unknown(let season): return season.capitalized
        }
    }
}

fileprivate struct MediaOverviewMetadataTitleView: View {
    private(set) var title: MediaQuery.Data.Medium.Title

    var body: some View {
        if let english = title.english {
            GroupBox(label: Text("English")) {
                Text(english)
            }
        }

        if let romaji = title.romaji {
            GroupBox(label: Text("Romaji")) {
                Text(romaji)
            }
        }

        if let native = title.native {
            GroupBox(label: Text("Native")) {
                Text(native)
            }
        }
    }
}

fileprivate struct MediaOverviewMetadataFormatView: View {
    @EnvironmentObject private var viewModel: MediaViewModel

    private(set) var format: MediaFormat

    var body: some View {
        if viewModel.media?.isLicensed == true {
            Text(mediaFormat(format: format))
        } else {
            Text("\(mediaFormat(format: format)) (Doujinshi)")
        }
    }

    func mediaFormat(format: MediaFormat) -> String {
        switch format {
            case .tv: return "TV"
            case .tvShort: return "TV Short"
            case .movie: return "Movie"
            case .special: return "Special"
            case .ova: return "OVA"
            case .ona: return "ONA"
            case .music: return "Music"
            case .manga: return "Manga"
            case .novel: return "Novel" // May be a Light Novel, handle this in the future.
            case .oneShot: return "One Shot"
            case let .__unknown(fmt): return fmt.capitalized
        }
    }
}

fileprivate struct MediaOverviewMetadataStartDateView: View {
    @EnvironmentObject private var viewModel: MediaViewModel

    var body: some View {
        if let startDate = viewModel.media?.startDate,
           startDate.day != nil || startDate.month != nil || startDate.year != nil {
            GroupBox(label: Text("Start Date")) {
                let day = datePointToString(number: startDate.day)
                let month = datePointToString(number: startDate.month)
                let year = datePointToString(number: startDate.year)

                Text("\(month)/\(day)/\(year)")
            }
        }
    }

    func datePointToString(number: Int?) -> String {
        if let number = number {
            return "\(number)"
        }

        return "?"
    }
}

fileprivate struct MediaOverviewMetadataEndDateView: View {
    @EnvironmentObject private var viewModel: MediaViewModel

    var body: some View {
        if let endDate = viewModel.media?.endDate,
           endDate.day != nil || endDate.month != nil || endDate.year != nil {
            GroupBox(label: Text("End Date")) {
                MediaOverviewMetadataEndDateView()
                let day = datePointToString(number: endDate.day)
                let month = datePointToString(number: endDate.month)
                let year = datePointToString(number: endDate.year)

                Text("\(month)/\(day)/\(year)")
            }
        }
    }

    func datePointToString(number: Int?) -> String {
        if let number = number {
            return "\(number)"
        }

        return "?"
    }
}

fileprivate struct MediaOverviewMetadataCountryOriginView: View {
    @EnvironmentObject private var viewModel: MediaViewModel

    var body: some View {
        if let countryCode = viewModel.media?.countryOfOrigin,
           let name = Locale.current.localizedString(forRegionCode: countryCode) {
            GroupBox(label: Text("Country of Origin")) {
                Text(name)
            }
        }
    }
}
