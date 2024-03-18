//
//  User.swift
//  APICallTutorial
//
//  Created by SCOTT CROWDER on 3/18/24.
//

import Foundation

struct User: Hashable, Identifiable, Codable {
    let id: Int
    let name: String
    let username: String
    let email: String
    let address: UserAddress
    let phone: String
    let website: String
    let company: UserCompany
    
    var websiteFormatted: String {
        return "https://\(website)"
    }
    
    static var Example: User = User(id: 999, name: "Joe Example", username: "sample.user", email: "sample.user@user.sample.info", address: UserAddress.ExampleAddress, phone: "(555) 555-1234", website: "example.com", company: UserCompany.ExampleCompany)
}

struct UserAddress: Hashable, Codable, Equatable {
    enum CodingKeys: String, CodingKey {
        case street, suite, city, zipCode = "zipcode", geo
    }
    
    let street: String
    let suite: String
    let city: String
    let zipCode: String
    let geo: UserAddressGeo
    
    var userLocation: String {
        return """
\(street), \(suite)
\(city), \(zipCode)
\(geo.latitude), \(geo.longitude)
"""
    }
    
    static var ExampleAddress: UserAddress = UserAddress(street: "123 Main Street", suite: "Suite 100", city: "Elmwood", zipCode: "90210", geo: UserAddressGeo.ExampleGeo)
}

struct UserAddressGeo: Hashable, Codable, Equatable {
    enum CodingKeys: String, CodingKey {
        case latitude = "lat", longitude = "lng"
    }
    
    let latitude: String
    let longitude: String
    
    static var ExampleGeo: UserAddressGeo = UserAddressGeo(latitude: "-21.112", longitude: "90.114")
}

struct UserCompany: Hashable, Codable, Equatable {
    enum CodingKeys: String, CodingKey {
        case companyName = "name", catchPhrase, additionalInfo = "bs"
    }
    
    let companyName: String
    let catchPhrase: String
    let additionalInfo: String
    
    static var ExampleCompany: UserCompany = UserCompany(companyName: "Acme Bricks", catchPhrase: "We drop them on your head", additionalInfo: "Bricks Pain Falling")
}
