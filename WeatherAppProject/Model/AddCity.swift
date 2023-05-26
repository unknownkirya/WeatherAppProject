//
//  AddCity.swift
//  WeatherAppProject
//
//  Created by Кирилл Бережной on 02.05.2023.
//

import UIKit

extension UIViewController {
    
    func alertPlusCity(name: String, placeholder: String, completionHandler: @escaping (String) -> Void) {
        let alertController = UIAlertController(title: name, message: nil, preferredStyle: .alert)
        let alertOK = UIAlertAction(title: "OK", style: .default) { (action) in
            
            let tftext = alertController.textFields?.first
            guard let text = tftext?.text else { return }
            completionHandler(text)
        }
        alertController.addTextField { (tf) in
            tf.placeholder = placeholder
        }
        let alertCancel = UIAlertAction(title: "Отмена", style: .default) { (_) in
            
        }
        
        alertController.addAction(alertOK)
        alertController.addAction(alertCancel)
        present(alertController, animated: true, completion: nil)
        
    }
}
