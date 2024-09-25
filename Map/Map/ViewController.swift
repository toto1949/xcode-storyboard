//
//  ViewController.swift
//  Map
//
//  Created by Taooufiq El moutaoouakil on 9/25/24.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    var mapview = MKMapView()

    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetUp()
    }
    
    func initialSetUp() {
        mapview.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        self.view.addSubview(mapview)

        let coordinate = CLLocationCoordinate2D(latitude: 25.1972, longitude: 55.2744)
        let span = MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        mapview.setRegion(region, animated: true)

        let pin1 = MKPointAnnotation()
        pin1.coordinate = CLLocationCoordinate2D(latitude: 25.1972, longitude: 55.2744)
        pin1.title = "Taoufiq"
        pin1.subtitle = "El Moutaouakil"
        mapview.addAnnotation(pin1)

        let pin2 = MKPointAnnotation()
        pin2.coordinate = CLLocationCoordinate2D(latitude: 24.7136, longitude: 46.6753)
        pin2.title = "Toto"
        mapview.addAnnotation(pin2)

        let location1 = CLLocation(latitude: pin1.coordinate.latitude, longitude: pin1.coordinate.longitude)
        let location2 = CLLocation(latitude: pin2.coordinate.latitude, longitude: pin2.coordinate.longitude)
        let distanceInMeters = location1.distance(from: location2)

        print("Distance between the two pins: \(distanceInMeters) meters")
        
    }
}
