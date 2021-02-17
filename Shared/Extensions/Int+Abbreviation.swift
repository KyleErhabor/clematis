//
//  Int+abbreviated.swift
//  Clematis (iOS)
//
//  Created by Kyle Erhabor on 1/10/21.
//

import Foundation

extension Int {
    /// Returns an abbreviated string of the number.
    ///
    /// If the number is less than 1,000, the number is not abbreviated and returned as-is. The units supported are K, M, G, T, P, and E. Anything higher may
    /// result in inaccurate abbreviation.
    var abbreviated: String {
        if self < 1000 {
            return "\(self)"
        }

        let units = ["K", "M", "G", "T", "P", "E"]
        let sign = self > 0 ? "" : "-"

        let num = Double(self)
        let exponent = Int(log10(num) / 3)
        let rounded = round(10 * num / pow(1000, Double(exponent))) / 10

        // Anything higher than six may result in an out of bounds fatal error.
        return "\(sign)\(rounded)\(units[Swift.min(exponent, 6) - 1])"
    }
}
