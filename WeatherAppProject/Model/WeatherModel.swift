//
//  WeatherModel.swift
//  WeatherAppProject
//
//  Created by Кирилл Бережной on 01.05.2023.
//

import Foundation


struct WeatherData: Decodable {
    
    let info: Info
    let fact: Fact
    let forecasts: [Forecast]
    
}

struct Info: Decodable {
    
    let url: String
    
}

struct Fact: Decodable {
    
    let temp, feelsLike, pressureMm, humidity, uvIndex: Int
    let icon: String
    let condition: String
    let windSpeed: Double
    let windDir: String
    
    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case pressureMm = "pressure_mm"
        case humidity
        case uvIndex = "uv_index"
        case icon
        case condition
        case windSpeed = "wind_speed"
        case windDir = "wind_dir"
    }
    
}

struct Forecast: Decodable {
    
    let parts: Parts
    
}

struct Parts: Decodable {
    
    let night: Day
    let day: Day
    
}

struct Day: Decodable {
    
    let tempMin, tempMax: Int?
    
    enum CodingKeys: String, CodingKey {
        case tempMin = "temp_min"
        case tempMax = "temp_max"
    }
    
}



