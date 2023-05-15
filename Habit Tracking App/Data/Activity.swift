//
//  Activity.swift
//  Habit Tracking App
//
//  Created by Seika Hirori on 5/14/23.
//

import Foundation

struct Activity: Codable, Identifiable, Equatable, Hashable {
    var id: UUID = UUID()
    let title: String
    let description: String
    var amountCompletion: Int
    
}
