//
//  UserOverviewView.swift
//  Anime Catalog
//
//  Created by Kyle Erhabor on 10/3/20.
//

import SwiftUI

struct UserOverviewView: View {
    let geometry: GeometryProxy

    var body: some View {
        ScrollView {
            // FIXME: See issue #1
            Text("<TODO>").frame(maxWidth: .infinity)
        }.frame(width: geometry.size.width / 1.1, height: 150)
        .background(Color.primary.opacity(0.1))
        .cornerRadius(10)
    }
}

struct UserOverviewView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { geometry in
            UserOverviewView(geometry: geometry)
        }
    }
}
