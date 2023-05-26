//
//  NetworkWeatherManager.swift
//  WeatherAppProject
//
//  Created by Кирилл Бережной on 01.05.2023.
//

import Foundation

protocol NetworkWeatherManagerProtocol {
    func fetchWeather(latitude: Double, longitude: Double, complitionHandler: @escaping (Weather) -> Void)
}

class NetworkWeatherManager: NetworkWeatherManagerProtocol {
    
    func fetchWeather(latitude: Double, longitude: Double, complitionHandler: @escaping (Weather) -> Void) {
        
        let urlString = "https://api.weather.yandex.ru/v2/forecast?lat=\(latitude)&lon=\(longitude)"
        guard let url = URL(string: urlString) else { return }
        var request = URLRequest(url: url)
        request.addValue("3f7e7452-5a5b-4cd4-b2f9-7d236b651da6", forHTTPHeaderField: "X-Yandex-API-Key")
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            //print(String(data: data, encoding: .utf8) ?? "not working")
            if let weather = self.parseJSON(withData: data) {
                complitionHandler(weather)
            }
        }
        task.resume()
    }
    
    func parseJSON(withData data: Data) -> Weather? {
        let decoder = JSONDecoder()
        do {
            let weatherData = try decoder.decode(WeatherData.self, from: data)
            guard let weather = Weather(weatherData: weatherData) else { return nil }
            return weather
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }
    
}
