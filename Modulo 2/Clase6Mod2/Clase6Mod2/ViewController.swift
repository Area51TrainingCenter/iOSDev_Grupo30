//
//  ViewController.swift
//  Clase6Mod2
//
//  Created by alumno on 18/05/18.
//  Copyright © 2018 Area51. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!

    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {

        guard let place = view.annotation as? Place else { return }

        performSegue(withIdentifier: "mapdetailSegue", sender: place)
    }
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        print("selected")
    }
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        guard let place = annotation as? Place else { return nil }
        
        guard let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "marker") as? MKMarkerAnnotationView else {
            
            let newAnnotation = MKMarkerAnnotationView(annotation: place, reuseIdentifier: "marker")
            newAnnotation.annotation = place
            newAnnotation.canShowCallout = true
            newAnnotation.rightCalloutAccessoryView = UIButton(type: .infoLight)
            
            return newAnnotation
            
        }
        
        annotationView.annotation = place
        return annotationView

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidAppear(_ animated: Bool) {
        setupMap()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let place = sender as? Place, segue.identifier == "mapdetailSegue" {
            let detail = segue.destination as! DetailViewController
            detail.text = place.title
        }

    }
    
    func setupMap() {
        
        let distance: CLLocationDistance = 1000
        let coordinate = CLLocationCoordinate2DMake(-12.102875, -77.025711)
        let region = MKCoordinateRegionMakeWithDistance(coordinate, distance, distance)
        
        mapView.setRegion(region, animated: true)
        addAnnotation()
        
    }
    func addAnnotation() {
        
        let coordinate = CLLocationCoordinate2DMake(-12.102875, -77.025711)
        let place = Place(title: "Area51", subtitle: "Clase de iOS", price: 5.0, coordinate: coordinate)
        
        //let t = Place(title: "<#T##String#>", subtitle: "<#T##String#>", price: 0, coordinate: coordinate)
        
        mapView.addAnnotations([place])
        
    }

}

