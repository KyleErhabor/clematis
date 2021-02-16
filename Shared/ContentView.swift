//
//  ContentView.swift
//  Shared
//
//  Created by Kyle Erhabor on 9/4/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        // NOTE: "displayModeButtonItem is internally managed and not exposed for DoubleColumn style. Returning an
        // empty, disconnected UIBarButtonItem to fulfill the non-null contract."
        //
        // This error appears unless `.navigationViewStyle(_:)` is called.
        TabNavigationView()
            .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
