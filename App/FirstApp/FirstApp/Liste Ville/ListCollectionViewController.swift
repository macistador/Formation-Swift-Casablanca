//
//  List2CollectionViewController.swift
//  FirstApp
//
//  Created by Michel-Andre Chirita on 28/03/2019.
//  Copyright © 2019 croamac. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

final class ListCollectionViewController: UICollectionViewController, ApiServiceDelegate {

    var apiService : ApiServiceType = SimpleApiService()
    var cities: [City]?

    override func viewDidLoad() {
        super.viewDidLoad()
        apiService.delegate = self
        apiService.getCities()
        collectionView.reloadData()

        let revues = PlistService.getPlist(withName: "Revues")
        print("Revues: \(revues)")
    }

    func didReceived(cities: [City]) {
        self.cities = cities
    }

    func didReceived(weather: CityWeather) { }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        // 1 récupérer la ville séléctionnée
        guard let city = sender as? City else { return }

        // 2 la passer à l'écran suivant
        let viewController = segue.destination as! ProfilViewController
        viewController.city = city
    }


    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cities?.count ?? 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CityCell
    
        // Configure the cell
        cell.label.text = cities![indexPath.row].name
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        let city = cities![indexPath.row]
        performSegue(withIdentifier: "ShowDetails", sender: city)
    }

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

}


