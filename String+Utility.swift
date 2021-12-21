
import UIKit

extension String {
    
    func titlecased() -> String {
        return self.replacingOccurrences(of: "([A-Z])", with: " $1", options: .regularExpression, range: self.range(of: self))
            .trimmingCharacters(in: .whitespacesAndNewlines)
            .capitalized
    }
    
    var isNumber: Bool {
        return !isEmpty && rangeOfCharacter(from: CharacterSet.decimalDigits.inverted) == nil
    }
    
    
    var capitalizedFirstLetter:String {
          let string = self
          return string.replacingCharacters(in: startIndex...startIndex, with: String(self[startIndex]).capitalized)
    }
    
    var isValidEmail: Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    
    var isValidPhone: Bool {
        let charcterSet  = NSCharacterSet(charactersIn: "+0123456789").inverted
        let inputString = self.components(separatedBy: charcterSet)
        let filtered = inputString.joined(separator: "")
        let range = 10
        
        return  self == filtered && self.count >= range && self.count < 15
    }
    
    var isValidateGST: Bool {
        
        let GST_REGEX = "^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[1-9A-Z]{1}Z[0-9A-Z]{1}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", GST_REGEX)
        let result =  phoneTest.evaluate(with: self)
        return result
    }
    
    var isvalidatePANCardNo : Bool {
        let regularExpression = "[A-Z]{5}[0-9]{4}[A-Z]{1}"
        let panCardValidation = NSPredicate(format : "SELF MATCHES %@", regularExpression)
        let result = panCardValidation.evaluate(with: self)
        return result
    }
    
    var isValidPinCode: Bool {
        let pinRegex = "^[0-9]{6}$"
        let pinTest = NSPredicate(format: "SELF MATCHES %@", pinRegex)
        return pinTest.evaluate(with: self)
    }
    var isValidPass: Bool {
        let emailRegEx = "(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
    var isValidUserName : Bool {
        
        let characterset = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789")
        
        if self.rangeOfCharacter(from: characterset.inverted) != nil {
            print("string contains special characters")
            return false
        } else {
            return true
        }
        
    }
    
    var isValidFirstName : Bool {
        
        let characterset = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ ")
        
        if self.rangeOfCharacter(from: characterset.inverted) != nil {
            print("string contains special characters")
            return false
        } else {
            return true
        }
        
    }
    
    var isValidName :  Bool {
        let nameRegEx = "^[A-Za-z '-]+$"
        
        let nameTest = NSPredicate(format:"SELF MATCHES %@", nameRegEx)
        return nameTest.evaluate(with: self)
    }
    var isValidCreditCard : Bool {
        let regex = "^(?:4[0-9]{12}(?:[0-9]{3})?|5[1-5][0-9]{14}|6(?:011|5[0-9][0-9])[0-9]{12}|3[47][0-9]{13}|3(?:0[0-5]|[68][0-9])[0-9]{11}|(?:2131|1800|35\\d{3})\\d{11})$"
        let cardtest = NSPredicate(format:"SELF MATCHES %@", regex)
        return cardtest.evaluate(with: self)
    }
    var length: Int {
        return self.count
    }
    
    func currencyInputFormatting() -> String {
        
        var number: NSNumber!
        let formatter = NumberFormatter()
        formatter.numberStyle = .currencyAccounting
        formatter.locale = NSLocale(localeIdentifier: "en_GB") as Locale
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 2
        
        var amountWithPrefix = self
        
        // remove from String: "$", ".", ","
        let regex = try! NSRegularExpression(pattern: "[^0-9]", options: .caseInsensitive)
        amountWithPrefix = regex.stringByReplacingMatches(in: amountWithPrefix, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, self.count), withTemplate: "")
        
        let double = (amountWithPrefix as NSString).doubleValue
        number = NSNumber(value: (double / 100))
        
        // if first number is 0 or all numbers were deleted
        guard number != 0 as NSNumber else {
            return ""
        }
        
        return formatter.string(from: number)!
    }
    
    func convertHtmltoActualString(lblForFont:UILabel) {
        
        guard let data = data(using: .utf8) else {
            lblForFont.text = self
            return
        }
        
        do{
            
            let options : [NSAttributedString.DocumentReadingOptionKey: Any] = [NSAttributedString.DocumentReadingOptionKey.documentType : NSAttributedString.DocumentType.html, NSAttributedString.DocumentReadingOptionKey.characterEncoding: String.Encoding.utf8.rawValue]
            
            let attributedString = try NSMutableAttributedString(data: data, options: options, documentAttributes: nil)
            //attributedString.addAttribute(NSAttributedStringKey.font, value: UIFont(name: "Asana-Math", size: 16) ?? UIFont.systemFont(ofSize: 16), range: (self as NSString).range(of: self))
            
            lblForFont.attributedText = attributedString
            lblForFont.font = UIFont.systemFont(ofSize: 16)
            //lblForFont.font = UIFont(name: "Asana-Math", size: 16) ?? UIFont.systemFont(ofSize: 16)
            
        }catch {
            lblForFont.text = self
            return
        }
    }
    
    func removeNullFromString() -> String {
        
        if self != "<null>" {
            return self
        }
        return ""
    }
    
    func removeSpaceFromString() -> String {
        return self.replacingOccurrences(of: " ", with: "")
    }
    
    func getTwoDecimalValuesFromString() -> String {
        if let double = Double(self) {
            let finalStringWithTwoDecimal = String(format: "%.2f", double)
            return finalStringWithTwoDecimal
        }
        return ""
    }
    
    func convertJSONStringToDictionary() -> [String: Any]? {
        if let data = self.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
    
    func strstr(needle: String, beforeNeedle: Bool = false) -> String? {
        guard let range = self.range(of: needle) else { return nil }
        
        if beforeNeedle {
            return self.substring(to: range.lowerBound)
        }
        
        return self.substring(from: range.upperBound)
    }
    
//    var localized: String {
//        if let _ = UserDefaults.standard.string(forKey: "i18n_language") {} else {
//            // we set a default, just in case
//            UserDefaults.standard.set("guj", forKey: "i18n_language")
//            UserDefaults.standard.synchronize()
//        }
//
//        let lang = UserDefaults.standard.string(forKey: "i18n_language")
//
//        let path = Bundle.main.path(forResource: lang, ofType: "lproj")
//        let bundle = Bundle(path: path!)
//
//        return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")
//    }
    
    func toDate(dateFormatFormat:String,isUTC:Bool = false) -> Date? {
        
        let dateFormatter = DateFormatter()
        
        if isUTC {
            dateFormatter.timeZone = TimeZone(abbreviation: "UTC")
        } else {
            dateFormatter.timeZone = TimeZone.current
        }
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = dateFormatFormat
        
        return dateFormatter.date(from: self)
    }
}

@IBDesignable class CustomTextField: UITextField {
    @IBInspectable var maximumCharacters: Int = 80 {
        didSet {
            limitCharacters()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        limitCharacters()
        addTarget(self, action: #selector(limitCharacters), for: .editingChanged)
    }

    @objc func limitCharacters() {
        guard text != nil else {
            return
        }
        if (text?.count)! > maximumCharacters {
            if let range = text?.index(before: (text?.endIndex)!) {
                text = text?.substring(to: range)
            }
        }
    }
}
//MARK:- Dictionary
extension Dictionary {
    
    func nullKeyRemovalFormDictionary() -> Dictionary {
        var dict = self
        
        let keysToRemove = Array(dict.keys).filter { dict[$0] is NSNull }
        for key in keysToRemove {
            dict.removeValue(forKey: key)
        }
        
        return dict
    }
}
