//
//  BudgetViewModel.swift
//  BudgetTracker
//
//  Created by Rik Roy on 8/21/25.
//

import SwiftUI

@Observable class BudgetViewModel {
    var expenses: [Expense] = []
    var startingBudget: Double = 500.00
    
    var remainingBudget: Double {
        // TODO: Calculate the remaining budget
        startingBudget - expenses.reduce(0) { $0 + $1.amount }
        // Hint: Start with 500.0 and subtract the sum of all expense amounts
    }
    
    var budgetColor: Color {
        // TODO: Return .green if remainingBudget > 0, otherwise .red
        remainingBudget >= 0 ? .green : .red
    }
    
    func addExpense(name: String, amount: Double) {
        // TODO: Create a new Expense and add it to the expenses array
        let trimmed = name.trimmingCharacters(in : .whitespacesAndNewlines)
        guard !trimmed.isEmpty, amount > 0 else { return }
        expenses.append(Expense(name: trimmed, amount: amount))
    }
    
    func removeExpense(expense: Expense) {
        // TODO: Find the index of the given expense and remove it from the array
        expenses.removeAll { $0.id == expense.id }
    }
}
