//
//  Menu.swift
//  Little Lemon
//
//  Created by Madhavi Sankholkar on 8/20/24.
//

import SwiftUI

struct Menu: View {
    var body: some View {
        VStack {
            Text("Little Lemon")
                .font(.system(size:30, weight: .bold))
                .frame(maxWidth: .infinity, maxHeight: 70)
                .background(Color("#F4CE14"))
                .foregroundColor(Color("#EDEFEE"))
            Text("Chicago")
                .font(.system(size:25, weight: .bold))
                .foregroundColor(Color("#495E57"))
            Text("Description")
                .font(.system(size:15))
                .foregroundColor(Color("#495E57"))
            List{
                
            }
            Spacer()
        }
        .background(Color("#EDEFEE"))
    }
}

#Preview {
    Menu()
}
