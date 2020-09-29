//
//  UserView.swift
//  Anime Catalog
//
//  Created by Kyle Erhabor on 9/4/20.
//

import SDWebImageSwiftUI
import SwiftUI

struct UserView: View {
    @Environment(\.verticalSizeClass) private var sizeClass
    @StateObject var viewModel: UserViewModel

    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                let bannerImageURL = viewModel.user?.bannerImage == nil
                    ? nil
                    : URL(string: viewModel.user!.bannerImage!)

                // FIXME: On landscape mode, the user's banner image should take up 1/2 the screen instead of 1/3
                // of the screen on portrait mode. It seems the root cause is due to the web image, as if the
                // background modifier is moved below the frame, the accent color loads with the correct height,
                // but goes back to being too tall.
                WebImage(url: bannerImageURL)
                    .resizable()
                    .scaledToFill()
                    .frame(height: geometry.size.height / (sizeClass == .regular ? 3 : 2))
                    .background(Color.accentColor)
                    .overlay(HStack {
                        let avatarURL = viewModel.user?.avatar?.large == nil
                            ? nil
                            : URL(string: viewModel.user!.avatar!.large!)

                        WebImage(url: avatarURL)
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: 150, maxHeight: 150)

                        Text("\(viewModel.user?.name ?? "")")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .bold()
                            .padding(.top, 80)
                            .shadow(color: .black, radius: 10)
                    }, alignment: .bottomLeading)

                if viewModel.user?.about != nil {
                    // TODO: See issue #1
                    Text("")
                }
            }
        }.edgesIgnoringSafeArea(.all)
        .animation(.default)
        .onAppear {
            viewModel.loadUser()
        }
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView(viewModel: UserViewModel(id: 164560))
        UserView(viewModel: UserViewModel(id: 1))
        UserView(viewModel: UserViewModel(id: 43326))
        UserView(viewModel: UserViewModel(id: 427436))
    }
}
