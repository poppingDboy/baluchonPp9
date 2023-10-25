//
//  TraductionViewModel.swift
//  LeBaluchon
//
//  Created by MARTEAU Dylan on 26/09/2023.
//

import Foundation

class TraductionViewModel: ObservableObject {
    @Published var traductionResponse: TraductionReponse?
    @Published var error: Error?
    
    private let traductionAPI = TraductionAPI()
    
    func fetchTraduction() {
        traductionAPI.getTraduction { success, response in
            if success {
                self.traductionResponse = response
                self.error = nil
            } else {
                self.traductionResponse = nil
                self.error = NSError(domain: "CurrencyErrorDomain", code: 1, userInfo: [NSLocalizedDescriptionKey: "Failed to fetch currency data."])
            }
        }
    }
}
