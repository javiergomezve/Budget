//
//  ContentView.swift
//  Budget
//
//  Created by Javier Gomez on 8/09/24.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.supabaseClient) private var supabaseClient

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
        .environment(\.supabaseClient, .development)
}
