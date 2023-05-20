//
//  Activities.swift
//  Habit Tracking App
//
//  Created by Seika Hirori on 5/14/23.
//

import Foundation

class Activities: ObservableObject {
    @Published var activities:[Activity] = [Activity]()
    
    init(activities: [Activity] = [Activity]()) {
        self.activities = activities
    }
    
    func removeActivity(at offsets:IndexSet)  {
        activities.remove(atOffsets: offsets)
    }
    
    func addNewActivity(activity:Activity) {
        activities.append(activity)
        print("activity '\(activity.title)' added!")
    }
    
    func updateActivity(currentActivity: Activity, newActivity: Activity) {
        print(activities.contains(currentActivity))
        
        if let indexActivity: Int = activities.firstIndex(of: currentActivity) {
            
            activities[indexActivity] = newActivity
            print("activity '\(newActivity.title)' has been updated!")

        }
            else {
            print("Activity not found in list :'[")
        }
    }

}
