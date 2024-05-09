import Foundation
import MapKit
import CoreLocation

class MapViewModel: NSObject, ObservableObject {
    static var currentLocation: CLLocation? = nil
    let locationManager = CLLocationManager()
    
     func fetchCurrentLocation(completion: @escaping (CLLocationCoordinate2D) -> Void) {
         locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        
        guard CLLocationManager.locationServicesEnabled() else {
            completion(CLLocationCoordinate2D(latitude: 0.0 , longitude: 0.0))
            return
        }
        
        if let currentLocation = locationManager.location {
            MapViewModel.currentLocation = currentLocation
            completion(currentLocation.coordinate)
        } else {
            completion(CLLocationCoordinate2D(latitude: Constant.latitude, longitude: Constant.longitude))
        }
    }
    
    func isLocationPermissionGranted() -> Bool {
        return CLLocationManager.authorizationStatus() == .authorizedWhenInUse || CLLocationManager.authorizationStatus() == .authorizedAlways
    }
    
}
extension MapViewModel: CLLocationManagerDelegate {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if manager.authorizationStatus == .authorizedWhenInUse || manager.authorizationStatus == .authorizedAlways {
            // If permission granted, fetch current location
            fetchCurrentLocation { coordinate in
                print("Current location coordinate: \(coordinate.latitude), \(coordinate.longitude)")
                Constant.latitude = coordinate.latitude
                Constant.longitude = coordinate.longitude
            }
        }
    }
}
