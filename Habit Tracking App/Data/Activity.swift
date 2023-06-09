//
//  Activity.swift
//  Habit Tracking App
//
//  Created by Seika Hirori on 5/14/23.
//

import Foundation

struct Activity: Codable, Identifiable, Hashable, Equatable {
    let id: UUID = UUID()
    let title: String
    let description: String
    var amountCompletion: Int
    
//  // Disabling these for now
//    mutating func increaseAmount() -> Void {
//        amountCompletion += 1
//    }
//
//    mutating func decreaseAmount() -> Void {
//        if !amountIsEmpty() {
//            amountCompletion -= 1
//        }
//    }
    
    func amountIsEmpty() -> Bool {
        return amountCompletion <= 0
    }
}
