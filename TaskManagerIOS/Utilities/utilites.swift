//
//  utilites.swift
//  TaskManagerIOS
//
//  Created by Jake Dillon on 11/5/18.
//  Copyright © 2018 Jake Dillon. All rights reserved.
//

import Foundation

// This gives you a retrun date for the due date label
func formatDate(_ date: Date) -> String {
    let formatter = DateFormatter()
    
    // dateFormatter.dataStyle = .medium      This will allow you to set different default date styles
    
    formatter.dateFormat = " MMM d, yyyy"
    
    let formattedString = formatter.string(from: date)
    
    return formattedString
}
