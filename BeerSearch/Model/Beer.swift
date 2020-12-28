//
//  Beer.swift
//  BeerSearch
//
//  Created by Leonardo Amorim on 17/12/20.
//

import Foundation

// MARK: - WelcomeElement
struct Beer: Codable {
    let id: Int
    let name, tagline, firstBrewed, welcomeDescription: String
    let imageURL: String
    
    enum CodingKeys: String, CodingKey {
        case id, name, tagline
        case firstBrewed = "first_brewed"
        case welcomeDescription = "description"
        case imageURL = "image_url"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        tagline = try values.decode(String.self, forKey: .tagline)
        firstBrewed = try values.decode(String.self, forKey: .firstBrewed)
        welcomeDescription = try values.decode(String.self, forKey: .welcomeDescription)
        imageURL = try values.decode(String.self, forKey: .imageURL)
        
    }
}
