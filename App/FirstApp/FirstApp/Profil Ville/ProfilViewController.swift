//
//  ProfilViewController.swift
//  FirstApp
//
//  Created by Michel-Andre Chirita on 28/03/2019.
//  Copyright © 2019 croamac. All rights reserved.
//

import UIKit
import MapKit
import Alamofire
import AlamofireImage

class ProfilViewController: UIViewController, ApiServiceDelegate {

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var map: MKMapView!
    var city: City?
    
    lazy var apiService : ApiServiceType = {
        let service = SimpleApiService()
        service.delegate = self
        return service
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        cityNameLabel.text = city?.name
        apiService.getWeather(for: city!)

        setupMap()
    }

    private func setupMap() {
        let initialLocation = CLLocation(latitude: 33.5731104, longitude: -7.5898434)
        centerMapOnLocation(location: initialLocation)
    }

    private func centerMapOnLocation(location: CLLocation) {
        let regionRadius: CLLocationDistance = 10000
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate,
                                                  latitudinalMeters: regionRadius,
                                                  longitudinalMeters: regionRadius)
        map.setRegion(coordinateRegion, animated: true)
    }

    func didReceived(cities: [City]) { }

    func didReceived(weather: CityWeather) {
        guard let temperature = weather.celciusTemperature else { return }
        temperatureLabel.text = String(temperature)

        guard let url = URL(string: "https://www.courrierinternational.com/sites/ci_master/files/styles/image_original_1280/public/assets/images/casablanca_maroc_expat.jpg?itok=iEXhKQEB") else { return }

        let placeholderImage = UIImage(named: "paris")!

        photoImageView.af_setImage(withURL: url, placeholderImage: placeholderImage)


        // OU

//        let imageCache = AutoPurgingImageCache()
//        let avatarImage = UIImage(data: data)!
//
//        // Add
//        imageCache.add(avatarImage, withIdentifier: "avatar")
//
//        // Fetch
//        let cachedAvatar = imageCache.image(withIdentifier: "avatar")
//
//        // Remove
//        imageCache.removeImage(withIdentifier: "avatar")


//        let imageCache = AutoPurgingImageCache()
//
//        let urlRequest = URLRequest(url: URL(string: "https://httpbin.org/image/png")!)
//        let avatarImage = UIImage(named: "avatar")!.af_imageRoundedIntoCircle()
//
//        // Add
//        imageCache.add(avatarImage, for: urlRequest, withIdentifier: "circle")
//
//        // Fetch
//        let cachedAvatarImage = imageCache.image(for: urlRequest, withIdentifier: "circle")
//
//        // Remove
//        imageCache.removeImage(for: urlRequest, withIdentifier: "circle")
    }

    @IBAction func didTappedNotificationButton(_ sender: Any) {

        NotificationsService.sendLocalNotification()

        let alertController = UIAlertController(title: "Notification", message: "Une notification locale est programmée pour dans 10 secondes", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alertController, animated: true)
    }

    @IBAction func didTappedShareTextButton(_ sender: UIButton) {

        let text = "Le texte que je veux partager"
        let textToShare = [text]
        let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = sender
        self.present(activityViewController, animated: true, completion: nil)
    }









    @IBAction func didTappedOpenPdfButton(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "PDFVIEWCONTROLLER")
        self.present(controller, animated: true, completion: nil)
    }
}
