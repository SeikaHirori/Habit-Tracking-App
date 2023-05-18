//
//  AddActivityView.swift
//  Habit Tracking App
//
//  Created by Seika Hirori on 5/17/23.
//

import SwiftUI

struct AddActivityView: View {
//    @Environment(\.dismiss) var dismiss
    @ObservedObject var activities: Activities
    
    var body: some View {
        return VStack {
            Text("Hello from AddActivityView")
            
            
//            Button("dismiss") {
//                dismiss()
//            }
        }
    }
}

struct AddActivityView_Previews: PreviewProvider {
    static var activitiesPreview: Activities = Activities()
    
    static var previews: some View {
        AddActivityView(activities: activitiesPreview)
    }
}
