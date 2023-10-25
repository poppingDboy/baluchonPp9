//
//  CurrencyRepository.swift
//  LeBaluchon
//
//  Created by MARTEAU Dylan on 28/09/2023.
//

import Foundation

struct CurrencyRepository {
    
    func getCurrency(completion: @escaping (Bool, FixerModel?) -> Void) {
        let accessKey = KeysAPI.currencyKey.rawValue
        let urlString = "\(FixerApi.baseURL)?access_key=\(accessKey)"
        
        guard let url = URL(string: urlString) else {
            completion(false, nil)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                guard let data = data, error == nil else {
                    completion(false, nil)
                    return
                }
                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                    completion(false,nil)
                    return
                }
                do {
                    let currencyResponse = try JSONDecoder().decode(FixerModel.self, from: data)
                    completion(true, currencyResponse)
                } catch {
                    print(error)
                    completion(false, nil)
                }
            }
        }
        task.resume()
        
    }
    
}
