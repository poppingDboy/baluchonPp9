////
////  CurrencyAPI.swift
////  LeBaluchon
////
////  Created by MARTEAU Dylan on 12/09/2023.
////
//
////Model
////Vue
////Controller
//
////model vue vue model
//
//import Foundation
//
//class CurrencyAPI {
////    private let currencyURL = URL(string: "http://data.fixer.io/api/latest?access_key=\(KeysAPI.currencyKey.rawValue)")!
//}
//
//
////static func getCurrencyPost(callback: @escaping (Bool, Currency?) -> Void) {
////    var request = URLRequest(url: currencyURL)
////    request.httpMethod = "POST"
////
////    let body = "method=getCurrency&format=json&lang=en"
////    request.httpBody = body.data(using: .utf8)
////
////    //        request.setValue(<#T##value: String?##String?#>, forHTTPHeaderField: <#T##String#>)
////
////    let session = URLSession(configuration: .default)
////    let task = session.dataTask(with: request) { data, response, error in
////        DispatchQueue.main.async {
////            guard let data = data, error == nil else {
////                callback(false, nil)
////                return
////            }
////            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
////                callback(false,nil)
////                return
////            }
////            guard let responseJSON = try? JSONDecoder().decode([String: String].self, from: data),
////                  let base = responseJSON["base"],
////                  let date = responseJSON["date"]
////            else {
////                callback(false,nil)
////                return
////            }
////            getCurrency { data in
////                guard let data = data else {
////                    callback(false, nil)
////                    return
////                }
////                print(data)
////                print(base)
////                print(date)
////                callback(true, nil)
////                return
////            }
////        }
////    }
////    task.resume()
////
////}
//
////static func getCurrency(completionHandler: @escaping (Data?) -> Void) {
////    let session = URLSession(configuration: .default)
////    let task = session.dataTask(with: currencyURL) { data, response, error in
////        DispatchQueue.main.async {
////            guard let data = data, error == nil else {
////                completionHandler(nil)
////                return
////            }
////            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
////                completionHandler(nil)
////                return
////            }
////            completionHandler(data)
////        }
////    }
////    task.resume()
////}
