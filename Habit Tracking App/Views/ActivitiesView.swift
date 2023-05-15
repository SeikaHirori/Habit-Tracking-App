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
        return VStack {
            Text("Hello, Activities View!")
            
            List(activities.activities, id: \.self) { activity in
                Button("Show Activity") {
                    showingSheet.toggle()
                }
                .sheet(isPresented: $showingSheet) {
                    ActivityView()
                }

            }
                        
        }
    }
}

struct ActivitiesView_Previews: PreviewProvider {
    static var activitiesPreview: Activities = Activities()
    
    
    static var previews: some View {
        ActivitiesView(activities: activitiesPreview)
    }
}
