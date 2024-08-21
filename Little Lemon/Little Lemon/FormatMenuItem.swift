//
//  FormatMenuItem.swift
//  Little Lemon
//
//  Created by Madhavi Sankholkar on 8/21/24.
//

import SwiftUI

struct FormatMenuItem: View {
    let dish: Dish
    var body: some View {
        HStack(spacing: 10) {
            VStack{
                HStack {
                    Text(dish.title ?? "")
                        .font(.system(size:20, weight: .bold))
                        .foregroundColor(Color("#495E57"))
                    Spacer()
                    Text("$\(dish.price ?? "")")
                        .font(.system(size:20, weight: .bold))
                        .foregroundColor(Color("#495E57"))
                }
                Text(dish.dishDescription ?? "")
                    .font(.system(size:15))
                    .foregroundColor(Color("#495E57"))
                    .lineLimit(2)
            }
            Spacer()
            AsyncImage(url: URL(string: dish.image!)){ image in
                image.resizable()
            } placeholder: {
                ProgressView()
                    .controlSize(.large)
            }
            .frame(width: 100, height: 75)
        }
        .background(Color("EDEFEE"))
    }
}
