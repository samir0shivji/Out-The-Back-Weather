//
//  SettingsView.swift
//  OutTheBackWeather(OTBW)
//
//  Created by Development on 22/04/2024.
//

import SwiftUI

struct SettingsView: View {
    @Binding var isLoginSuccess: Bool
    
    var body: some View {
        GeometryReader { geometry in
            
            Button(action: {
                isLoginSuccess = false
            }) {
                Text("Logout")
                    .foregroundColor(Color(UIColor.systemGray))
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(8.0)
                    .padding(8)
                    .font(Font.system(size: 16, weight: .bold))
            }
            .padding(16)
            
        }.background(Color(UIColor.systemBackground))
    }
}

#Preview {
    SettingsView(isLoginSuccess: Binding.constant(false) )
}




