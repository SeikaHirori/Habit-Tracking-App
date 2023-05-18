//
//  ActivitiesView.swift
//  Habit Tracking App
//
//  Created by Seika Hirori on 5/14/23.
//

import SwiftUI

struct ActivitiesView: View {
    @ObservedObject var activities: Activities
    @State private var showingCurrentActivitySheet: Bool = false
    @State private var showingAddActivitySheet: Bool = false
    
    
    var body: some View {
        return NavigationStack {
            //                Text("Hello, Activities View!")
            List {
                ForEach(activities.activities) { currentActivity in
                    Button {
                        showingCurrentActivitySheet.toggle()
                    } label: {
                        Text(currentActivity.title)
                    }
                    .sheet(isPresented: $showingCurrentActivitySheet) {
                        ActivityView(activity: currentActivity)
                    }
                }
                .onDelete(perform: removeActivity)
                
            }
            .navigationTitle("Activities")
            //            .scrollContentBackground(.hidden)
            .toolbar {
                //                    showingAddActivitySheet.toggle()
                //                    let newActivitiy = Activity(title: "sleep", description: "zzz", amountCompletion: 0)
                NavigationLink{
                    AddActivityView(activities: activities)
                    
                    //
                    //                    activities.activities.append(newActivitiy)
                } label: {
                    Image(systemName: "plus")
                }
                //                .sheet(isPresented: $showingAddActivitySheet) {
                //                    AddActivityView(activities: activities)
                //                }
            }
            .padding()
            
        }
        
        
        func removeActivity(at offsets:IndexSet)  {
            activities.activities.remove(atOffsets: offsets)
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
}
