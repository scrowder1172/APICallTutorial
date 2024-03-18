//
//  NavLinkDestintionHStackView.swift
//  APICallTutorial
//
//  Created by SCOTT CROWDER on 3/18/24.
//

import SwiftUI

struct NavLinkDestintionHStackView: View {
    
    let post: Post
    
    var body: some View {
        HStack {
            Text("\(post.id)")
                .padding()
                .overlay(Circle().stroke(.blue))
            VStack(alignment: .leading) {
                Text(post.title)
                    .bold()
                    .lineLimit(1)
                Text(post.body)
                    .font(.caption)
                    .foregroundStyle(.secondary)
                    .lineLimit(2)
            }
        }
    }
}

#Preview {
    NavLinkDestintionHStackView(post: Post.ExamplePost)
}
