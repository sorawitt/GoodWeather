//
//  WeatherViewModel.swift
//  GoodWeather
//
//  Created by Sorawit Trutsat on 10/7/2565 BE.
//

import Foundation
import Combine

class WeatherViewModel: ObservableObject {
    private var weatherService: WeatherService
    
    @Published var weather = Weather()
    
    init() {
        self.weatherService = WeatherService()
    }
    
    var temperature: String {
        if let temp = self.weather.temp {
            return String(format: "%.0f", temp)
        } else {
            return ""
        }
    }
    
    var humidity: String {
        if let temp = self.weather.humidity {
            return String(format: "%.0f", temp)
        } else {
            return ""
        }
    }
    
    var cityName: String = ""
    
    func search() {
        if let cityName = self.cityName.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
            fetchWeather(by: cityName)
        }
    }
    
    private func fetchWeather(by city: String) {
        self.weatherService.getWeather(city: city) { weather in
            DispatchQueue.main.async {
                if let weather = weather {
                    self.weather = weather
                }
            }
        }
    }
}
