//
//  TraductionResponse.swift
//  LeBaluchon
//
//  Created by MARTEAU Dylan on 26/09/2023.
//

import Foundation

struct TraductionReponse: Codable {
    let translations: [Translation]
    
}

struct Translation: Codable {
    let detected_source_language: String
    let text: String
}
