//
//  PermissionManager.swift
//  UniversalLite
//
//  Created by SS LEE on 2022/08/10.
//

import Foundation
import CoreBluetooth
import CoreLocation
import AVFoundation
import Photos

class PermissionManager: NSObject {
    static let shared = PermissionManager()
    private var locationManager: CLLocationManager?
    public var gpsPermission = -1
    
    public func checkPermission() {
        checkGPS()
    }
    
    public func checkUserPermission() -> Bool {
        if gpsPermission == 1 {
            return true
        }
        return false
    }
    
    public func isEndReqPermission() -> Bool {
        if gpsPermission != -1 {
            return true
        }
        return false
    }
    
    //모두 허용이 되어있다면 true
    public func checkAllAllow() -> Bool {
        var gps = false
        let locationManager = CLLocationManager()
        
        switch locationManager.authorizationStatus {
          case .notDetermined:
            print("Requesting location permission")
            locationManager.requestWhenInUseAuthorization()
          case .denied:
            print("Location access denied. Show an alert to request access")
          case .restricted:
            print("Location services restricted on the device")
          case .authorizedWhenInUse, .authorizedAlways:
            gps = true
          default:
            print("Unknown authorization status")
        }
        
        if gps {
            return true
        } else {
            return false
        }
    }
    
    private func checkGPS() {
        DispatchQueue.global().async {
            if CLLocationManager.locationServicesEnabled() {
                switch CLLocationManager.authorizationStatus() {
                case .notDetermined:
                    self.locationManager = CLLocationManager()
                    self.locationManager?.delegate = self
                    self.locationManager?.requestWhenInUseAuthorization()
                    self.locationManager?.startUpdatingLocation()
                case .restricted, .denied:
                    self.gpsPermission = 0
                    break
                case .authorizedAlways, .authorizedWhenInUse:
                    self.gpsPermission = 1
                    print("gpsPermission = true")
                @unknown default:
                    break
                }
            } else {
                print("Location services are not enabled")
            }
        }
    }

    
}

//MARK: - GPS
extension PermissionManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.gpsPermission = 1
        print("gpsPermission = true")
        manager.stopUpdatingLocation()
    }
}
