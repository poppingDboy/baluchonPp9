//
//  TraductionAPI.swift
//  LeBaluchon
//
//  Created by MARTEAU Dylan on 26/09/2023.
//

import Foundation

class TraductionAPI {
//    private let traductionURL = URL(string: "https://api-free.deepl.com/v2/translate?Authorization=\(KeysAPI.traductionKey)&Content-Type=application/json")!
    
    func getTraduction(completion: @escaping (Bool, TraductionReponse?) -> Void) {
        let accessKey = KeysAPI.traductionKey.rawValue
        let urlString = "\(DeeplApi.baseURL)=\(KeysAPI.traductionKey.rawValue)&Content-Type=application/json"
        
        guard let url = URL(string: urlString) else {
            completion(false, nil)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
//        let body = "method=getCurrency&format=json&lang=en"
//        request.httpBody = body.data(using: .utf8)
        
//        request.setValue(<#T##value: String?##String?#>, forHTTPHeaderField: <#T##String#>)
        
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
                    let traductionResponse = try JSONDecoder().decode(TraductionReponse.self, from: data)
                    completion(true, traductionResponse)
                } catch {
                    completion(false, nil)
                }
            }
        }
        task.resume()
        
    }
    
}
