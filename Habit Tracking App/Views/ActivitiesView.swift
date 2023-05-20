//
//  ActivitiesView.swift
//  Habit Tracking App
//
//  Created by Seika Hirori on 5/14/23.
//

import SwiftUI

struct ActivitiesView: View {
//    @StateObject var activities: Activities = Activities()
    
    // FIX: This currently doesn't work
    @StateObject var activities: Activities = Activities(activities: {
        if let data = UserDefaults.standard.data(forKey: "UserData") {
            let closureArray: [Activity] = try! PropertyListDecoder().decode([Activity].self, from: data)
            
        }
    } as? [Activity] ?? [Activity]())
    
    @State private var showingAddActivitySheet: Bool = false
    
    
    var body: some View {
        return VStack {
            
            NavigationStack {
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
                        } label: {
                            Image(systemName: "plus")
                        }
                        .sheet(isPresented: $showingAddActivitySheet) {
                            AddActivityView(activities: activities)
                        }
                    }
                    .padding()
                    
                }
                
                HStack {
                    Button("Save data"){
                        self.saveDataToUserDefault()
                    }
                    
                    Button("Load data") {
                        self.loadDataFromUserDefault()
                    }
                }
                
            }
        }
        .onAppear {
            loadDataFromUserDefault()
        }
    }
    
    func saveDataToUserDefault() -> Void {
        // v1
//        let defaults:UserDefaults = UserDefaults.standard
//        defaults.set(activities, forKey: "UserData")
        
        // v2
//        let defaults = UserDefaults.standard
//        defaults.set(activities.activities, forKey: "UserData")
        
        // v3 // #RFER #3
        if let data = try? PropertyListEncoder().encode(activities.activities) {
            UserDefaults.standard.set(data, forKey: "UserData")
            
            print("Saving habits to user default")
        }
        
    }
    
    func loadDataFromUserDefault() -> Void {
        
        if let data = UserDefaults.standard.data(forKey: "UserData") {
            let closureArray: [Activity] = try! PropertyListDecoder().decode([Activity].self, from: data)
            
            activities.activities = closureArray
            
            print()
            print("Data is loaded!")
        }
        
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
