//
//  MediaPropertyTitleView.swift
//  Clematis (iOS)
//
//  Created by Kyle Erhabor on 1/18/21.
//

import SwiftUI

struct MediaPropertyTitleView: View {
    @EnvironmentObject private var viewModel: MediaViewModel

    var body: some View {
        let langs = totalLanguages()

        if langs.count != 0 {
            MediaPropertyView("Title") {
                Text("\(ListFormatter.localizedString(byJoining: langs))")
            } expanded: {
                let title = viewModel.media!.title!

                VStack {
                    if let english = title.english {
                        MediaPropertyView("English") {
                            Text(english)
                        }
                    }

                    if let romaji = title.romaji {
                        MediaPropertyView("Romaji") {
                            Text(romaji)
                        }
                    }

                    if let native = title.native {
                        MediaPropertyView("Native") {
                            Text(native)
                        }
                    }
                }
            }
        }
    }

    func totalLanguages() -> [String] {
        var langs = [String]()

        if let title = viewModel.media?.title {
            if title.english != nil {
                langs.append("English")
            }

            if title.romaji != nil {
                langs.append("Romaji")
            }

            if title.native != nil {
                langs.append("Native")
            }
        }

        return langs
    }
}

struct MediaPropertyTitleView_Previews: PreviewProvider {
    static var previews: some View {
        MediaPropertyTitleView()
    }
}
