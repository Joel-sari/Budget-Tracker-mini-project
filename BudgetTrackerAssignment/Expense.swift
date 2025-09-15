//
//  Expense.swift
//  BudgetTracker
//
//  Created by Rik Roy on 8/21/25.
//
import SwiftUI

struct Expense: Identifiable, Equatable {
    let id = UUID()
    var name: String
    var amount: Double
}
