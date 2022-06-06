//
//  ComicModel.swift
//  Marvel-App
//
//  Created by omair khan on 02/06/2022.
//

import Foundation
//MARK: - Comic Data

struct ComicData: Codable{
    let data: ComicResult?
}

//MARK: Comic Result
struct ComicResult: Codable {
    
    let comics: [Comic]?
    
    enum CodingKeys: String,CodingKey{
        case comics = "results"
    }
    
    init(from decoder:Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        comics = try values.decodeIfPresent([Comic].self, forKey:.comics)
    }
}

//MARK: - Comic
struct Comic: Codable {
    let id: Int?
    let title: String?
    let cover: Thumbnail?
   
    
    enum CodingKeys: String, CodingKey{
        case cover = "thumbnail"
        case id, title
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        cover = try values.decodeIfPresent(Thumbnail.self, forKey: .cover)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        title = try values.decodeIfPresent(String.self, forKey: .title)
    }
    
}
