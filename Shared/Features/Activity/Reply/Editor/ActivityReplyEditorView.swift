//
//  ActivityReplyEditorView.swift
//  Amincapp (iOS)
//
//  Created by Kyle Erhabor on 2/1/21.
//

import SwiftUI

struct ActivityReplyEditorView: View {
    @Environment(\.presentationMode) private var presentationMode
    @EnvironmentObject private var viewModel: ActivityReplyListViewModel
    @EnvironmentObject private var currentUser: CurrentUser
    @State private var text = ""
    private(set) var reply: ActivityReplyFragment?

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Text"), footer: NavigationLink("Please read the site guidelines before posting", destination: Text("?"))) {
                    TextEditor(text: $text)
                }

                if text != "" {
                    let user: ActivityReplyFragment.User? = {
                        if let user = currentUser.users.first {
                            return .init(id: user.id, name: user.name, avatar: .init(large: user.avatar?.large))
                        }

                        return reply?.user
                    }()

                    Section(header: Text("Preview")) {
                        ScrollView {
                            ActivityReplyView(reply: ActivityReplyFragment(
                                id: -1,
                                isLiked: false,
                                createdAt: Int(Date().addingTimeInterval(-60).timeIntervalSince1970),
                                likeCount: 0,
                                text: "\(text)",
                                user: user,
                                likes: []
                            ))
                        }.disabled(true)
                    }
                }
            }.navigationTitle(reply == nil ? "Add Reply" : "Edit Reply")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        presentationMode.wrappedValue.dismiss()
                    }
                }

                ToolbarItem(placement: .confirmationAction) {
                    Button(reply == nil ? "Publish" : "Save") {
                        viewModel.reply(id: reply?.id, text: text)
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
        }.onAppear {
            if let text = reply?.text {
                self.text = text
            }
        }
    }
}

struct ActivityReplyEditorView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityReplyEditorView()
    }
}
