//
//  ActivityView.swift
//  Habit Tracking App
//
//  Created by Seika Hirori on 5/14/23.
//

import SwiftUI

struct ActivityView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        return VStack(spacing: 30) {
            Text("Hello from Activity View!")

            
            VStack(spacing: 20) {
                Text("Activity Title")
                    .font(.headline)
                
                Text("Activity Description")
                
                Text("Activity's completion amount")
            }
            Button("Dismiss") {
                dismiss()
            }
        }
    }
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView()
    }
}
