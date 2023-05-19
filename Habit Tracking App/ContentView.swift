//
//  ContentView.swift
//  Habit Tracking App
//
//  Created by Seika Hirori on 5/14/23.
//

import SwiftUI

struct ContentView: View {
//    @StateObject var activities: Activities = Activities()
    
    var body: some View {
        
        VStack {
//            ActivitiesView(activities: activities)
            ActivitiesView( )
        }
        .padding()
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
