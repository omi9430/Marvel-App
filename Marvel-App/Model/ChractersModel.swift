//
//  ChractersModel.swift
//  Marvel-App
//
//  Created by omair khan on 01/06/2022.
//

import Foundation

//MARK: - Data Model
struct ChracterData: Codable {
    let status: String
    let data: ChractersResult
}

struct ChractersResult: Codable {
    
    let limit: Int?
    let numberOfCharacter: Int?
    let characters: [Result]?
    
    enum CodingKeys: String, CodingKey{
        case numberOfCharacters = "count"
        case characters = "results"
        case limit
    }
    
        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            numberOfCharacter = try values.decodeIfPresent(Int.self, forKey: .numberOfCharacters)
            limit = try values.decodeIfPresent(Int.self, forKey: .limit)
            characters = try values.decodeIfPresent([Result].self, forKey: .characters)
        }
    
        func encode(to encoder: Encoder) throws {
            var values = encoder.container(keyedBy: CodingKeys.self)
            try values.encodeIfPresent(self.numberOfCharacter, forKey: .numberOfCharacters)
            try values.encodeIfPresent(self.characters, forKey: .characters)
            try values.encodeIfPresent(self.limit, forKey: .limit)
        }
}


//MARK: - Result Model
struct Result: Codable {
    let id: Int?
    let name: String?
    let resultDescription: String?
    let thumbnail: Thumbnail?


    enum CodingKeys: String, CodingKey {
        case id, name
        case resultDescription = "description"
        case thumbnail
    }
}

// MARK: - Thumbnail
struct Thumbnail: Codable {
    let path : String?
    let fileExtension : String?

    enum CodingKeys: String, CodingKey {
        case path
        case fileExtension = "extension"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        path = try values.decodeIfPresent(String.self, forKey: .path)
        fileExtension = try values.decodeIfPresent(String.self, forKey: .fileExtension)
    }

}
