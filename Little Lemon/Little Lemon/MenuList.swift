//
//  MenuList.swift
//  Little Lemon
//
//  Created by Madhavi Sankholkar on 8/20/24.
//

import Foundation
import CoreData

struct MenuList: Codable {
    let menu: [MenuItem]
    
    enum CodingKeys: String, CodingKey {
            case menu = "menu"
        }
    
    static func getMenuData(viewContext: NSManagedObjectContext) {
            PersistenceController.shared.clear()
            
            let url = URL(string: "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json")
            let request = URLRequest(url: url!)
            let session = URLSession.shared
            let dataTask = session.dataTask(with: request) { data, response, error in
                if let data = data {
                    let decoder = JSONDecoder()
                    if let fullMenu = try? decoder.decode(MenuList.self, from: data) {
                        for dish in fullMenu.menu {
                            let newDish = Dish(context: viewContext)
                            newDish.title = dish.title
                            newDish.price = dish.price
                            newDish.image = dish.image
                            newDish.dishDescription = dish.description
                        }
                        try? viewContext.save()
                    } else {
                        print(error.debugDescription.description)
                    }
                } else {
                    print(error.debugDescription.description)
                }
            }
            dataTask.resume()
        }
}
