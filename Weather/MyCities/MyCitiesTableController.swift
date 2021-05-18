//
//  MyCitiesTableController.swift
//  Weather
//
//  Created by Victor Garitskyu on 07.01.2021.
//

import UIKit

struct City: Equatable {
    var name: String
    var image: UIImage
}

class MyCitiesTableController: UITableViewController {
    
    var myCities = [City]()
    
    
    @IBAction func addCity(segue: UIStoryboardSegue) {
        guard
            segue.identifier == "addCity",
            let controller = segue.source as? AllCitiesController,
            let indexPath = controller.tableView.indexPathForSelectedRow,
            !myCities.contains(controller.allCities[indexPath.row])
        else { return }
        let city = controller.allCities[indexPath.row]
        myCities.append(city)
        tableView.reloadData()
    }
    //
    
    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            myCities.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .left)
        }
    }
    //

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        myCities.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "CityCell", for: indexPath)
                as? CityCell
        else { return UITableViewCell() }
        cell.cityName.text = myCities[indexPath.row].name

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard
            segue.identifier == "forecast",
            let controller = segue.destination as? WeatherViewController,
            let index = tableView.indexPathForSelectedRow
        else { return }
        
        controller.selectedCity = myCities[index.row]
    }

}
