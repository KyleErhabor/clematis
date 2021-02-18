//
//  RulesNoticeView.swift
//  Clematis (iOS)
//
//  Created by Kyle Erhabor on 2/10/21.
//

import SwiftUI

/// A view for including a rules notice.
///
/// This view features a `NavigationLink` including a notice to review AniList guidelines before posting. The destination points to the [AniList Guidelines & Data
/// Submissions](https://anilist.co/forum/thread/14) thread for more details.
struct RulesNoticeView: View {
    var body: some View {
        // FIXME: When in a presentation, slightly sliding the view up (but not dismissing it) may cause the view to
        // spaz out of control. This may include going back and forward ~2 times or unexpectly dismissing itself when
        // it shouldn't.
        NavigationLink("Please review the AniList guidelines before posting.",
                       destination: ThreadView(viewModel: .init(id: 14)))
    }
}

struct RulesNoticeView_Previews: PreviewProvider {
    static var previews: some View {
        RulesNoticeView()
    }
}
