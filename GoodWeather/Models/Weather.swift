//
//  Weather.swift
//  GoodWeather
//
//  Created by Sorawit Trutsat on 10/7/2565 BE.
//

import Foundation

struct WeatherResponse: Decodable {
    let main: Weather
}

struct Weather: Decodable {
    var temp: Double?
    var humidity: Double?
}
