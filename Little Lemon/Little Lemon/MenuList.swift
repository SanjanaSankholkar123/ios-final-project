//
//  MenuList.swift
//  Little Lemon
//
//  Created by Madhavi Sankholkar on 8/20/24.
//

import Foundation

public struct MenuList: Codable, Identifiable {
    let id: UUID()
    let menu: [MenuItem]
}
