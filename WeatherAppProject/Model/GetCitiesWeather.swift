//
//  GetCitiesWeather.swift
//  WeatherAppProject
//
//  Created by Кирилл Бережной on 02.05.2023.
//

import Foundation
import CoreLocation

protocol CitiesProtocol {
    func getCoordinatesFrom(city: String, completion: @escaping(_ coordinate: CLLocationCoordinate2D?, _ error: Error?) -> ())
    func getCityWeather(citiesArray: [String], completionHandler: @escaping (Int, Weather) -> Void)
}

class Cities: CitiesProtocol {
    
    let networkWeatherManager = NetworkWeatherManager()
    
    func getCityWeather(citiesArray: [String], completionHandler: @escaping (Int, Weather) -> Void) {
        
        for (index, item) in citiesArray.enumerated() {
            getCoordinatesFrom(city: item) { (coordinate, error) in
                guard let coordinate = coordinate, error == nil else { return }
                self.networkWeatherManager.fetchWeather(latitude: coordinate.latitude, longitude: coordinate.longitude) { (weather) in
                    completionHandler(index, weather)
                }
            }
        }
    }
    
    func getCoordinatesFrom(city: String, completion: @escaping(_ coordinate: CLLocationCoordinate2D?, _ error: Error?) -> ()) {
        CLGeocoder().geocodeAddressString(city) { (placemark, error) in
            completion(placemark?.first?.location?.coordinate, error)
        }
    }
}
