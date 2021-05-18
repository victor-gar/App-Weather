//
//  AllCitiesTableController.swift
//  Weather
//
//  Created by Victor Garitskyu on 09.03.2021.
//


import UIKit

class AllCitiesTableController: UITableViewController {
    
    var allCities = [
        City(name: "SomeName", image: UIImage()),
        City(name: "SomeName", image: UIImage()),
        City(name: "SomeName", image: UIImage()),
        City(name: "SomeName", image: UIImage()),
    ]
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        allCities.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "CityCell", for: indexPath)
                as? CityCell
        else { return UITableViewCell() }
        cell.cityName.text = allCities[indexPath.row].name
        
        return cell
    }
    
    
    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}
