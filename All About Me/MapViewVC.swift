//
//  MapViewVC.swift
//  All About Me
//
//  Created by Student on 7/16/19.
//  Copyright © 2019 Student. All rights reserved.
//

import UIKit
import MapKit

var locations:[MKPointAnnotation] = []
class MapViewVC: UIViewController, MKMapViewDelegate{
    
    @IBOutlet weak var mkMapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //
        let userPoint = UILongPressGestureRecognizer(target: self, action: #selector(self.addNewPin(_:)))
        userPoint.minimumPressDuration = 2.00
        mkMapView.addGestureRecognizer(userPoint)
        //
        let shreveport = MKPointAnnotation()
        shreveport.coordinate =  CLLocationCoordinate2DMake(35.5252, 93.7502)
        shreveport.title = "Shreveport"
        //
        let russia = MKPointAnnotation()
        russia.coordinate =  CLLocationCoordinate2DMake(61.5240, 105.3188)
        russia.title = "Russia"
        // Do any additional setup after loading the view.
        locations += [shreveport,russia]
        //
        // Map View Operatins
        mkMapView.addAnnotations(locations)
        //
        let myRegion = MKCoordinateRegion(center: shreveport.coordinate, latitudinalMeters: 5500000, longitudinalMeters: 5500000)
        
        mkMapView.setRegion(myRegion,animated:true)
        func myMapView(_ mapView: MKMapView!, viewFor annotation: MKAnnotation!) -> MKAnnotationView! {
            let pin = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "pinIndentifier")
            return pin
            
        }
        
    }
    
   
    
    @objc func addNewPin(_ gestureRecongizer: UIGestureRecognizer){
        let touchPoint = gestureRecongizer.location(in: self.mkMapView)
        let newCordinate:CLLocationCoordinate2D = mkMapView.convert(touchPoint, toCoordinateFrom: self.mkMapView)
        let alert = UIAlertController(title:"New Location",message: "Enter The Name For This Location",preferredStyle: UIAlertController.Style.alert )
        alert.addTextField { (locationText:UITextField!) in
            locationText.placeholder = "Enter Location Here"
            _ = UIAlertAction(title:"Add Location",style: UIAlertAction.Style.destructive)
            {(UIAlertAction)->Void in
                let newAnnotation = MKPointAnnotation()
                let textField = alert.textFields![0] as UITextField
                newAnnotation.coordinate = newCordinate
                newAnnotation.title = textField.text
                self.mkMapView .addAnnotation(newAnnotation)
                locations.append(newAnnotation)
                self.present(alert,animated:true,completion:nil)
            }
        }
    }
    
}// END OF CLASS
