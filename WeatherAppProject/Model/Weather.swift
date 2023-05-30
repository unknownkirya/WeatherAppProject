//
//  Weather.swift
//  WeatherAppProject
//
//  Created by Кирилл Бережной on 01.05.2023.
//

import Foundation

struct Weather {
    
    var url: String = ""
    var city: String = "Загрузка..."
    var feelsLike: String = ""
    var temperature: String = "...°C"
    var conditionImage: String = ""
    var condition: String = "Загрузка..."
    var pressureMm: String = ""
    var windDir: String = ""
    var windSpeed: String = ""
    var uvIndex: String = ""
    
    var tempMinMaxDay: String = ""
    var tempMinMaxNight: String = ""
    
    var conditionStr: String {
        switch condition {
            
        case "clear":                   return "Ясно"
        case "partly-cloudy":           return "Малооблачно"
        case "cloudy":                  return "Облачно с прояснениями"
        case "overcast":                return "Пасмурно"
        case "drizzle":                 return "Морось"
        case "light-rain":              return "Небольшой дождь"
        case "rain":                    return "Дождь"
        case "moderate-rain":           return "Умеренно сильный дождь"
        case "heavy-rain":              return "Сильный дождь"
        case "continuous-heavy-rain":   return "Длительный сильный дождь"
        case "showers":                 return "Ливень"
        case "wet-snow":                return "Дождь со снегом"
        case "light-snow":              return "Небольшой снег"
        case "snow":                    return "Снег"
        case "snow-showers":            return "Снегопад"
        case "hail":                    return "Град"
        case "thunderstorm":            return "Гроза"
        case "thunderstorm-with-rain":  return "Дождь с грозой"
        case "thunderstorm-with-hail":  return "Гроза с градом"
        
        default: return "Загрузка..."
        }
        
    }
    
    var windDirStr: String {
        switch windDir {
        case "nw":                  return "с/з "
        case "n":                   return "с "
        case "ne":                  return "с/в "
        case "e":                   return "в "
        case "se":                  return "ю/в "
        case "s":                   return "ю "
        case "sw":                  return "ю/з "
        case "w":                   return "з "
        case "c":                   return "штиль "
            
        default: return "Загрузка..."
        }
        
    }
    
    init?(weatherData: WeatherData) {
        // info
        url = weatherData.info.url
        
        // fact
        city = "Название"
        feelsLike = String(weatherData.fact.feelsLike) + "°C"
        temperature = String(weatherData.fact.temp) + "°C"
        conditionImage = "https://yastatic.net/weather/i/icons/funky/dark/" + weatherData.fact.icon + ".svg"
        condition = weatherData.fact.condition
        pressureMm = String(weatherData.fact.pressureMm) + " мм. рт. ст."
        windDir = weatherData.fact.windDir
        windSpeed = String(weatherData.fact.windSpeed) + " м/с"
        uvIndex = String(weatherData.fact.uvIndex)
        
        // forecasts
        tempMinMaxDay = String(weatherData.forecasts.first?.parts.day.tempMin ?? 0) + "°C" + "/" + String(weatherData.forecasts.first?.parts.day.tempMax ?? 0) + "°C"
        tempMinMaxNight = String(weatherData.forecasts.first?.parts.night.tempMin ?? 0) + "°C" + "/" + String(weatherData.forecasts.first?.parts.night.tempMax ?? 0) + "°C"
        }
    
    init() {}
}
