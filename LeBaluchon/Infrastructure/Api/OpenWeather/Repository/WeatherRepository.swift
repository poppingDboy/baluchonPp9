//
//  WeatherRepository.swift
//  LeBaluchon
//
//  Created by MARTEAU Dylan on 24/10/2023.
//

import Foundation

struct WeatherRepository {
    
    func getWeather(completion: @escaping (Bool, OpenWeatherModel?) -> Void) {
        let accessKey = KeysAPI.weatherKey.rawValue
        let city = "Paris"
        
        let urlString = "\(OpenWeatherApi.baseURL)?q=\(city)&APPID=\(accessKey)"
        
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
                    let weatherResponse = try JSONDecoder().decode(OpenWeatherModel.self, from: data)
                    completion(true, weatherResponse)
                } catch {
                    print(error)
                    completion(false, nil)
                }
            }
        }
        task.resume()
        
    }
    
}
