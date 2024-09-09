//
//  AddBudgetScreen.swift
//  Budget
//
//  Created by Javier Gomez on 8/09/24.
//

import SwiftUI

struct AddBudgetScreen: View {
    @Environment(\.supabaseClient) private var supabaseClient
    @Environment(\.dismiss) private var dismiss

    @State private var name: String = ""
    @State private var limit: Double?
    
    let onSave: (Budget) -> Void
    
    private func saveBudget() async {
        guard let limit = limit else { return }
        
        let budget = Budget(name: name, limit: limit)
        
        do {
            let newBudget: Budget = try await supabaseClient.from("budgets")
                .insert(budget)
                .select()
                .single()
                .execute()
                .value

            onSave(newBudget)

            dismiss()
        } catch {
            print(error)
        }
    }

    var body: some View {
        Form {
            TextField("Enter name", text: $name)
            TextField("Enter limit", value: $limit, format: .number)
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("Close") {
                    dismiss()
                }
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Button("Save") {
                    Task {
                        await saveBudget()
                    }
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        AddBudgetScreen(onSave: { _ in })
    }
}
