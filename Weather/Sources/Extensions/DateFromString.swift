//
//  DateFromString.swift
//  Weather
//
//  Created by Kazakov Vladyslav on 12.08.2022.
//

import Foundation

extension Date {
    func fromString(_ date: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd' 'HH:mm:ss"
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.locale = Locale.current
        return dateFormatter.date(from: date) ?? Date() 
    }
    
    func getDayName(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: date)
        
    }
}
