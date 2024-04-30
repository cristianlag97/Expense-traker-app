//
//  ContentView.swift
//  ExpenseTrakerApp
//
//  Created by Cristian David Laguna Aldana on 29/04/24.
//

import SwiftUI

struct ContentView: View {
    ///View properties
    @State private var currentTab = "Expenses"
    
    var body: some View {
        TabView(selection: $currentTab) {
            ExpensesView(currentTab: $currentTab)
                .tag("Expenses")
                .tabItem {
                    Image(systemName: "creditcard.fill")
                    Text("Expenses")
                }
            CategoriesView()
                .tag("Categories")
                .tabItem {
                    Image(systemName: "list.clipboard.fill")
                    Text("Categories")
                }
        }
    }
}

#Preview {
    ContentView()
}
