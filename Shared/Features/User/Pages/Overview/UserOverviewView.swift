//
//  UserOverviewView.swift
//  Anime Catalog
//
//  Created by Kyle Erhabor on 10/3/20.
//

import SwiftUI

struct UserOverviewView: View {
    @EnvironmentObject private var viewModel: UserViewModel

    var body: some View {
        // FIXME: GeometryReader can't be used in this context. The reader is reinvoked several times in the body (7),
        // which causes a spam reaction. This may be due to the pagination behavior that's occurring in the parent
        // view (tabs as pages). This issue effects the placement of views (portrait vs. landscale, alignment, etc.)
        // and HTTP network requests (429s).
        // - Changing VStack to Group caused UserOverwriteViewModel to not initialize itself several times (7), but
        // instead caused the `.onAppear {...}` modifier to reinvoke itself several times instead.
        // - Changing VStack to Group is not a solution as it does not allow the content to be grouped under one page,
        // causing it to give each content its own separate page. This is not what we want.
        VStack {
            ScrollView {
                // FIXME: See issue #1
                Text("<...> (user bio)").frame(maxWidth: .infinity, maxHeight: .infinity)
            }.frame(height: 150)
            .background(Color.secondary.opacity(0.1))
            .cornerRadius(10)

            UserOverviewActivityView(viewModel: UserOverviewViewModel(id: viewModel.id))
        }
    }
}

fileprivate struct UserOverviewActivityView: View {
    @StateObject var viewModel: UserOverviewViewModel

    var body: some View {
        NavigationView {
            List(viewModel.activities, id: \.id) { activity in
                if let listActivity = activity.asListActivity {
                    UserOverviewActivityListView(activity: listActivity)
                }
            }.navigationBarTitle("Activity").navigationBarTitleDisplayMode(.inline)
        }.navigationViewStyle(StackNavigationViewStyle())
        .onAppear {
            viewModel.loadUserActivity()
        }
    }
}

struct UserOverviewView_Previews: PreviewProvider {
    static var previews: some View {
        UserOverviewView().environmentObject(UserViewModel(id: 164560))
        UserOverviewView().environmentObject(UserViewModel(id: 1))
        UserOverviewView().environmentObject(UserViewModel(id: 427436))
    }
}
