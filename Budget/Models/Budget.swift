//
//  Budget.swift
//  Budget
//
//  Created by Javier Gomez on 8/09/24.
//

import Foundation

struct Budget: Codable, Identifiable {
    var id: Int?
    let name: String
    let limit: Double
}
