//
//  MenuItem.swift
//  Little Lemon
//
//  Created by Madhavi Sankholkar on 8/20/24.
//

import Foundation

public struct MenuItem: Codable, Identifiable {
    let id: UUID()
    let title: String
    let image: String
    let price: String
}
