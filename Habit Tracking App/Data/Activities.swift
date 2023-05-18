//
//  Activities.swift
//  Habit Tracking App
//
//  Created by Seika Hirori on 5/14/23.
//

import Foundation

class Activities: ObservableObject {
    @Published var activities = [Activity]()
    
    func removeActivity(at offsets:IndexSet)  {
        activities.remove(atOffsets: offsets)
    }
    
    func addNewActivity(activity:Activity) {
        activities.append(activity)
        print("activity '\(activity.title)' added!")
    }
    
    func updateActivity(new activity: Activity) {
        if let indexActivity: Int = activities.firstIndex(where: {$0.id == activity.id}) {
            
            activities[indexActivity] = activity
            print("activity '\(activity.title)' has been updated!")

        }
            else {
            print("Activity not found in list :'[")
        }
    }

}
