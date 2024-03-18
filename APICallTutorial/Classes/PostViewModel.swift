//
//  PostViewModel.swift
//  APICallTutorial
//
//  Created by SCOTT CROWDER on 3/18/24.
//

import Foundation

@Observable
final class PostViewModel {
    var postData: [Post] = [Post]()
    
    var errorCaught: Bool = false
    var isNetworkSleeping: Bool = false
    
    func fetchData(postURL: String) async {
        clearPostData()
        
        do {
            isNetworkSleeping = true
            await WebService().simulateNetworkSleep()
            
            guard let downloadedPosts: [Post] = try await WebService().downloadData(fromURL: postURL) else { return }
            postData = downloadedPosts
            isNetworkSleeping = false
        } catch {
            errorCaught = true
            isNetworkSleeping = false
            print("PostViewModel Error: \(error.localizedDescription)")
        }
    }
    
    private func clearPostData() {
        if postData.isEmpty == false {
            postData = []
        }
    }
}
