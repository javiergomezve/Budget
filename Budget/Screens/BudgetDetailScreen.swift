//
//  BudgetDetailScreen.swift
//  Budget
//
//  Created by Javier Gomez on 8/09/24.
//

import SwiftUI

struct BudgetDetailScreen: View {
    let budget: Budget
    
    @Environment(\.supabaseClient) private var supabaseClient
    
    @State private var name: String = ""
    @State private var limit: Double?
    
    private func updateBudget() async {
        guard let limit = limit,
              let id = budget.id
        else { return }
        
        let budgetUpdate = Budget(name: name, limit: limit)
        
        do{
            try await supabaseClient.from("budgets")
                .update(budgetUpdate)
                .eq("id", value: id)
                .execute()
        } catch {
            print(error)
        }
    }

    var body: some View {
        Form{
            TextField("Enter name", text: $name)
            TextField("Enter limit", value: $limit, format: .number)
            Button("Update") {
                Task {
                    await updateBudget()
                }
            }
        }
        .onAppear(perform: {
            name = budget.name
            limit = budget.limit
        })
        .navigationTitle(budget.name)
    }
}

#Preview {
    NavigationStack {
        BudgetDetailScreen(budget: Budget(name: "Vacations", limit: 3000))
    }.environment(\.supabaseClient, .development)
}
