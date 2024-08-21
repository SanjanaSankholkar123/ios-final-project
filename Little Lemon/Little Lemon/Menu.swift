//
//  Menu.swift
//  Little Lemon
//
//  Created by Madhavi Sankholkar on 8/20/24.
//

import SwiftUI

struct Menu: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @State var searchText = ""
    
    @State var loaded = false
    
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
            Spacer()
                .frame(height:20)
            Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
                .font(.system(size:15))
                .foregroundColor(Color("#495E57"))
            TextField("Search menu", text: $searchText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .multilineTextAlignment(.leading)
                .padding(.horizontal, 16)
            
            FetchedObjects(predicate: buildPredicate(),
                                           sortDescriptors: buildSortDescriptors()) {
                                (dishes: [Dish]) in
                                List(dishes) { dish in
                                    FormatMenuItem(dish: dish)
                                }
                                .listStyle(.plain)
                            }
            Spacer()
        }
        .background(Color("#EDEFEE"))
        .onAppear {
                    if !loaded {
                        MenuList.getMenuData(viewContext: viewContext)
                        loaded = true
                    }
                }
    }
    
    func buildSortDescriptors() -> [NSSortDescriptor] {
        return [NSSortDescriptor(key: "title",
                                          ascending: true,
                                          selector:
                                            #selector(NSString.localizedStandardCompare))]
    }
    
    func buildPredicate() -> NSPredicate {
        if (searchText.isEmpty) {
            return NSPredicate(value: true)
        } else {
            return NSPredicate(format: "title CONTAINS[cd] %@", searchText)
        }
    }
}


#Preview {
    Menu()
        .environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
}
