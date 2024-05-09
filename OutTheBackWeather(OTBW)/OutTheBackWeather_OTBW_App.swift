import SwiftUI
import Firebase

@main
struct OutTheBackWeather_OTBW_App: App {
    
    @ObservedObject private var viewModel = MapViewModel()
    
    // Initialize Firebase when the app starts
    init() {
        
        FirebaseApp.configure()
        viewModel.fetchCurrentLocation { coordinate in
            print("Current location coordinate: \(coordinate.latitude), \(coordinate.longitude)")
            Constant.latitude = coordinate.latitude
            Constant.longitude = coordinate.longitude
        }
    }
    var body: some Scene {
        WindowGroup {
                        ContentView()

        }
    }
}
