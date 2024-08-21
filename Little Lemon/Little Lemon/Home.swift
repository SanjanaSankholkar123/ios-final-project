//
//  Home.swift
//  Little Lemon
//
//  Created by Madhavi Sankholkar on 8/20/24.
//

import SwiftUI

struct Home: View {
    var body: some View {
        TabView{
            Menu()
                .tabItem({
                    Label("Menu", systemImage: "list.dash")
                })
            UserProfile()
                .tabItem({
                    Label("Profile", systemImage: "square.and.pencil")
                })
        }
        .navigationBarBackButtonHidden(true)
        .background(Color("#EDEFEE"))
    }
}

#Preview {
    Home()
}
