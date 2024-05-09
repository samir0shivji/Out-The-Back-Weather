//
//  ContentView.swift
//  OutTheBackWeather(OTBW)
//
//  Created by Development on 22/04/2024.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var viewModel = AuthViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Image("wave_logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: geometry.size.width * 0.6, height: geometry.size.width * 0.6)
                    .clipShape(Circle())
                
                TextField("Email", text: $viewModel.userCredentials.userName)
                    .padding()
//                    .foregroundColor(.white)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(8.0)
                    .padding(16)
                    .font(Font.system(size: 18, weight: .semibold))
                
                SecureField("Password", text: $viewModel.userCredentials.Password)
                    .padding()
//                    .foregroundColor(.white)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(8.0)
                    .padding(16)
                    .font(Font.system(size: 18, weight: .semibold))
                
                if !viewModel.isPressSignUp {
                    Button(action: {
                        viewModel.isLoading = true
                        viewModel.signIn()
                    }) {
                        Text("Login")
                            .foregroundColor(Color(UIColor.systemGray))
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color(UIColor.secondarySystemBackground))
                            .cornerRadius(8.0)
                            .frame(width: geometry.size.width * 0.3)
                            .padding(8)
                            .font(Font.system(size: 16, weight: .bold))
                    }
                    
                    Spacer()
                    
                    Text("Doesn't have an account?")
                    
                    Button(action: {
                        viewModel.isPressSignUp = true
                    }) {
                        Text("Sign Up")
                            .foregroundColor(Color(UIColor.systemGray))
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color(UIColor.secondarySystemBackground))
                            .cornerRadius(8.0)
                            .frame(width: geometry.size.width * 0.3)
                            .padding(8)
                            .font(Font.system(size: 16, weight: .bold))
                    }
                } else {
                    Button(action: {
                        viewModel.isLoading = true
                        viewModel.signUp()
                    }) {
                        Text("Register")
                            .foregroundColor(Color(UIColor.systemGray))
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color(UIColor.secondarySystemBackground))
                            .cornerRadius(8.0)
                            .frame(width: geometry.size.width * 0.3)
                            .padding(8)
                            .font(Font.system(size: 16, weight: .bold))
                    }
                    
                    Spacer()
                    
                    Text("Already have an account?")
                    
                    Button(action: {
                        viewModel.isPressSignUp = false
                    }) {
                        Text("Login")
                            .foregroundColor(Color(UIColor.systemGray))
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color(UIColor.secondarySystemBackground))
                            .cornerRadius(8.0)
                            .frame(width: geometry.size.width * 0.3)
                            .padding(8)
                            .font(Font.system(size: 16, weight: .bold))
                    }
                }
            }
        }
        .overlay(
            // Progress View overlayed on the whole screen
            Group {
                if viewModel.isLoading {
                    Color.gray.opacity(0.5)
                        .ignoresSafeArea()
                    ProgressView()
                        .scaleEffect(2)
                }
            }
        )
        .background(Color(UIColor.systemBackground))
        .alert(isPresented: $viewModel.isShowAlert) {
            Alert(title: Text("Alert"), message: Text(viewModel.displayMessage), dismissButton: .default(Text("OK")))
        }
        .fullScreenCover(isPresented: $viewModel.isLoginSucess) {
            TabBarView(isLoginSucess: $viewModel.isLoginSucess)
        }
        
    }
}

#Preview {
    ContentView()
}
