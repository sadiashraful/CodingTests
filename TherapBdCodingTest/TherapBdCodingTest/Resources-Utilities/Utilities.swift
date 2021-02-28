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

struct Response: Codable {
    var items: Item
}

struct Item: Codable {
    var name: String
    var owner: Owner
    var description: String
}

struct Owner: Codable {
    var avatar_url: String
}
