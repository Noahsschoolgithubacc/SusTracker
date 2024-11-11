//
//  TimeFormatting.swift
//  SusTracker
//
//  Created by PM Student on 11/11/24.
//

import Foundation

// timeintervalsincenow = tells you the offset from the current date

// calculates the time elapsed since the given data and return it as a readable string
func calcTimeSince(date: Date) -> String {
    let minutes = Int(-date.timeIntervalSinceNow)/60
    let hours = minutes/60
    let days = hours/24
    
    if minutes < 120 {
        return "\(minutes) minutes ago"
    } else if minutes >= 120 && hours < 48 {
        return "\(hours) hours ago"
    } else {
        return "\(days) days ago"
    }
}
