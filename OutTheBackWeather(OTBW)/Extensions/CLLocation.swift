import CoreLocation

extension CLLocation {

    func fetchCityAndCountry(completion: @escaping (String?, String?, Error?) -> Void) {
        CLGeocoder().reverseGeocodeLocation(self) { placemarks, error in
            guard error == nil else {
                completion(nil, nil, error)
                return
            }

            guard let placemark = placemarks?.first else {
                completion(nil, nil, NSError(domain: "OTBW", code: -1, userInfo: [NSLocalizedDescriptionKey: "No placemark found"]))
                return
            }

            let city = placemark.locality
            let country = placemark.country

            completion(city, country, nil)
        }
    }
}

extension CLLocationCoordinate2D: Equatable {
    public static func == (lhs: CLLocationCoordinate2D, rhs: CLLocationCoordinate2D) -> Bool {
        return lhs.latitude == rhs.latitude && lhs.longitude == rhs.longitude
    }
}
