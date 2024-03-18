//
//  UserDetailsView.swift
//  APICallTutorial
//
//  Created by SCOTT CROWDER on 3/18/24.
//

import SwiftUI

struct UserDetailsView: View {
    
    let title: String
    let detail: String
    
    var body: some View {
        VStack(alignment: .leading){
            Text(title)
                .font(.caption)
                .foregroundStyle(.secondary)
            Text(detail)
        }
    }
}


#Preview {
    UserDetailsView(title: "Something", detail: "Needed data")
}
