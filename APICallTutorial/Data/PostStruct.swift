//
//  PostStruct.swift
//  APICallTutorial
//
//  Created by SCOTT CROWDER on 3/18/24.
//

import Foundation

struct Post: Hashable, Identifiable, Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
    
    static var ExamplePost: Post = Post(userId: 999, id: 999, title: "Example Title", body: "This is an example post and should not be considered valid.")
}
