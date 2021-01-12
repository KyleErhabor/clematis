//
//  Int+abbreviated.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 1/10/21.
//

import Foundation

extension Int {
    var abbreviated: String {
        if self < 1000 {
            return "\(self)"
        }

        let units = ["K", "M", "G", "T", "P", "E"]
        let sign = self > 0 ? "" : "-"

        let num = Double(self)
        let exponent = Int(log10(num) / 3)
        let rounded = round(10 * num / pow(1000, Double(exponent))) / 10

        return "\(sign)\(rounded)\(units[exponent - 1])"
    }
}
