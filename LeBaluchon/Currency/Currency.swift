//
//  Currency.swift
//  LeBaluchon
//
//  Created by MARTEAU Dylan on 18/09/2023.
//

import Foundation

class Currency: Decodable {
    let success: Bool
    let timestamp: Int
    let base: String
    let date: String
    let rates: [String:Double]
    
    init(success: Bool, timestamp: Int, base: String, date: String, rates: [String : Double]) {
        self.success = success
        self.timestamp = timestamp
        self.base = base
        self.date = date
        self.rates = rates
    }
    
}
