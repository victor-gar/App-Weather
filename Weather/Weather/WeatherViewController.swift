//
//  WeatherViewController.swift
//  Weather
//
//  Created by Victor Garitskyu on 13.01.2021.
//

import UIKit


class WeatherViewController: UIViewController{

   
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var weekPayPicker: WeekDayPicker!
    
    @IBOutlet weak var flowDelegate: UICollectionViewDelegateFlowLayout!
    
    var selectedCity: City?
    
    var weatherCounter = 15 {
        didSet {
            collectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weekPayPicker.addTarget(self, action: #selector(selectedDay), for: .valueChanged)
    }
    
    @objc
    private func selectedDay() {
        weatherCounter = (weekPayPicker.selectedDay?.rawValue ?? 0) + 2
    }
}

extension WeatherViewController: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int) -> Int {
        weatherCounter
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        guard
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WeatherCell", for: indexPath)
                as? WeatherCell
        else { return UICollectionViewCell() }
    
        cell.image.image = UIImage(named: "1d")
        cell.titleLabel.text = "+someWeather"
    
        return cell
    }
}

extension WeatherViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("collectionCell at \(indexPath)")
    }
}

extension WeatherViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 5
        let size = CGSize(width: width, height: width)
        return size
    }
}





    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */


