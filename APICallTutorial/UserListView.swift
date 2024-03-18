//
//  UserListView.swift
//  APICallTutorial
//
//  Created by SCOTT CROWDER on 3/18/24.
//

import SwiftUI

struct UserListView: View {
    
    @State private var viewModel: UserViewModel = UserViewModel()
    @State private var textToSearch: String = ""
    
    let userURL: String = "https://jsonplaceholder.typicode.com/users"
    
    var filteredData: [User] {
        if textToSearch.isEmpty {
            return viewModel.userData
        }
        
//        return viewModel.userData.filter { $0.name.localizedStandardContains(textToSearch)}
        return viewModel.userData.filter { user in
            textToSearch.split(separator: " ").allSatisfy { string in
                user.name.localizedStandardContains(string)
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
                    }
                } else if viewModel.isNetworkSleeping {
                    ProgressView("Refreshing data")
                } else if viewModel.userData.isEmpty {
                    ContentUnavailableView {
                        Label("No User Data", systemImage: "globe")
                    } description: {
                        Text("Please load the data before continuing.")
                    } actions: {
                        Button("Load Data") {
                            downloadData()
                        }
                        .buttonStyle(.borderedProminent)
                    }
                } else {
                    List(filteredData) { user in
                        NavigationLink(value: user) {
                            UserListNavLinkHStackView(user: user)
                        }
                    }
                    .searchable(text: $textToSearch, prompt: "Search")
                }
            }
            .navigationDestination(for: User.self) { user in
                UserListNavDestinationView(user: user)
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Refresh", systemImage: "arrow.down.circle") {
                        downloadData()
                    }
                }
            }
            .navigationTitle("Users")
        }
        
    }
    
    func downloadData() {
        Task {
            await viewModel.fetchData(userURL: userURL)
        }
    }
}

#Preview("Users") {
    UserListView()
}

#Preview("Main") {
    MainView()
}





