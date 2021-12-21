
import UIKit

class Date_Utility: NSObject {
    
}
extension Date {
    func currentTimeMillis() -> Int64 {
        return Int64(self.timeIntervalSince1970 * 1000)
    }
    
    func toString(dateFormatFormat:String,isUTC:Bool = false) -> String {
        
        let dateFormatter = DateFormatter()
        if isUTC {
            dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        } else {
            dateFormatter.timeZone = TimeZone.current
        }
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = dateFormatFormat
        
        return dateFormatter.string(from: self)
    }
    
    func getTimeStringFromUTC() -> String {
        let dateFormatter = DateFormatter()
        let locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.locale = locale
        dateFormatter.dateStyle = .medium
        dateFormatter.dateFormat = "hh:mm a"
        dateFormatter.amSymbol = "AM"
        dateFormatter.pmSymbol = "PM"
        return dateFormatter.string(from: self)
    }
    
    func offsetFrom(date:NSDate) -> String {
        
        let calendarComponents : Set<Calendar.Component> = [.day, .hour, .minute, .second]
        
        let difference = NSCalendar.current.dateComponents(calendarComponents, from: date as Date, to: self)
        
        var seconds : String = ""
        var minutes : String = ""
        var hours : String = ""
        var days : String = ""
        
        let tmp1 : String = String(format: "%.2d", abs(difference.second!))
        let tmp2 : String = String(format: "%.2d", abs(difference.minute!))
        let tmp3 : String = String(format: "%.2d", abs(difference.hour!))
        //let tmp4 : String = String(format: "%d", difference.day!)
        
        seconds = "\(tmp1)"
        minutes = "\(tmp2)" + ":" + seconds
        hours = "\(tmp3)" + ":" + minutes
        days = "" + " " + hours
        
        if difference.second! >= 0 && difference.minute! >= 0 && difference.hour! >= 0 && difference.day! >= 0 {
            return days
        }
        else {
            return days
        }
    }
    
    
    //For Notification
    public var weekday: Int {
        return Calendar.current.component(.weekday, from: self)
    }

    public var hour: Int {
        get {
            return Calendar.current.component(.hour, from: self)
        }
        set {
            let allowedRange = Calendar.current.range(of: .hour, in: .day, for: self)!
            guard allowedRange.contains(newValue) else { return }

            let currentHour = Calendar.current.component(.hour, from: self)
            let hoursToAdd = newValue - currentHour
            if let date = Calendar.current.date(byAdding: .hour, value: hoursToAdd, to: self) {
                self = date
            }
        }
    }

    public var minute: Int {
        get {
            return Calendar.current.component(.minute, from: self)
        }
        set {
            let allowedRange = Calendar.current.range(of: .minute, in: .hour, for: self)!
            guard allowedRange.contains(newValue) else { return }

            let currentMinutes = Calendar.current.component(.minute, from: self)
            let minutesToAdd = newValue - currentMinutes
            if let date = Calendar.current.date(byAdding: .minute, value: minutesToAdd, to: self) {
                self = date
            }
        }
    }
    
}

func timeAgoSinceDate(_ date:Date, numericDates:Bool = false) -> String {
    let calendar = NSCalendar.current
    let unitFlags: Set<Calendar.Component> = [.minute, .hour, .day, .weekOfYear, .month, .year, .second]
    let now = Date()
    let earliest = now < date ? now : date
    let latest = (earliest == now) ? date : now
    let components = calendar.dateComponents(unitFlags, from: earliest,  to: latest)
    
    if (components.year! >= 2) {
        return "\(components.year!) years ago"
    } else if (components.year! >= 1){
        if (numericDates){
            return "1 year ago"
        } else {
            return "last year"
        }
    } else if (components.month! >= 2) {
        return "\(components.month!) months ago"
    } else if (components.month! >= 1){
        if (numericDates){
            return "1 month ago"
        } else {
            return "last month"
        }
    } else if (components.weekOfYear! >= 2) {
        return "\(components.weekOfYear!) weeks ago"
    } else if (components.weekOfYear! >= 1){
        if (numericDates){
            return "1 week ago"
        } else {
            return "last week"
        }
    } else if (components.day! >= 2) {
        return "\(components.day!) days ago"
    } else if (components.day! >= 1){
        if (numericDates){
            return "1 day ago"
        } else {
            return "yesterday at \(date.getTimeStringFromUTC())"
        }
    } else if (components.hour! >= 2) {
        return "\(components.hour!) hours ago"
    } else if (components.hour! >= 1){
        if (numericDates){
            return "1 hour ago"
        } else {
            return "an hour ago"
        }
    } else if (components.minute! >= 2) {
        return "\(components.minute!) minutes ago"
    } else if (components.minute! >= 1){
        if (numericDates){
            return "1 minute ago"
        } else {
            return "a minute ago"
        }
    } else if (components.second! >= 3) {
        return "just now"//"\(components.second!) seconds ago"
    } else {
        return "just now"
    }
}

//For get difren for two date


