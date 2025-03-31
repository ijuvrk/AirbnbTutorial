//
//  DateExtensions.swift
//  AirbnbTutorial
//
//  Created by Ijaz Ahmad on 31/03/25.
//
import Foundation

extension Date {
    func daysBetween (to endDate: Date) -> Int {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: self, to: endDate)   // dateComponents - to calculate the difference in between two dates
        return components.day ?? 0
    }
}
