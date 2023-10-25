//
//  CurrencyViewModel.swift
//  LeBaluchon
//
//  Created by MARTEAU Dylan on 12/09/2023.
//

import Foundation

class CurrencyViewModel: ObservableObject {
    //    @Published var fixerResponse: FixerModel?
    @Published var fixerRates: [String:Double] = [:]
    @Published var error: Error?
    
    @Published var inputAmount = ""
    @Published var outputAmount = ""
    @Published var inputCurrency: Currency = .EUR
    @Published var outputCurrency: Currency = .USD
    
    var dateSave: String = ""
    
    let currencyRepository = CurrencyRepository()
    
    func fetchCurrency() {
        // formateur de date pour le format "yyyy-MM-dd"
        let dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            return formatter
        }()
        
        // date du jour
        let currentDate = Date()
        // date du jour converti
        let formattedDate = dateFormatter.string(from: currentDate)
        
        // date sauvegarder
        if let lastUpdate = UserDefaults.standard.string(forKey: "CURRENCY_DATE") {
            dateSave = lastUpdate
        }
        
        // comparatif date jour avec date sauvegarder
        // si différentes
        if dateSave != formattedDate {
            currencyRepository.getCurrency { success, response in
                guard let response = response else {
                    self.error = NSError(domain: "CurrencyViewModelErrorDomain", code: 1, userInfo: [NSLocalizedDescriptionKey: "Failed to get response data."])
                    return
                }
                
                if success {
                    UserDefaults.standard.set(response.base, forKey: "CURRENCY_BASE")
                    UserDefaults.standard.set(response.date, forKey: "CURRENCY_DATE")
                    UserDefaults.standard.set(response.rates, forKey: "CURRENCY_RATES")
                    
                    self.fixerRates = response.rates
                    self.error = nil
                    
                    self.convertCurrency()
                    print("Success Success")
                    
                } else {
                    self.fixerRates = [:]
                    self.error = NSError(domain: "CurrencyErrorDomain", code: 1, userInfo: [NSLocalizedDescriptionKey: "Failed to fetch currency data."])
                    print("Else Else")
                }
                
            }
            
            
        } else {
            // si similaire
            // pioche à l'intérieur
            print("Inside Inside")
            guard let rates = UserDefaults.standard.dictionary(forKey: "CURRENCY_RATES") as? [String:Double] else {
                self.error = NSError(domain: "CurrencyViewModelErrorDomain", code: 1, userInfo: [NSLocalizedDescriptionKey: "Failed to rates."])
                return
            }
            
            self.fixerRates = rates
            self.error = nil
            
            self.convertCurrency()
            
            
        }
    }
    
    func convertCurrency() {
        guard let inputAmount = Double(inputAmount) else {
            self.error = NSError(domain: "ConvertCurrencyErrorDomain", code: 1, userInfo: [NSLocalizedDescriptionKey: "Failed to convert currency data."])
            return
        }
        
        // Convertir outputCurrency (enum) en String
        let outputCurrencyString = outputCurrency.rawValue
        
        // Vérifier si la clé existe dans le dictionnaire rates
        if let exchangeRate = fixerRates[outputCurrencyString] {
            let convertedAmount = inputAmount * exchangeRate
            outputAmount = String(format: "%.2f", convertedAmount)
        } else {
            self.error = NSError(domain: "ConvertCurrencyErrorDomain", code: 1, userInfo: [NSLocalizedDescriptionKey: "Failed to find exchange rate for selected currency."])
        }
    }
    
    
    enum Currency: String, CaseIterable, Identifiable {
        // list currency
        case EUR, USD, JPY, GBP, AUD
        
        var displayName: String {
            switch self {
            case .EUR: return "Euro"
            case .USD: return "US Dollar"
            case .JPY: return "Japanese Yen"
            case .GBP: return "British Pound"
            case .AUD: return "Australian Dollar"
            }
        }
        
        var id: String { self.rawValue }
    }
    
    
}
