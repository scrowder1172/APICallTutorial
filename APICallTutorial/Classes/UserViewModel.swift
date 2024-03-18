//
//  UserViewModel.swift
//  APICallTutorial
//
//  Created by SCOTT CROWDER on 3/18/24.
//

import Foundation

@Observable
final class UserViewModel {
    var userData: [User] = [User]()
    
    var errorCaught: Bool = false
    var isNetworkSleeping: Bool = false
    
    func fetchData(userURL: String) async {
        clearUserData()
        
        do {
            isNetworkSleeping = true
            await WebService().simulateNetworkSleep()
            
            guard let downloadedUsers: [User] = try await WebService().downloadData(fromURL: userURL) else { return }
            userData = downloadedUsers
            isNetworkSleeping = false
        } catch {
            errorCaught = true
            isNetworkSleeping = false
            print("UserViewModel Error: \(error.localizedDescription)")
        }
        
    }
    
    private func clearUserData() {
        if userData.isEmpty == false {
            userData = []
        }
    }
}
