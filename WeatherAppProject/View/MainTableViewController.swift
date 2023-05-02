//
//  MainTableViewController.swift
//  WeatherAppProject
//
//  Created by Кирилл Бережной on 28.04.2023.
//

import UIKit

class MainTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchWeather()

        
    }
    
    func fetchWeather() {
        
        let urlString = "https://api.weather.yandex.ru/v2/forecast?lat=55.75396&lon=37.620393"
        guard let url = URL(string: urlString) else { return }
        var request = URLRequest(url: url)
        request.addValue("3f7e7452-5a5b-4cd4-b2f9-7d236b651da6", forHTTPHeaderField: "X-Yandex-API-Key")
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else {
                print(String(describing: error))
                return
            }
            print(String(data: data, encoding: .utf8) ?? "not working")
        }
        task.resume()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)


        return cell
    }

}
