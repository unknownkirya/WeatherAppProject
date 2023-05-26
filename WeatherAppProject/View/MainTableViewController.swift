//
//  MainTableViewController.swift
//  WeatherAppProject
//
//  Created by Кирилл Бережной on 28.04.2023.
//

import UIKit
import CoreLocation

class MainTableViewController: UITableViewController {
    
    let emptArr = Weather()
    let networkWeatherManager = NetworkWeatherManager()
    // массив названий городов
    var citiesArr = ["Москва", "Нью-Йорк", "Ростов-на-Дону", "Барселона",
                     "Краснодар", "Тбилиси", "Санкт-Петербург",
                     "Сочи", "Лондон", "Майами"]
    var citiesWeatherArr = [Weather]() // массив с полной информацией о погоде в каждом городе
    let cities = Cities()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if citiesWeatherArr.isEmpty {
            citiesWeatherArr = Array(repeating: emptArr, count: citiesArr.count)
        }
        
        addCities()
    
    }
    
    func addCities() {
        self.cities.getCityWeather(citiesArray: citiesArr) { (index, weather) in
            self.citiesWeatherArr[index] = weather
            self.citiesWeatherArr[index].city = self.citiesArr[index]
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    
    
    @IBAction func pressPlusButton(_ sender: Any) {
        alertPlusCity(name: "Добавить город", placeholder: "Введите название города") { (city) in
            self.citiesArr.append(city)
            self.citiesWeatherArr.append(self.emptArr)
            self.addCities()
        }
    }
    

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return citiesArr.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! WeatherTableViewCell
        
        var weather = Weather()
        weather = citiesWeatherArr[indexPath.row]

        cell.configure(weather: weather)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Удалить") { (_, _, completionHandler) in
            
            let editingRow = self.citiesArr[indexPath.row]
            if let index = self.citiesArr.firstIndex(of: editingRow) {
                self.citiesArr.remove(at: index)
            }
            tableView.reloadData()
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            let cityWeather = citiesWeatherArr[indexPath.row]
            let destinationVC = segue.destination as? DetailViewController
            destinationVC?.weather = cityWeather
        }
    }

}
