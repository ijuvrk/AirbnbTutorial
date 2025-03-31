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
    
    static func formatDate(_ checkIn: Date?, _ checkOut: Date?) -> String {
        guard let checkIn = checkIn, let checkOut = checkOut else {
            return "invalid dates"
        }
        
        guard checkOut >= checkIn else {
            return "invalid dates"
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM d"
        
        let checkInString = dateFormatter.string(from: checkIn)
        let checkOutString = dateFormatter.string(from: checkOut)
        let checkInMonth = Calendar.current.component(.month, from: checkIn)
        let checkOutMonth = Calendar.current.component(.month, from: checkOut)
        
        if checkInMonth == checkOutMonth {
            return "\(checkInString) - \(Calendar.current.component(.day, from: checkOut))"
        } else {
            return "\(checkInString) - \(checkOutString)"
        }
    }
}
