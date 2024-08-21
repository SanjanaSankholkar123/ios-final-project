//
//  Menu.swift
//  Little Lemon
//
//  Created by Madhavi Sankholkar on 8/20/24.
//

import SwiftUI

struct Menu: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    func getMenuData() {
        PersistenceController.shared.clear()
        let url = URL(string: "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json")!
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request)
        { (data, response, error) in
            if let jsonData = data {
                let fullMenu = try! JSONDecoder().decode(MenuList.self, from: jsonData)
                let menuItems = fullMenu.menu
                
                for menuItem in menuItems{
                    let oneDish = Dish(context: viewContext)
                    oneDish.title = menuItem.title
                    oneDish.price = menuItem.price
                    oneDish.image = menuItem.image
                    
                    try? viewContext.save()
                }
            }
        }
        
        
        task.resume()
    }
    
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
            FetchedObjects() { (dishes: [Dish]) in
                List{
                    ForEach(dishes) { dish in
                        HStack{
                            Text("\(dish.title!), \(dish.price!)")
                            AsyncImage(url: URL(string: dish.image!))
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 75)
                        }
                    }
                }
            }
            Spacer()
        }
        .background(Color("#EDEFEE"))
        onAppear(perform: getMenuData)
    }
}

#Preview {
    Menu()
}
