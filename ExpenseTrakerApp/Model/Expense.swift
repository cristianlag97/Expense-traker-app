//
//  Expense.swift
//  ExpenseTrakerApp
//
//  Created by Cristian David Laguna Aldana on 29/04/24.
//

import Foundation
import SwiftData

@Model
class Expense {
    var title: String
    var subTitle: String
    var amount: Double
    var date: Date
    
    ///Expense category
    var cateogry: Category?
    
    init(title: String, subTitle: String, amount: Double, date: Date, cateogry: Category? = nil) {
        self.title = title
        self.subTitle = subTitle
        self.amount = amount
        self.date = date
        self.cateogry = cateogry
    }
    
    ///Currency String
    ///@Transient es usado para evitar almacenar propiedades en el disco
    @Transient
    var currencyString: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        
        return formatter.string(for: amount) ?? ""
    }
}
