import Foundation
import Firebase

class AuthViewModel: ObservableObject {
    
    @Published var  userCredentials = UserCredentials()
    @Published var isShowAlert = false
    @Published var displayMessage: String = ""
    @Published var isLoading = false
    @Published var isPressSignUp = false
    @Published var isLoginSucess = false
    
    func signIn() {
        
        let username = userCredentials.userName
        let password = userCredentials.Password
        
        if username.isEmpty , password.isEmpty {
            isShowAlert = true
            displayMessage = "Username or password missing"
            self.isLoading = false
            return
        }
        
        Auth.auth().signIn(withEmail: username, password: password) { authResult, error in
            self.isLoading = false
            if let error = error {
                self.isShowAlert = true
                self.displayMessage = error.localizedDescription
            } else {
                self.isLoginSucess = true
                print("success")
                
            }
        }
    }
    
    func signUp() {
        let username = userCredentials.userName
        let password = userCredentials.Password
        
        if username.isEmpty , password.isEmpty {
            isShowAlert = true
            displayMessage = "Username and password missing"
            self.isLoading = false
            return
        }
        
        Auth.auth().createUser(withEmail: username, password: password) { authResult, error in
            self.isLoading = false
            if let error = error {
                self.isShowAlert = true
                self.displayMessage = error.localizedDescription
            } else {
                self.isShowAlert = true
                self.displayMessage = "Registration successful!"
                self.isPressSignUp = false
                print("Sign up successful")
                
            }
        }
    }
}

