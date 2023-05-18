//
//  ActivityView.swift
//  Habit Tracking App
//
//  Created by Seika Hirori on 5/14/23.
//

import SwiftUI

struct ActivityView: View {
    @Environment(\.dismiss) var dismiss
    @State var activity:Activity
    
    var body: some View {
        return VStack(spacing: 30) {
//            Text("Hello from Activity View!")

            
            VStack(spacing: 20) {
//                Text("Activity Title")
                Text(activity.title)
                    .font(.headline)
                
//                Text("Activity Description")
                Text(activity.description)
                
//                Text("Activity's completion amount")
                Text("Completion Amount: \(activity.amountCompletion)")
                
            }
            
            HStack {
                Text("Modify amount:")
                
                Button {
                    activity.decreaseAmount()
                } label: {
                    Image(systemName: "minus")
                }
                
                Button {
                    activity.increaseAmount()
                } label: {
                    Image(systemName: "plus")
                }
                
            }
            
            Button("Dismiss") {
                dismiss()
            }
        }
    }
    
}

struct ActivityView_Previews: PreviewProvider {
    static var previewActivity: Activity =  Activity(title: "Walking", description: "Walk while playing Pokemon Go", amountCompletion: 1)
    
    static var previews: some View {
        ActivityView(activity: previewActivity)
    }
}
