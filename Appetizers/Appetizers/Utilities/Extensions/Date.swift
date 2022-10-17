import Foundation

extension Date {
    var fourteenYearsAgo: Date {
        Calendar.current.date(byAdding: .year, value: -14, to: Date.now)!
    }
    
    var oneHundredTenYearsAgo: Date {
        Calendar.current.date(byAdding: .year, value: -110, to: Date.now)!
    }
}
