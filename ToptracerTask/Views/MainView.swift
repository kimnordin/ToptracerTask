//
//  ContentView.swift
//  ToptracerTask
//
//  Created by Kim Nordin on 2022-05-24.
//

import SwiftUI

struct MainView: View {
    @State var user = User()
    
    @State var segueToLogin: Bool = false
    @State var shouldShowPassword: Bool = false
    @State var showAuthErrorAlert: Bool = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 5) {
                if shouldShowPassword {
                    Text("Your password is: \n password")
                }
                TextField("Enter your username", text: $user.username)
                TextField("Enter your password", text: $user.password)
                HStack {
                    Button {
                        shouldShowPassword = true
                    } label: {
                        Text("Forgot password")
                    }
                    .frame(maxWidth: .infinity)
                    NavigationLink(destination: DetailsView(user: $user), isActive: $segueToLogin) {
                        Button {
                            segueToLogin = validPassword(user)
                            showAuthErrorAlert = !validPassword(user)
                        } label: {
                            Text("Login")
                        }
                        .frame(maxWidth: .infinity)
                    }
                }
            }
            .padding()
            .navigationTitle("Login")
            .alert(isPresented: $showAuthErrorAlert) {
                Alert(title: Text("Oops!"), message: Text("The password you provided does not match our records."), dismissButton: .default(Text("OK")))
            }
        }
    }
    
    func validPassword(_ user: User) -> Bool {
        return user.password == "password"
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
