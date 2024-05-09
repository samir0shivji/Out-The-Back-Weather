

import SwiftUI
import MapKit

struct MapView: View {
    
    //@State private var region = Constant.region
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: Constant.latitude, longitude: Constant.longitude),
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    @Binding  var tappedLatitude: Double
    @Binding  var tappedLongitude: Double
    @ObservedObject var viewModel = MapViewModel()
    @State private var showUserLocation = true
    @State private var isfirstTimeOnMap = false
    
    struct LocationAnnotation: Identifiable {
        let id = UUID()
        let coordinate: CLLocationCoordinate2D
    }
    
    var body: some View {
        VStack {
            Map(coordinateRegion: $region, showsUserLocation: showUserLocation, userTrackingMode: .constant(.follow), annotationItems: [LocationAnnotation(coordinate: region.center)]) { location in
                MapPin(coordinate: location.coordinate, tint: .red)
            }
            .cornerRadius(8)
            .padding(16)
            .onChange(of: region.center) { newCenter in
                tappedLatitude = newCenter.latitude
                tappedLongitude = newCenter.longitude
                showUserLocation = false
            }
        }
        .background(Color(UIColor.systemBackground))
    }
}






//#Preview {
//    MapView()
//}
