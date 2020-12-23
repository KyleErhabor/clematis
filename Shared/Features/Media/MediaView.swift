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


//            let tabView = TabView {
//                MediaPageOverviewView().tabItem {
//                    Label("Overview", systemImage: "scroll")
//                }
//
//                MediaPageCharactersView().tabItem {
//                    Label("Characters", systemImage: "eyes")
//                }
//            }.animation(.default)
//
//            #if os(macOS)
//            tabView
//
//            #else
//            tabView
//                .tabViewStyle(PageTabViewStyle())
//                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
//
//            #endif
        }.currentUser()
        .navigationTitle("\(viewModel.media?.title?.userPreferred ?? "")")
//        .navigationBarTitleDisplayMode(.inline)
        .edgesIgnoringSafeArea(.top)
        .environmentObject(viewModel)
        .onAppear {
            viewModel.fetchMedia()
        }
    }
}

struct MediaHeaderView: View {
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
