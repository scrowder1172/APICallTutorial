//
//  MainView.swift
//  APICallTutorial
//
//  Created by SCOTT CROWDER on 3/18/24.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            PostListView()
                .tabItem {
                    Label("Posts", systemImage: "doc.text")
                }
            UserListView()
                .tabItem {
                    Label("Users", systemImage: "person.3")
                }
        }
    }
}

#Preview {
    MainView()
}
