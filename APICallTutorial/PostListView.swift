//
//  PostListView.swift
//  APICallTutorial
//
//  Created by SCOTT CROWDER on 3/18/24.
//

import SwiftUI

struct PostListView: View {
    
    @State private var viewModel: PostViewModel = PostViewModel()
    @State private var textToSearch: String = ""
    
    let postURL: String = "https://jsonplaceholder.typicode.com/posts"
    
    var filteredData: [Post] {
        if textToSearch.isEmpty {
            return viewModel.postData
        }
        
        return viewModel.postData.filter { post in
            textToSearch.split(separator: " ").allSatisfy { string in
                post.title.localizedStandardContains(string)
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            Group {
                if viewModel.errorCaught {
                    ContentUnavailableView {
                        Label("Data Refresh Failed", systemImage: "antenna.radiowaves.left.and.right.slash")
                    } description: {
                        Text("The app was unable to download the requested data. Please try again later.")
                    } actions: {
                        Button("Refresh Data") {
                            downloadData()
                        }
                        .buttonStyle(.borderedProminent)
                    }
                } else if viewModel.isNetworkSleeping {
                    ProgressView("Refreshing data")
                } else if viewModel.postData.isEmpty {
                    ContentUnavailableView {
                        Label("No Post Data", systemImage: "globe")
                    } description: {
                        Text("Please load the data before continuing.")
                    } actions: {
                        Button("Load Data") {
                            downloadData()
                        }
                        .buttonStyle(.borderedProminent)
                    }
                } else {
                    List(filteredData) { post in
                        NavigationLink(value: post) {
                            NavLinkPostHStackView(post: post)
                        }
                    }
                    .searchable(text: $textToSearch, prompt: "Search")
                }
            }
            .navigationDestination(for: Post.self) { post in
                NavLinkDestintionHStackView(post: post)
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Refresh", systemImage: "arrow.down.circle") {
                        downloadData()
                    }
                }
            }
            .navigationTitle("Posts")
        }
    }
    
    func downloadData() {
        Task {
            await viewModel.fetchData(postURL: postURL)
        }
    }
}

#Preview("Posts") {
    PostListView()
}

#Preview("Main") {
    MainView()
}


