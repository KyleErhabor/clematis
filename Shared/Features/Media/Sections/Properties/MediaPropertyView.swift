//
//  MediaPropertyView.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 1/18/21.
//

import SwiftUI

struct MediaPropertyView<Title: View, Content: View, Expanded: View>: View {
    @State private var isExpanded = false
    private let title: Title
    private let content: Content
    private let expanded: Expanded

    var body: some View {
        VStack {
            // FIXME: Attaching a `.contextMenu` modifier to this view won't account for the Spacer
            HStack {
                title.foregroundColor(.secondary)

                Spacer()

                content.lineLimit(1)

                if !(expanded is EmptyView) {
                    Button {
                        isExpanded.toggle()
                    } label: {
                        Image(systemName: "chevron.forward")
                            .rotationEffect(.degrees(isExpanded ? 90 : 0))
                    }
                }
            }

            if isExpanded {
                expanded
                    .padding()
                    .fixedSize(horizontal: false, vertical: true)
            }

            Divider()
        }.animation(.default)
    }

    init(
        @ViewBuilder title: () -> Title,
        @ViewBuilder content: () -> Content,
        @ViewBuilder expanded: () -> Expanded
    ) {
        self.title = title()
        self.content = content()
        self.expanded = expanded()
    }
}

extension MediaPropertyView where Expanded == EmptyView {
    init(@ViewBuilder title: () -> Title, @ViewBuilder content: () -> Content) {
        self.init(title: title, content: content, expanded: { EmptyView() })
    }
}

extension MediaPropertyView where Title == Text {
    init(_ title: String, @ViewBuilder content: () -> Content, @ViewBuilder expanded: () -> Expanded) {
        self.title = Text(title)
        self.content = content()
        self.expanded = expanded()
    }
}

extension MediaPropertyView where Title == Text, Expanded == EmptyView {
    init(_ title: String, @ViewBuilder content: () -> Content) {
        self.init(title, content: content, expanded: { EmptyView() })
    }
}

struct MediaPropertyView_Previews: PreviewProvider {
    static var previews: some View {
        MediaPropertyView("Hello") {
            Text("World!")
        }
    }
}
