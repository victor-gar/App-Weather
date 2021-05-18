//
//  AllCitiesController.swift
//  Weather
//
//  Created by Victor Garitskyu on 07.01.2021.
//

import UIKit

class AllCitiesController: UITableViewController {
       
    var cities = [
            "Moscow",
            "Krasnoyarsk",
            "London",
            "Paris"
        ]


    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return cities.count
    }

 
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
                let cell =  tableView.dequeueReusableCell(withIdentifier: "CityCell2", for: indexPath) as! CityCell
                // Получаем город для конкретной строки
                let city = cities[indexPath.row]
                
                // Устанавливаем город в надпись ячейки
                cell.cityName.text = city

                return cell


    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)
    {
        // Если была нажата кнопка «Удалить»
                if editingStyle == .delete {
                // Удаляем город из массива
                    cities.remove(at: indexPath.row)
                // И удаляем строку из таблицы
                    tableView.deleteRows(at: [indexPath], with: .fade)

    }
    
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
}
