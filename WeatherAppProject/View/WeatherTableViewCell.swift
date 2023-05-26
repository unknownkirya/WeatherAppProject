//
//  WeatherTableViewCell.swift
//  WeatherAppProject
//
//  Created by Кирилл Бережной on 02.05.2023.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cityNameLabel: UILabel!
    
    @IBOutlet weak var conditionNameLabel: UILabel!
    
    @IBOutlet weak var temperatureLabel: UILabel!
    
    func configure(weather: Weather) {
        self.cityNameLabel.text = weather.city
        self.conditionNameLabel.text = weather.conditionStr
        self.temperatureLabel.text = weather.temperature
    }
}
