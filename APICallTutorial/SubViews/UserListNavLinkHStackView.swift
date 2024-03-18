//
//  UserListNavLinkHStackView.swift
//  APICallTutorial
//
//  Created by SCOTT CROWDER on 3/18/24.
//

import SwiftUI

struct UserListNavLinkHStackView: View {
    
    let user: User
    
    var body: some View {
        HStack {
            Text("\(user.id)")
                .padding()
                .overlay(Circle().stroke(.blue))
            Text(user.name)
        }
    }
}

#Preview {
    UserListNavLinkHStackView(user: User.Example)
}
