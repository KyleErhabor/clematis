//
//  Color+Hex.swift
//  Anime Catalog
//
//  Created by Kyle Erhabor on 9/20/20.
//

import SwiftUI

extension Color {
    init(hex: Int, alpha: Double = 1) {
        let rgb = (
            r: Double((hex >> 16) & 0xFF) / 255,
            g: Double((hex >> 08) & 0xFF) / 255,
            b: Double((hex >> 00) & 0xFF) / 255
        )

        self.init(
            .sRGB,
            red: rgb.r,
            green: rgb.g,
            blue: rgb.b,
            opacity: alpha
        )
    }
}
