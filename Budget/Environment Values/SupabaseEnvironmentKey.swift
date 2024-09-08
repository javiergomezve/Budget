//
//  SupabaseEnvironmentKey.swift
//  Budget
//
//  Created by Javier Gomez on 8/09/24.
//

import Foundation
import SwiftUI
import Supabase

struct SupabaseEnvironmentKey: EnvironmentKey {
    static var defaultValue: SupabaseClient = .development
}

extension EnvironmentValues {
    var supabaseClient: SupabaseClient {
        get { self[SupabaseEnvironmentKey.self] }
        set { self[SupabaseEnvironmentKey.self] = newValue }
    }
}
