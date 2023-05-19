//
//  AddActivityView.swift
//  Habit Tracking App
//
//  Created by Seika Hirori on 5/17/23.
//

import SwiftUI

struct AddActivityView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var activities: Activities
    
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var amountCompletion: Int = 0
    
    var body: some View {
        return VStack {
            Form {
                Section("Info") {
                    TextField("Title", text: $title)
                    
                    TextField("Description", text: $description)
                    
                    Stepper("Amount Completion: \(self.amountCompletion)", value: $amountCompletion)
                }
                .onSubmit {
                    
                }
                
               
            }
            
            HStack {
                Button("Add new activity") {
                    self.addNewActivity()
                }
                
                // debug only
                Button("Clear all") {
                    self.clearAllTextFields()
                }
            
            }
            
            Spacer()
            Button("dismiss") {
                dismiss()
            }
        }
        .padding()
    }
    
    func addNewActivity() -> Void {
        // Check if self.title and self.description is filled
        guard self.title.isEmpty == false && self.description.isEmpty == false else {
            var emptyTextFields: [String] = [String]()
            
            if self.title.isEmpty {
                emptyTextFields.append("Title")
            }
            if self.description.isEmpty {
                emptyTextFields.append("Description")
            }
            
            let combinedMissingFields: String = emptyTextFields.joined(separator: "\n")
            
            print()
            print("The follow TextFields are empty: \n" + combinedMissingFields)
            return
        }
        
        // create new struct, Activity
        let newActivity: Activity = Activity(title: self.title, description: self.description, amountCompletion: self.amountCompletion)
        
        // add it to array, Activities
        self.activities.addNewActivity(activity: newActivity)
        
        // Clear all textfields
        self.clearAllTextFields()
        
        print("Added new activity!")
    }
    
    func clearAllTextFields() -> Void {
        self.title = ""
        self.description = ""
        self.amountCompletion = 0
        
        print()
        print("Cleared all textfields!")
    }
    
    
}

struct AddActivityView_Previews: PreviewProvider {
    static var activitiesPreview: Activities = Activities()
    
    static var previews: some View {
        AddActivityView(activities: activitiesPreview)
    }
}
