//
//  UserView.swift
//  Amincapp
//
//  Created by Kyle Erhabor on 11/23/20.
//

import SDWebImageSwiftUI
import SwiftUI

struct UserView: View {
    @StateObject var viewModel: UserViewModel

    var body: some View {
        ScrollView {
            UserHeaderView()

            VStack {
                UserStatusTagsView()
                UserAboutView()
                UserFavoritesView()

                if let updatedAt = viewModel.user?.updatedAt {
                    HStack {
                        Spacer()

                        Text("Last Updated ").bold()
                            + Text(Date(timeIntervalSince1970: TimeInterval(updatedAt)),
                                   formatter: RelativeDateTimeFormatter())
                    }.font(.footnote)
                    .foregroundColor(.secondary)
                    .padding(.vertical)
                }
            }.padding(.horizontal)
        }.navigationTitle("\(viewModel.user?.name ?? "")")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                UserToolbarView()
            }
        }.accentColor(profileAccentColor())
        .environmentObject(viewModel)
        .onAppear {
            viewModel.load()
        }
    }

    func profileAccentColor() -> Color? {
        if let color = viewModel.user?.options?.profileColor {
            switch color {
                case "blue": return .blue
                case "purple": return .purple
                case "pink": return .pink
                case "orange": return .orange
                case "red": return .red
                case "green": return .green
                case "gray": return .gray
                default:
                    if let hex = Int(color.dropFirst(), radix: 16) {
                        return .init(hex: hex)
                    }
            }
        }

        return nil
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView(viewModel: UserViewModel(id: 164560))
    }
}
