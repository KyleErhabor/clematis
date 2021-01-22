//
//  MediaStatsDistributionView.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 1/19/21.
//

import SwiftUI

//typealias ScoreDistribution = MediaQuery.Data.Medium.Stat.ScoreDistribution

struct MediaStatsDistributionView: View {
    @EnvironmentObject private var viewModel: MediaViewModel

    var body: some View {
        EmptyView() // TODO
//        let distributons = viewModel.media?.stats?.scoreDistribution?.compactMap(filterMissingFields)
//
//        if let distrubtions = distributons, !distrubtions.isEmpty {
//            GroupBox(label: Text("Score")) {
//                HStack {
//                    ForEach(distrubtions, id: \.amount) { distro in
//                        VStack {
//                            Text("\(distro.amount!)")
//                                .font(.caption)
//
//                            Capsule()
//                                .colorMultiply(.red)
//
//                            Text("\(distro.score!)")
//                                .font(.caption)
//                        }
//                    }
//                }
//            }
//        }
    }

//    func filterMissingFields(row: ScoreDistribution?) -> ScoreDistribution? {
//        if row?.score == nil || row?.amount == nil {
//            return nil
//        }
//
//        return row
//    }
}

struct MediaStatsDistributionView_Previews: PreviewProvider {
    static var previews: some View {
        MediaStatsDistributionView()
    }
}
