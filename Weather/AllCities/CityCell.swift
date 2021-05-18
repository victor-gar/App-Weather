//
//  CityCell.swift
//  Weather
//
//  Created by Victor Garitskyu on 07.01.2021.
//

import UIKit

class CityCell: UITableViewCell {
   
    
    @IBOutlet weak var cityName: UILabel!
        override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
