//
//  CharacterModel.swift
//  Characters
//
//  Created by stimLite on 13.06.2022.
//

import Foundation


struct CharacterModel: Codable {
    var results: [ResultModel]
}

struct ResultModel: Codable {
    let id: Int
    let name: String
    let image: String
}
