//
//  NavLinkPostHStackView.swift
//  APICallTutorial
//
//  Created by SCOTT CROWDER on 3/18/24.
//

import SwiftUI

struct NavLinkPostHStackView: View {
    
    let post: Post
    
    var body: some View {
        HStack {
            Text("\(post.id)")
                .padding()
                .overlay(Circle().stroke(.blue))
            Text(post.title)
                .bold()
                .lineLimit(2)
        }
    }
}

#Preview {
    NavLinkPostHStackView(post: Post.ExamplePost)
}
