//
//  Little_LemonApp.swift
//  Little Lemon
//
//  Created by Madhavi Sankholkar on 8/19/24.
//

import SwiftUI

@main
struct Little_LemonApp: App {
    let persistence = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            Onboarding()
                .environment(\.managedObjectContext, persistence.container.viewContext)
        }
    }
}
