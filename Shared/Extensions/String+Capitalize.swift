//
//  String+Capitalize.swift
//  Clematis
//
//  Created by Kyle Erhabor on 9/20/20.
//

extension String {
    func capitalizeFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }
}
