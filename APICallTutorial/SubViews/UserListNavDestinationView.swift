//
//  UserListNavDestinationView.swift
//  APICallTutorial
//
//  Created by SCOTT CROWDER on 3/18/24.
//

import SwiftUI

struct UserListNavDestinationView: View {
    
    let user: User
    
    var body: some View {
        Form {
            Section("User Details") {
                UserDetailsView(title: "User ID", detail: user.id.description)
                UserDetailsView(title: "Name", detail: user.name)
                UserDetailsView(title: "Username", detail: user.name)
                UserDetailsView(title: "Email Address", detail: user.email)
                UserDetailsView(title: "Phone Number", detail: user.phone)
                UserDetailsView(title: "Website", detail: user.websiteFormatted)
            }
            Section("Address"){
                UserDetailsView(title: "Address", detail: user.address.userLocation)
            }
            Section("Company Info") {
                UserDetailsView(title: "Company Name", detail: user.company.companyName)
                UserDetailsView(title: "Catch Phrase", detail: user.company.catchPhrase)
                UserDetailsView(title: "Additional Info", detail: user.company.additionalInfo)
            }
        }
    }
}

#Preview {
    UserListNavDestinationView(user: User.Example)
}
