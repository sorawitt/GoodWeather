//
//  WeatherService.swift
//  GoodWeather
//
//  Created by Sorawit Trutsat on 10/7/2565 BE.
//

import Foundation

class WeatherService {
    func getWeather(city: String, completion: @escaping (Weather?) -> ()) {
        let apiKey = "YOUR API KEY..."
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(apiKey)&units=metric")
        else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            let weatherResponse = try? JSONDecoder().decode(WeatherResponse.self, from: data)
            completion(weatherResponse?.main)
        }
        .resume()
    }
}
