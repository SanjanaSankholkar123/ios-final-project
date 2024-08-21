//
//  UserProfile.swift
//  Little Lemon
//
//  Created by Madhavi Sankholkar on 8/20/24.
//

import SwiftUI

struct UserProfile: View {
    var firstNameString = UserDefaults.standard.string(forKey: kFirstName)
    var lastNameString = UserDefaults.standard.string(forKey:kLastName)
    var emailString = UserDefaults.standard.string(forKey: kEmail)
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        
        VStack{
            Text("Personal information")
                .font(.system(size:30, weight: .bold))
                .frame(maxWidth: .infinity, maxHeight: 70)
                .background(Color("#F4CE14"))
                .foregroundColor(Color("#EDEFEE"))
            Spacer()
            Image("profile-image-placeholder")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50)
                .cornerRadius(25)
                .padding(20)
            Text("First Name: \(firstNameString ?? "")")
            Text("Last Name: \(lastNameString ?? "")")
            Text("Email: \(emailString ?? "")")
            Button(action: {
                UserDefaults.standard.set("", forKey: kFirstName)
                UserDefaults.standard.set("", forKey: kLastName)
                UserDefaults.standard.set("", forKey: kEmail)
                UserDefaults.standard.set(false, forKey: kIsLoggedIn)
                self.presentation.wrappedValue.dismiss()
            }) {
                Text("Logout")
                    .font(.system(size: 15, weight: .bold))
                    .foregroundColor(Color("#EDEFEE"))
            }
            .padding(10)
            .background(Color("#495E57"))
            .cornerRadius(15)
            Spacer()
            Spacer()
        }
        .background(Color("#EDEFEE"))
    }
}

#Preview {
    UserProfile()
}
