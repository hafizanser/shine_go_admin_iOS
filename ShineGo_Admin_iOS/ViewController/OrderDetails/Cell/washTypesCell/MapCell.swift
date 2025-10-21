//
//  MapCell.swift
//  Mattituck_IOS
//
//  Created by Asad Hamza on 11/07/2025.
//

import UIKit
import MapKit
import CoreLocation

class MapCell: UITableViewCell {
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var imgPinLocation: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }

    //MARK: - Helper Functions
    private func setupUI() {
        mapView.layer.cornerRadius = 10
        mapView.delegate = self
        mapView.showsUserLocation = false
    }
    
    func configureWithOfficeLocations(_ coordinates: [CLLocation]) {
        
        imgPinLocation.isHidden = true
        mapView.removeAnnotations(mapView.annotations.filter { !($0 is MKUserLocation) })

        for coord in coordinates {
            let annotation = MKPointAnnotation()
            annotation.coordinate = coord.coordinate
            annotation.title = "Office"
            mapView.addAnnotation(annotation)
        }

        mapView.fitAllMarkers()
    }
}

extension MapCell: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard !(annotation is MKUserLocation) else { return nil }

        let identifier = "OfficeAnnotation"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)

        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true
            annotationView?.image = UIImage(named: "ic_pin")
        } else {
            annotationView?.annotation = annotation
        }

        return annotationView
    }
}

extension MKMapView {
    func fitAllMarkers() {
        var zoomRect = MKMapRect.null

        for annotation in self.annotations {
            let point = MKMapPoint(annotation.coordinate)
            let rect = MKMapRect(x: point.x, y: point.y, width: 0, height: 0)
            zoomRect = zoomRect.union(rect)
        }

        if !zoomRect.isNull {
            self.setVisibleMapRect(zoomRect, edgePadding: UIEdgeInsets(top: 40, left: 40, bottom: 40, right: 40), animated: true)
        }
    }
}
