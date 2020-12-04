//
//  RichView.swift
//  Amincapp
//
//  Created by Kyle Erhabor on 11/28/20.
//

import SwiftSoup

func removeHTML(html: String) -> String {
    if let document = try? SwiftSoup.parseBodyFragment(html) {
        if let text = try? document.text() {
            return text
        }
    }

    return html
}
