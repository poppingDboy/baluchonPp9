//
//  CurrencyModel.swift
//  LeBaluchon
//
//  Created by MARTEAU Dylan on 28/09/2023.
//

import Foundation

struct FixerModel : Codable {
    let success: Bool?
    let timestamp: Int
    let base: String
    let date: String
    let rates: [String: Double]
}
