//
//  ActivitiesView.swift
//  Habit Tracking App
//
//  Created by Seika Hirori on 5/14/23.
//

import SwiftUI

struct ActivitiesView: View {
    @ObservedObject var activities: Activities
    @State private var showingAddActivitySheet: Bool = false
    
    
    var body: some View {
        return NavigationStack {
            //                Text("Hello, Activities View!")
            List {
                ForEach(activities.activities) { currentActivity in
                    NavigationLink {
                        ActivityView(activity: currentActivity, activities: activities)
                    } label: {
                        Text(currentActivity.title)
                    }
                }
                .onDelete(perform: activities.removeActivity)
                
            }
            .navigationTitle("Activities")
            //            .scrollContentBackground(.hidden)
            .toolbar {

                Button{
                    showingAddActivitySheet.toggle()

                    //  // Debugging only
                    //                    activities.addNewActivity(activity: Activity(title: "test", description: "meep", amountCompletion: 1))
                } label: {
                    Image(systemName: "plus")
                }
                .sheet(isPresented: $showingAddActivitySheet) {
                    AddActivityView(activities: activities)
                }
            }
            .padding()
            
        }
        
        
//        func removeActivity(at offsets:IndexSet)  {
//            activities.activities.remove(atOffsets: offsets)
//        }
//
//        func addNewActivity(activity:Activity) {
//            activities.activities.append(activity)
//            print("activity '\(activity.title)' added!")
//        }
//
//        func updateActivity(new activity: Activity) {
//            if let indexActivity: Int = activities.activities.firstIndex(of: activity) {
//
//                activities.activities[indexActivity] = activity
//                print("activity '\(activity.title)' has been updated!")
//
//            }
//                else {
//                print("Activity not found in list :'[")
//            }
//        }
    }
    
    struct ActivitiesView_Previews: PreviewProvider {
        static var activitiesPreview: Activities {
            var activitiesClosure: Activities = Activities()
            let activityPreview1: Activity = Activity(title: "meep", description: "test this out", amountCompletion: 2)
            activitiesClosure.activities.append(activityPreview1)
            
            return activitiesClosure
        }
        
        
        static var previews: some View {
            ActivitiesView(activities: activitiesPreview)
        }
    }
}
