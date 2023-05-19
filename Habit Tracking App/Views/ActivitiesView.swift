//
//  ActivitiesView.swift
//  Habit Tracking App
//
//  Created by Seika Hirori on 5/14/23.
//

import SwiftUI

struct ActivitiesView: View {
    @StateObject var activities: Activities = UserDefaults.standard.object(forKey: "UserData") as? Activities ?? Activities()
    @State private var showingAddActivitySheet: Bool = false
    
    
    var body: some View {
        return VStack {
            
            NavigationStack {
                //                Text("Hello, Activities View!")
                Section {
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
                
                Button("Save data"){
                    self.saveDataToUserDefault()
                }
            }
        }
    }
    
    func saveDataToUserDefault() -> Void {
//        let defaults:UserDefaults = UserDefaults.standard
//        defaults.set(activities, forKey: "UserData")
        
        UserDefaults.standard.set(activities.activities, forKey: "UserData")
        
        print("Saving habits to user default")
    }
    
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
