//
//  MediaOverviewView.swift
//  Clematis (iOS)
//
//  Created by Kyle Erhabor on 2/21/21.
//

import SDWebImageSwiftUI
import SwiftUI

struct MediaOverviewView: View {
    @EnvironmentObject private var viewModel: MediaViewModel
    @State private var sheet = false

    var body: some View {
        VStack {
            HStack(alignment: .bottom) {
                WebImage(url: URL(string: viewModel.media?.coverImage?.extraLarge ?? ""))
                    .resizable()
                    .placeholder {
                        if let hex = viewModel.media?.coverImage?.color,
                           let color = Int("\(hex)", radix: 16) {
                            Color(hex: color)
                        } else {
                            Color.accentColor
                        }
                    }.scaledToFill()
                    .frame(width: 108, height: 162)
                    .clipped()
                    .cornerRadius(4)

                // This HStack is required to center both buttons since the first one has padding.
                HStack {
                    let locked = viewModel.media?.isLocked == true

                    Button {
                        sheet = true
                    } label: {
                        let title: String = {
                            if locked {
                                return "Locked"
                            } else if let status = viewModel.media?.mediaListEntry?.status,
                                      let type = viewModel.media?.type {
                                return AniList.statusString(status: status, type: type)
                            }

                            return "Add to List"
                        }()

                        Label("\(title)", systemImage: locked ? "pencil.slash" : "pencil")
                            .font(.headline)
                            .padding(8)
                            .background(Color.accentColor)
                            .foregroundColor(.white)
                            .cornerRadius(4)
                    }.sheet(isPresented: $sheet) {
                        MediaEditorView(viewModel: MediaEditorViewModel(id: viewModel.id))
                    }.disabled(locked)

                    Spacer()

                    Button {
                        viewModel.favorite()
                    } label: {
                        Image(systemName: viewModel.media?.isFavourite == true ? "heart.fill" : "heart")
                    }.disabled(locked)
                }
            }.frame(height: 162)
        }
    }
}

struct MediaOverviewView_Previews: PreviewProvider {
    static var previews: some View {
        MediaOverviewView()
    }
}
