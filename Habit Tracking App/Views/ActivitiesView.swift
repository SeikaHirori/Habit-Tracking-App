//
//  ActivitiesView.swift
//  Habit Tracking App
//
//  Created by Seika Hirori on 5/14/23.
//

import SwiftUI

struct ActivitiesView: View {
    @StateObject var activities: Activities
    @State private var showingSheet: Bool = false
    
    
    var body: some View {
        return NavigationStack {
            VStack {
//                Text("Hello, Activities View!")
                
                if activities.activities.isEmpty == true {
                    Text("empty ;'[")
                } else {
                    List(activities.activities, id: \.self) { currentActivity in
                        Button("Show Activity") {
                            showingSheet.toggle()
                        }
                        .sheet(isPresented: $showingSheet) {
                            ActivityView(activity: currentActivity)
                        }
                        
                    }
                }
            }
            .navigationTitle("Activities")
            .toolbar {
                Button {
                    let newActivitiy = Activity(title: "sleep", description: "zzz", amountCompletion: 0)
                    
                    activities.activities.append(newActivitiy)
                } label: {
                    Image(systemName: "plus")
                }
            }
            .padding()
        }
    }
}

struct ActivitiesView_Previews: PreviewProvider {
    static var activitiesPreview: Activities = Activities()
    
    
    static var previews: some View {
        ActivitiesView(activities: activitiesPreview)
    }
}
