//
//  WeatherView.swift
//  OutTheBackWeather(OTBW)
//
//  Created by Development on 22/04/2024.
//

import SwiftUI

struct WavesView: View {
    
    @ObservedObject var viewModel = WavesViewModel()
    @Binding  var tappedLatitude: Double
    @Binding  var tappedLongitude: Double
    
    var body: some View {
        GeometryReader { geometry in
            
            VStack {
                HStack {
                    VStack {
                        Text("X")
                            .font(Font.system(size: 25, weight: .bold))
                        
                        TextField("longitude", text: $viewModel.longitude)
                            .padding()
                            .background(Color(UIColor.secondarySystemBackground))
                            .cornerRadius(8.0)
                            .padding(8)
                            .font(Font.system(size: 18, weight: .semibold))
                    }
                    
                    VStack {
                        Text("Y")
                            .font(Font.system(size: 25, weight: .bold))
                        
                        TextField("latitude", text: $viewModel.latitude)
                            .padding()
                            .background(Color(UIColor.secondarySystemBackground))
                            .cornerRadius(8.0)
                            .padding(8)
                            .font(Font.system(size: 18, weight: .semibold))
                    }
                    
                    Button(action: {
                        viewModel.fetchData()
                    }) {
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                            .foregroundColor(Color(UIColor.systemGray2))
                            .padding(15)
                            .background(Color(UIColor.secondarySystemBackground))
                            .clipShape(Circle())
                            .font(Font.system(size: 18, weight: .bold))
                    }
                    .padding(.top, 46)
                }
                .padding(8)
                
                HStack {
                    Text("X")
                        .font(Font.system(size: 35, weight: .bold))
                    Text(",")
                        .font(Font.system(size: 35, weight: .bold))
                    Text("Y")
                        .font(Font.system(size: 35, weight: .bold))
                    Spacer()
                }
                .padding(16)
                
                VStack {
                    HStack {
                        Text("Waive Height")
                            .font(Font.system(size: 20, weight: .bold))
                        Spacer()
                        Text("Swell Height")
                            .font(Font.system(size: 20, weight: .bold))
        
                    }
                    .padding(16)
                    
                    HStack {
                        Text(viewModel.waveHeight)
                            .font(Font.system(size: 40, weight: .bold))
                        Spacer()
                        Text(viewModel.swellHeight)
                            .font(Font.system(size: 40, weight: .bold))
                    }
                    .padding(16)
                    
                    HStack {
                        Text("Swell Direction")
                            .font(Font.system(size: 20, weight: .bold))
                        Spacer()
                        Text("Swell Period")
                            .font(Font.system(size: 20, weight: .bold))
        
                    }
                    .padding(16)
                    
                    HStack {
                        Text(viewModel.swellDirection)
                            .font(Font.system(size: 40, weight: .bold))
                        Spacer()
                        Text(viewModel.swellPeriod)
                            .font(Font.system(size: 40, weight: .bold))
                    }
                    .padding(16)
                    
                }
                .background(Color(UIColor.secondarySystemBackground))
                .cornerRadius(8)
                .padding(16)
            }
        }
        .background(Color(UIColor.systemBackground))
        .onAppear{
            viewModel.latitude = String(tappedLatitude)
            viewModel.longitude = String(tappedLongitude)
        }
       
    }
}

//#Preview {
//    WarmsView()
//}




