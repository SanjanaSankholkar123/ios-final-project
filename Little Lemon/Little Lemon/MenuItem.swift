//
//  MenuItem.swift
//  Little Lemon
//
//  Created by Madhavi Sankholkar on 8/20/24.
//

import Foundation

struct MenuItem: Codable, Identifiable {
    var id = UUID()
    let title: String
    let image: String
    let price: String
    let description: String
    
    enum CodingKeys: String, CodingKey {
            case title = "title"
            case price = "price"
            case image = "image"
            case description = "description"
        }
}
