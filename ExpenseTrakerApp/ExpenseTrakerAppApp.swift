//
//  ExpenseTrakerAppApp.swift
//  ExpenseTrakerApp
//
//  Created by Cristian David Laguna Aldana on 29/04/24.
//

import SwiftUI
import SwiftData

@main
struct ExpenseTrakerAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [Expense.self, Category.self])
    }
}
