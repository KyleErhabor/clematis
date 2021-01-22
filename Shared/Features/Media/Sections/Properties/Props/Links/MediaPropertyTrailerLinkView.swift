//
//  MediaPropertyTrailerLinkView.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 1/18/21.
//

import SwiftUI

struct MediaPropertyTrailerLinkView: View {
    @EnvironmentObject private var viewModel: MediaViewModel

    var body: some View {
        if let trailer = viewModel.media?.trailer,
           trailer.id != nil && trailer.site != nil,
           let trailerURL = trailerURL() {

            MediaPropertyView("Trailer") {
                Link(destination: trailerURL) {
                    Text(siteName() ?? "Go")
                }
            }
        }
    }

    func trailerURL() -> URL? {
        let trailer = viewModel.media!.trailer!

        switch trailer.site! {
            case "youtube":
                if let id = trailer.id!.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
                    return URL(string: "https://youtube.com/watch?v=\(id))")
                }
            case "dailymotion":
                if let id = trailer.id?.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) {
                    return URL(string: "https://dailymotion.com/video/\(id))")
                }
            default:
                return nil
        }

        return nil
    }

    func siteName() -> String? {
        switch viewModel.media!.trailer!.site! {
            case "youtube": return "YouTube"
            case "dailymotion": return "Dailymotion"
            default: return nil
        }
    }
}

struct MediaPropertyTrailerLinkView_Previews: PreviewProvider {
    static var previews: some View {
        MediaPropertyTrailerLinkView()
    }
}
