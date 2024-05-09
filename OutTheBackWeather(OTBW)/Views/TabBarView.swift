//
//  TabBarView.swift
//  OutTheBackWeather(OTBW)
//
//  Created by Development on 22/04/2024.
//

import SwiftUI

struct TabBarView: View {
    
    @Binding var isLoginSucess: Bool
    @State private var tappedLatitude: Double =  Constant.latitude
    @State private var tappedLongitude: Double = Constant.longitude
    
    var body: some View {
        TabView {
            MapView(tappedLatitude: $tappedLatitude, tappedLongitude: $tappedLongitude)
                .tabItem {
                    Image(systemName: "map")
                    Text("Map")
                }
            //WeatherView()
            let dataManager = DataManager()
            let viewModel = WeatherSummaryViewModel(weatherFetcher: dataManager)
            WeatherSummaryView(viewModel: viewModel)
                .tabItem {
                    Image(systemName: "cloud.sun")
                    Text("Weather")
                }
            WavesView(tappedLatitude: $tappedLatitude, tappedLongitude: $tappedLongitude)
                .tabItem {
                    Image(systemName: "waveform")
                    Text("Waves")
                }
            SettingsView(isLoginSuccess: $isLoginSucess)
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }
        }
    }
    
}

#Preview {
    TabBarView(isLoginSucess: Binding.constant(false) )
}
