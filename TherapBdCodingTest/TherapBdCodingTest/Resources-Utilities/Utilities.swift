//
//  Utilities.swift
//  TherapBdCodingTest
//
//  Created by Mohammad Ashraful Islam Sadi on 28/2/21.
//

import Foundation
import UIKit

struct API {
    static var url = "https://api.github.com/search/repositories?q=language:Swift&sort=stars&order=desc"
}



// MARK: - Response
struct Response: Codable {
    let items: [Item]

    enum CodingKeys: String, CodingKey {
        case items
    }
}

// MARK: - Item
struct Item: Codable {

    let nodeID, name, fullName: String

    let owner: Owner

    let itemDescription: String?

    enum CodingKeys: String, CodingKey {

        case nodeID = "node_id"
        case name
        case fullName = "full_name"

        case owner

        case itemDescription = "description"
    }
}

// MARK: - Owner
struct Owner: Codable {

    let avatarURL: String


    enum CodingKeys: String, CodingKey {

        case avatarURL = "avatar_url"

    }
}

