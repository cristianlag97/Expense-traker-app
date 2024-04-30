//
//  AddExpenseView.swift
//  ExpenseTrakerApp
//
//  Created by Cristian David Laguna Aldana on 29/04/24.
//

import SwiftUI
import SwiftData

struct AddExpenseView: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    
    ///View Properties
    @State private var title: String = ""
    @State private var subTitle: String = ""
    @State private var date: Date = .init()
    @State private var amount: CGFloat = 0
    @State private var category: Category?
    ///Categories
    @Query(animation: .snappy) private var allCategories: [Category]
    
    var body: some View {
        NavigationStack {
            List {
                Section("Title") {
                    TextField("Magic Keyboard", text: $title)
                }
                Section("Description") {
                    TextField("Bought a Keyboard at the apple store", text: $subTitle)
                }
                Section("Amount Spent") {
                    HStack(spacing: 4) {
                        Text("$")
                            .fontWeight(.semibold)
                        TextField("0.0", value: $amount, formatter: formatter)
                            .keyboardType(.numberPad)
                    }
                }
                Section("Date") {
                    DatePicker("", selection: $date, displayedComponents: [.date])
                        .datePickerStyle(.graphical)
                        .labelsHidden()
                }
                
                ///Category picker
                if !allCategories.isEmpty {
                    HStack {
                        Text("Category")
                        
                        Spacer()
                        
                        Menu{
                            ForEach(allCategories) { category in
                                Button(category.categoryName){
                                    self.category = category
                                }
                            }
                            
                            //None button
                            Button("None") {
                                category = nil
                            }
                        } label: {
                            if let categoryName = category?.categoryName {
                                Text(categoryName)
                            } else {
                                Text("None")
                            }
                        }
                        
                       /* Picker("", selection: $category) {
                            ForEach(allCategories) {
                                Text($0.categoryName)
                                    .tag($0)
                            }
                            
                            Text("None")
                        }
                        .pickerStyle(.menu)
                        .labelsHidden()*/
                    }
                }

            }
            .navigationTitle("Add Expense")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ///Cancel & Add Button
                ToolbarItem(placement: .topBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .tint(.red)
                }
                ToolbarItem {
                    Button("Add", action: addExpense)
                        .disabled(isAddButtonDisabled)
                }
            }
        }
    }
    
    ///Disabling Add button, until all daa has been entered
    var isAddButtonDisabled: Bool {
        return title.isEmpty || subTitle.isEmpty || amount.isZero
    }
    
    ///Adding Expense to the swift data
    func addExpense(){
        let expense = Expense(title: title, subTitle: subTitle, amount: amount, date: date, cateogry: category)
        print(expense)
        context.insert(expense)
        ///Closing View,  Once the data has been added Successfully
        dismiss()
    }
    
    ///Decimal formater
    var formatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2
        return formatter
    }
}

#Preview {
    AddExpenseView()
}
