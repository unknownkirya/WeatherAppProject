//
//  DetailViewController.swift
//  WeatherAppProject
//
//  Created by Кирилл Бережной on 02.05.2023.
//

import UIKit
import SwiftSVG

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var nameCityLabel: UILabel!
    @IBOutlet weak var viewOfCity: UIView!
    @IBOutlet weak var temperature: UILabel!
    @IBOutlet weak var condition: UILabel!
    @IBOutlet weak var preasureMm: UILabel!
    @IBOutlet weak var windDirAndSpeed: UILabel!
    @IBOutlet weak var minMaxTempDay: UILabel!
    @IBOutlet weak var minMaxTempNight: UILabel!
    @IBOutlet weak var uvIndex: UILabel!
    
    var weather: Weather? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshLabels()
        
    }
    
    func refreshLabels() {
        
        guard let url = URL(string: weather?.conditionImage ?? "") else { return }

        let weatherImage = UIView(SVGURL: url) { (image) in
            image.resizeToFit(self.viewOfCity.bounds)
        }
        
        nameCityLabel.text = weather?.city
        viewOfCity.addSubview(weatherImage)
        temperature.text = weather?.temperature
        condition.text = weather?.conditionStr
        preasureMm.text = weather?.pressureMm
        windDirAndSpeed.text = (weather?.windDirStr ?? "") + (weather?.windSpeed ?? "")
        minMaxTempDay.text = weather?.tempMinMaxDay
        minMaxTempNight.text = weather?.tempMinMaxNight
        uvIndex.text = weather?.uvIndex
        
    }
    

}
