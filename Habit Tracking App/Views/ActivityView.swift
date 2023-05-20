//
//  ActivityView.swift
//  Habit Tracking App
//
//  Created by Seika Hirori on 5/14/23.
//

import SwiftUI

struct ActivityView: View {
    @Environment(\.dismiss) var dismiss
    @State var activity: Activity
    @ObservedObject var activities: Activities
    
    var body: some View {
        return VStack(spacing: 30) {

            
            VStack(spacing: 20) {

                Text(activity.title)
                    .font(.headline)
                
                Text(activity.description)
                
                Text("Completion Amount: \(activity.amountCompletion)")
                
            }
            
            HStack {
                Stepper("Update amount", onIncrement: {
                    updateAmount()
                }, onDecrement: {
                    decreaseAmount()
                })

            }
            .padding()
            
        }
        
        func updateAmount() {
            let newTitle: String = activity.title
            
            let newDescription: String = activity.description // final release
//            let newDescription: String = activity.description + ":')" // testing only

            let newAmount: Int = activity.amountCompletion + 1
            
            let newActivity:Activity = Activity(title: newTitle, description: newDescription, amountCompletion: newAmount)
            
            
//            if let index = activities.activities.firstIndex(of: activity) {
//                activities.activities[index] = newActivity
//
//                print("Increased amount and saved to array!")
//
//            }
            activities.updateActivity(currentActivity: activity, newActivity: newActivity)
            activity = newActivity

        }
        
        func decreaseAmount() {
            let newTitle: String = activity.title
            let newDescription: String = activity.description
            var newAmount: Int {
                if activity.amountCompletion > 0 {
                    return activity.amountCompletion - 1
                } else {
                    return 0
                }
            }
            let newActivity:Activity = Activity(title: newTitle, description: newDescription, amountCompletion: newAmount)
            
            
            activities.updateActivity(currentActivity: activity, newActivity: newActivity)

            activity = newActivity

        }
    }
    
}

struct ActivityView_Previews: PreviewProvider {
    static var previewActivities: Activities {
        var closureActivties: Activities = Activities()
        
        closureActivties.activities.append(Activity(title: "test meep", description: "heelllloooooo", amountCompletion: 1))
        
        return closureActivties
    }
    static var previewActivity: Activity =  Activity(title: "Walking", description: "Walk while playing Pokemon Go", amountCompletion: 1)
    
    static var previews: some View {
        ActivityView(activity: previewActivity, activities: previewActivities)
    }
}
