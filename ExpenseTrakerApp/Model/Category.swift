//
//  Category.swift
//  ExpenseTrakerApp
//
//  Created by Cristian David Laguna Aldana on 29/04/24.
//

import Foundation
import SwiftData

@Model
class Category {
    var categoryName: String

    /// Category Expenses
    @Relationship(deleteRule: .cascade, inverse: \Expense.cateogry)
    var expenses: [Expense]?
    
    init(categoryName: String) {
        self.categoryName = categoryName
    }
}
