//
//  UserOverviewView.swift
//  Anime Catalog
//
//  Created by Kyle Erhabor on 10/3/20.
//

import SwiftUI

struct UserOverviewView: View {
    @Environment(\.verticalSizeClass) private var sizeClass
    @EnvironmentObject private var viewModel: UserViewModel

    var body: some View {
        GeometryReader { proxy in
            VStack {
                ScrollView {
                    Text("<...> (user bio)").frame(maxWidth: .infinity, maxHeight: .infinity)
                }.frame(width: proxy.size.width / 1.15, height: 150)
                .background(Color.secondary.opacity(0.1))
                .cornerRadius(10)

                Spacer(minLength: 16)

                HStack(spacing: 25) {
                    let profileColor = viewModel.user?.options?.profileColor?.starts(with: "#") == true
                        ? Color(hex: Int(viewModel.user!.options!.profileColor!.dropFirst(), radix: 16)!)
                        : Color(viewModel.user?.options?.profileColor ?? "AccentColor")

                    VStack {
                        let anime = viewModel.user?.statistics?.anime?.fragments.userStatisticsFragment

                        UserOverviewProgressBarView(progress: 0, color: profileColor).frame(height: 150)

                        GroupBox(label: Text("\(anime?.count ?? 0)")) {
                            Text("Total Anime")
                        }


                        // FIXME: Replace <X> <secs/mins/hrs/days/mths/yrs> for "<X>.<Y> <longest one of the list>".
                        GroupBox(label: Text(Date(
                            timeIntervalSinceNow: TimeInterval((anime?.minutesWatched ?? 0) * 60)
                        ), style: .relative)) {
                            // Replace <TODO> for minutes/hours/days/months/years.
                            // FIXME: Allow text to scale multiple lines.
                            Text("<TODO> Watched")
                        }

                        GroupBox(label: Text(anime?.count == nil ? "N/A" : "\(anime!.meanScore)")) {
                            Text("Mean Score")
                        }
                    }

                    VStack {
                        let manga = viewModel.user?.statistics?.manga?.fragments.userStatisticsFragment

                        UserOverviewProgressBarView(progress: 0, color: profileColor).frame(height: 150)

                        GroupBox(label: Text("\(manga?.count ?? 0)")) {
                            Text("Total Manga")
                        }

                        if manga?.chaptersRead == 0 && manga?.volumesRead != 0 {
                            GroupBox(label: Text("\(manga!.volumesRead)")) {
                                Text("Volumes Read")
                            }
                        } else {
                            GroupBox(label: Text("\(manga?.chaptersRead ?? 0)")) {
                                Text("Chapters Read")
                            }
                        }

                        GroupBox(label: Text(manga?.count == nil ? "N/A" : "\(manga!.meanScore)")) {
                            Text("Mean Score")
                        }
                    }
                }
            }
        }
    }
}

struct UserOverviewProgressBarView: View {
    var progress: Float
    var color: Color

    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 1

        return formatter
    }()

    var body: some View {
        ZStack {
            Circle()
                .trim(from: 0.25, to: 1)
                .stroke(style: StrokeStyle(lineWidth: 16, lineCap: .round))
                .rotationEffect(Angle(degrees: 45))
                .opacity(0.3)
                .foregroundColor(color)

            Circle()
                .trim(from: 0.25, to: CGFloat(progress))
                .stroke(style: StrokeStyle(lineWidth: 16, lineCap: .round))
                .rotationEffect(.degrees(45))
                .foregroundColor(color)

            Text("\(formatter.string(from: NSNumber(value: progress * 100))!)%")
                .font(.largeTitle)
                .bold()
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
