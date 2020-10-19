//
//  GPSService.swift
//  TestTaskKarina
//
//  Created by Karina Sarkisyan on 04.10.2020.
//

import CoreLocation


final class GpsService: NSObject, CLLocationManagerDelegate {
    
    
    private let manager = CLLocationManager()
    private var currentLocation: CLLocation?
    
    
    override init() {
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    
    
    func getDistance(latitudeFrom: Double? = nil,
                     longitudeFrom: Double? = nil,
                     latitudeTo: Double,
                     longitudeTo: Double) -> Double? {
        guard let locationFrom = (latitudeFrom == nil || longitudeFrom == nil) ? currentLocation : CLLocation(latitude: latitudeFrom!, longitude: longitudeFrom!) else { return nil }
        let locationTo = CLLocation(latitude: latitudeTo, longitude: longitudeTo)
        return locationTo.distance(from: locationFrom)
    }
    
    func isLocationAvailable() -> Bool {
        return currentLocation != nil
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        currentLocation = locations.first
    }
    
}
