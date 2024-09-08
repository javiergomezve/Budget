//
//  BudgetApp.swift
//  Budget
//
//  Created by Javier Gomez on 8/09/24.
//

import SwiftUI
import Supabase

@main
struct BudgetApp: App {
    
    let client = SupabaseClient(supabaseURL: URL(string: "https://qsgdxqgcavorblelpezd.supabase.co")!, supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InFzZ2R4cWdjYXZvcmJsZWxwZXpkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjU4MDgyMDcsImV4cCI6MjA0MTM4NDIwN30.tKO2YsbM87ukHsRM6op-V6sJhN5HO97UW5VUcFoUj2o")
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
