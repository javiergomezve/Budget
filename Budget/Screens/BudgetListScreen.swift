//
//  ContentView.swift
//  Budget
//
//  Created by Javier Gomez on 8/09/24.
//

import SwiftUI

struct BudgetListScreen: View {
    @Environment(\.supabaseClient) private var supabaseClient
    
    @State private var budgets: [Budget] = []
    @State private var isPresented: Bool = false
    
    
    
    private func fetchBudgets() async {
        do {
            budgets = try await supabaseClient.from("budgets")
                .select()
                .execute()
                .value
        } catch {
            print(error)
        }
    }

    var body: some View {
        List(budgets) { budget in
            BudgetCellView(budget: budget)
        }.task {
            print(".task modifier")
            await fetchBudgets()
        }
        .navigationTitle("Budgets")
        .toolbar(content: {
            Button("Add new") {
                isPresented = true
            }
        })
        .sheet(isPresented: $isPresented, content: {
            NavigationStack {
                AddBudgetScreen(onSave: {budget in
                    budgets.append(budget)
                })
            }
        })
    }
}

#Preview {
    NavigationStack {
        BudgetListScreen()
            .environment(\.supabaseClient, .development)
    }
}

struct BudgetCellView: View {
    let budget: Budget
    
    var body: some View {
        HStack {
            Text(budget.name)
            Spacer()
            Text(budget.limit, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
        }
    }
}
