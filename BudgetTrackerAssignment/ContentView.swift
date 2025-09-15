//
//  ContentView.swift
//  BudgetTracker
//
//  Created by Rik Roy on 8/20/25.
//

import SwiftUI

struct ContentView: View {
    @State private var viewModel = BudgetViewModel()
    @State private var expenseName = ""
    @State private var expenseAmount = ""
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 30) {
                VStack(spacing: 10) {
                    // MARK: - Budget Header
                    Text("Budget Tracker")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    // TODO: Show remaining budget here
                    // Note: Budget can change color in certain cases
                    Text("Remaining: \(viewModel.remainingBudget, format: .currency(code:"USD"))")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundStyle(viewModel.budgetColor)
                    
                    
                    
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(15)
                
                // MARK: - Add Expense Form
                VStack(spacing: 15) {
                    
                    TextField("Expense name", text: $expenseName).textFieldStyle(.roundedBorder)
                                        
                    
                    // TODO: TextField for expense amount
                    TextField("Amount", text:$expenseAmount).textFieldStyle(.roundedBorder)
                    
                    Button {
                        // TODO: Add expense and remember to clear the fields
                        if let amount = Double(expenseAmount){
                            viewModel.addExpense(name: expenseName, amount: amount)
                            expenseName = ""
                            expenseAmount = ""
                        }
                    } label: {
                        Text("Add Expense")
                            .frame(maxWidth: .infinity, maxHeight: 50)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.blue)
                            )
                            .foregroundStyle(.white)
                        
                    }
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(15)
                
                // MARK: - Expenses List
                List {
                    Section(header: Text("Expenses").font(.headline)) {
                        if viewModel.expenses.isEmpty {
                            Text("No expenses yet").foregroundStyle(.secondary)
                        }

                        // Use indices so we can bind into the array
                        ForEach($viewModel.expenses) { $expense in
                            HStack {
                                // Left: name
                                Text(expense.name)

                                Spacer()

                                // Middle: amount (tappable -> edit screen)
                                NavigationLink {
                                    ExpenseDetailView(expense: $expense, viewModel: viewModel)
                                } label: {
                                    Text(expense.amount, format: .currency(code: "USD"))
                                        .fontWeight(.semibold)
                                        .underline()                // optional: makes it look tappable
                                }
                                .buttonStyle(.plain)// keep tap area tight to the text
                                

                                // Right: Delete button (uses your removeExpense function)
                                Button(role: .destructive) {
                                    viewModel.removeExpense(expense: expense)
                                } label: {
                                    Text("Delete")
                                }
                                .buttonStyle(.borderless)
                            }
                        }
                    }
                }
                .listStyle(.insetGrouped)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(15)
                
                Spacer()
            }
            .padding()
        }
        .padding()
        .navigationTitle("Budget Tracker")
    }
}

#Preview {
    ContentView()
}
