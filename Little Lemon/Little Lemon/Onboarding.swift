//
//  Onboarding.swift
//  Little Lemon
//
//  Created by Madhavi Sankholkar on 8/20/24.
//

import SwiftUI
import UIKit

let kFirstName = "first name key"
let kLastName = "last name key"
let kEmail = "email key"
let kIsLoggedIn = "kIsLoggedIn"

struct Onboarding: View {
    @State var firstName = ""
    @State var lastName = ""
    @State var email = ""
    @State var isLoggedIn = false
    var body: some View {
        NavigationView{
            VStack{
                NavigationLink(destination: Home(), isActive: $isLoggedIn){
                    EmptyView()
                }
                Text("Log-In")
                    .font(.system(size:30, weight: .bold))
                    .frame(maxWidth: .infinity, maxHeight: 70)
                    .background(Color("#F4CE14"))
                    .foregroundColor(Color("#EDEFEE"))
                Spacer()
                TextField("First Name", text: $firstName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 16)
                TextField("Last Name", text: $lastName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 16)
                TextField("Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .multilineTextAlignment(.leading)
                    .padding(.horizontal, 16)
                Button(action: {
                    if (!(firstName.isEmpty) && !(lastName.isEmpty) && !(email.isEmpty)) {
                        UserDefaults.standard.set(firstName, forKey: kFirstName)
                        UserDefaults.standard.set(lastName, forKey: kLastName)
                        UserDefaults.standard.set(email, forKey: kEmail)
                        UserDefaults.standard.set(true, forKey: kIsLoggedIn)
                        isLoggedIn = true
                    }}) {
                        Text("Register")
                            .font(.system(size: 15, weight: .bold))
                            .foregroundColor(Color("#EDEFEE"))
                    }
                    .padding(10)
                    .background(Color("#495E57"))
                    .cornerRadius(15)
                Spacer()
            }
            onAppear(perform: {
                if (UserDefaults.standard.bool(forKey: kIsLoggedIn)) {
                    isLoggedIn = true
                }
            })
        }
    }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}
