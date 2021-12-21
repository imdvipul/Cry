
import UIKit
import TTGSnackbar

//MARK :- Application Level
let APP_NAME = ""
var ISDebug = true
let appDel = UIApplication.shared.delegate as! AppDelegate
let userDefault = UserDefaults.standard

var arrForMenuSection = [String]()

struct Section {
    var mainMenu = ""
    var subMenu = [String]()
}

var sectionForDashboar = [Section]()

class Constants: NSObject {
    
    //MARK:- UIDevice Related
    static let K_Screen_Size = UIScreen.main.bounds
    static let K_Device_IS_IPHONE = (UIDevice.current.userInterfaceIdiom == .phone)
    
    //static let K_Device_Model = UIDevice.modelName
    static let K_Device_Name = UIDevice.current.name
    static let K_Device_SystemName = UIDevice.current.systemName
    static let K_Device_Version = UIDevice.current.systemVersion
    
    //MARK:- USERDEFAULTS keys
    struct UserDefaults {
        static var kLogin_userDetails = "Login_userDetails"
        static let kLogin_username = "Login_username"
        static let kLogin_password = "Login_password"
        static let k_UserDefaults_TouchIdStatus = "UserDefaults_TouchIdStatus"
        static let k_authModel_Store = "Userdefault_authModel"
    }
    
    //MARK:- PrintLog
    static func printLog(strLog:String) {
        if ISDebug {
            print(strLog)
        }
    }
   
    static let k_PageSize_For_Pagination_10 = 10 //For pagination
    static let k_PageSize_For_Pagination_All = 1000000000 //For pagination
    

    
    //MARK:- API
    
    static func getBaseUrl() -> String {
        //return "http://retail365cloud.com/webapi/api/"
        //return "http://192.168.0.110:1003/api/"
        
//        let aModel = Helper.autheticateUser()
//        if let base = aModel?.object.notes {
//            return base + "api/"
//        }
        return ""
        
    }
    
    struct API {
        
        
        //        static var API_BASE_URL : String! {
        //            return getBaseUrl()
        //
        //        }
        
        
        //Live
        static let API_BASE_URL = "";
        static let PORTEL_BASE_URL = "";
        static let k_BaseURL_AuthenticationKey = "" // for Authentication
        
        //Authentication
        static let AUTHENTICATIONKEY_URL = k_BaseURL_AuthenticationKey + "api/GetCustomerByAuthenticationKey"
        static let LOGIN_URL = API_BASE_URL + "user/login";
        static let USER_CHANGEPASSWORD = API_BASE_URL + "user/changepassword";
        static let USER_SENDOTP = API_BASE_URL + "user/sendotp";
        static let USER_FORGOTPASSWORD = API_BASE_URL + "user/forgotpassword";
        
        static let LIST_VISITOR = API_BASE_URL + "visitor/list";
        static let MANAGE_VISITOR = API_BASE_URL + "visitor/manage";
        static let EDIT_VISITOR = API_BASE_URL + "visitor/edit";
        
        
        //Salesforce
        static let LIST_LEAD = API_BASE_URL + "lead/list";
        static let LEAD_EDIT = API_BASE_URL + "lead/edit";
        static let LEAD_MANAGE = API_BASE_URL + "lead/manage";
        
        static let LIST_OPPORTUNITY = API_BASE_URL + "opportunity/list";
        static let manage_OPPORTUNITY = API_BASE_URL + "opportunity/manage";
        static let LIST_negotiation = API_BASE_URL + "opportunity/negotiation/list";
        static let manage_negotiation = API_BASE_URL + "opportunity/negotiation/manage";
        static let manage_quotation = API_BASE_URL + "opportunity/quotation/manage";
        
        
        //Master
        static let MARTER_BASE = "master/";
        static let MASTER_VISITORTYPE = API_BASE_URL + MARTER_BASE + "visitortype";
        static let MASTER_DEPARTMENT = API_BASE_URL + MARTER_BASE + "department";
        static let MASTER_STAFFLIST = API_BASE_URL + MARTER_BASE + "stafflist";
        static let MASTER_DESIGNATION = API_BASE_URL + MARTER_BASE + "designation";
        static let MASTER_VISITPURPOSE = API_BASE_URL + MARTER_BASE + "visitpurpose";
        static let MASTER_COUNTRY = API_BASE_URL + MARTER_BASE + "country";
        static let MASTER_STATE = API_BASE_URL + MARTER_BASE + "state";
        static let MASTER_CITY = API_BASE_URL + MARTER_BASE + "city";
        
        static let MASTER_ASSIGNTO = API_BASE_URL + MARTER_BASE + "assignto";
        static let MASTER_RATING = API_BASE_URL + MARTER_BASE + "rating";
        static let MASTER_LEADSTATUS = API_BASE_URL + MARTER_BASE + "leadstatus";
        static let MASTER_LEADSOURCE = API_BASE_URL + MARTER_BASE + "leadsource";
        
        static let MASTER_ADDRESSTYPE = API_BASE_URL + MARTER_BASE + "addresstype";
        static let MASTER_COMPANY = API_BASE_URL + MARTER_BASE + "company";
        static let MASTER_INDUSTRY = API_BASE_URL + MARTER_BASE + "industry";
        static let MASTER_PRODUCT = API_BASE_URL + MARTER_BASE + "product";
        static let MASTER_PRODUCTBYID = API_BASE_URL + MARTER_BASE + "productbyid";
        static let MASTER_TAXSTRUCTURE = API_BASE_URL + MARTER_BASE + "taxstructure";
        
        
        
        
        //Upload documents
        //        static let UPLOAD_VISITOR = PORTEL_BASE_URL + "documents/visitor?";
        //        static let UPLOAD_ENJOIN = PORTEL_BASE_URL + "documents/enjoin?";
        
        static let UPLOAD_VISITOR = PORTEL_BASE_URL + "FileUploadApp/UploadVisitorImage?";
        static let UPLOAD_ENJOIN = PORTEL_BASE_URL + "FileUploadApp/UploadEnjoinImage?";
        static let API_VISITOR_GATEPASS_PRINT = "HR/VisitorPrintFile?";
        
        //Employee
        static let MANAGE_EMPLOYEE = API_BASE_URL + "employee/manage";
        
        //Notification
        static let LIST_NOTIFICATION = API_BASE_URL + "notification/list";
        
        //Chat
        static let CHAT_CHATMSGS = API_BASE_URL + "chat/chatmsgs";
        static let CHAT_MANAGE = API_BASE_URL + "chat/manage";
        static let CHAT_USERS = API_BASE_URL + "chat/users";
        
    }
    
    struct APIHeader {
        
        //region Headers Constant Values
        static let API_HEADER_API_VERSION_1 = ["api-version": "1.0"];
        static let API_HEADER_API_VERSION_2 = ["api-version": "2.0"];
        static let API_HEADER_API_VERSION_3 = ["api-version": "3.0"];
        
    }
    
    struct k_API_ResponseKeys {
        
        static let k_API_Count = "count"
        static let k_API_Data = "data"
        static let k_API_Status = "status"
        static var k_API_Message = "message"
        static var k_API_DeleteMessage = "Deleted Successfully"
    }
    
    static func IsiPad() -> Bool {
        let deviceIdiom = UIScreen.main.traitCollection.userInterfaceIdiom
        
        // 2. check the idiom
        switch (deviceIdiom) {
            
        case .pad:
            return true
        case .phone:
            print("iPhone and iPod touch style UI")
        case .tv:
            print("tvOS style UI")
        default:
            print("Unspecified UI idiom")
        }
        return false
    }
    
  
    struct OrderBy {
        static let ASC = "ASC"
        static let DESC = "DESC"
        static let DEFAULT_SORT = "DESC"
    }
    
    struct UINavigation {
        
        static let k_Navigation_Home = "Navigation_Home"
        static let k_Navigation_Login = "Navigation_Login"
        static let k_Navigation_Splash = "Navigation_Splash"
        static let k_Navigation_Dashboard = "Navigation_Dashboard"
        static let k_Navigation_CodeVerification = "Navigation_CodeVerification"
        static let k_Navigation_MasterSplitVC = "MasterSplitVC"
    }
    
    struct viewControllerIds {
        static let k_VC_All = "All"
        static let k_VC_Upcoming = "Upcoming"
        static let k_VC_CheckedId = "CheckedId"
        static let k_VC_OverDue = "OverDue"
        static let k_VC_MyVisitor = "MyVisitor"
        //strViewControllerId
    }
    
    
    static let userNameKey = "username"
    static let chatUserId = "chatuserid"
    static let FBStatusKey = "Status"
    
    static let msgRead        = "3"
    static let msgUnRead      = "2"
    static let msgNotRecieved = "1"
    static let msgNotSend     = "0"
    
    
    // Date formatsyyyy-MM-dd HH:mm:ss
    static var SERVICE_DATE_FORMAT_1 = "yyyy-MM-dd'T'HH:mm:ss"
    static var CHAT_MSG_TIME_FORMAT = "hh:mm aa"
    static var RESPONSE_DATE_FORMAT_3 = "yyyy-MM-dd'T'HH:mm:ss.SSS"
    static let dateFormat_MM_dd_yyyy_hh_mm_ss_AM_PM = "MM/dd/yyyy hh:mm:ss a"
    static let dateFormat_dd_MMM_yyyy = "dd MMM yyyy"
    static let dateFormat_dd_MMMM_yyyy = "dd-MMMM-yyyy"
    static let dateFormat_dd_MM_yyyy = "dd-MM-yyyy"
    
    static let dateFormat_yyyy_MM_dd_HH_mm_ss = "yyyy-MM-dd HH:mm:ss"
    static let dateFormat_yyyy_MM_dd_HH_mm = "yyyy-MM-dd HH:mm"
    static let dateFormat_HH_mm_ss = "HH:mm:ss"
    
    static let dateFormat_yyyy_MM_dd_HH_mm_ss_Z = "yyyy-MM-dd HH:mm:ss Z"
    
    static func getDisplayFromAPIDate(strDateFromAPI:String, strDateFormatForDisplay:String) -> String {
        let dateFormat_MM_dd_yyyy_hh_mm_ss_AM_PM = "MM/dd/yyyy hh:mm:ss a"
        let dateFormat_yyyy_MM_dd_T_HH_mm_ss = "yyyy-MM-dd'T'HH:mm:ss"
        let dateFormat_yyyy_MM_dd_T_HH_mm_ss_SS = "yyyy-MM-dd'T'HH:mm:ss.SS"
        let dateFormat_yyyy_MM_dd_T_HH_mm_ss_SSS = "yyyy-MM-dd'T'HH:mm:ss.SSS"
        let dateFormat_yyyy_MM_dd_HH_mm_ss = "yyyy-MM-ddTHH:mm:ss"
        let k_Date_getFromAPI_dd_MM_yyyy_hh_mm_AM_PM = "dd/MM/yyyy hh:mm a"
        let k_Date_getFromAPI_dd_MM_yyyy_hh_mm_ss = "dd/MM/yyyy HH:mm:ss"
        // let dateFormat_yyyy_MM_dd_T_00_00_00 = "yyyy-MM-dd'T'00:00:00"
        let CHAT_MSG_TIME_FORMAT = "hh:mm aa"
        let dateFormat_dd_MMM_yyyy = "dd MMM yyyy"
        let dateFormat_yyyy_MM_dd_HH_mm_ss1 = "yyyy-MM-dd HH:mm:ss"
        
        if let date = strDateFromAPI.toDate(dateFormatFormat: dateFormat_dd_MMM_yyyy) {
            return date.toString(dateFormatFormat: strDateFormatForDisplay)
        }
        
        if let date = strDateFromAPI.toDate(dateFormatFormat: CHAT_MSG_TIME_FORMAT) {
            return date.toString(dateFormatFormat: strDateFormatForDisplay)
        }
        
        if let date = strDateFromAPI.toDate(dateFormatFormat: dateFormat_yyyy_MM_dd_T_HH_mm_ss) {
            return date.toString(dateFormatFormat: strDateFormatForDisplay)
        }
        
        if let date = strDateFromAPI.toDate(dateFormatFormat: dateFormat_yyyy_MM_dd_T_HH_mm_ss_SS) {
            return date.toString(dateFormatFormat: strDateFormatForDisplay)
        }
        
        if let date = strDateFromAPI.toDate(dateFormatFormat: dateFormat_yyyy_MM_dd_T_HH_mm_ss_SSS) {
            return date.toString(dateFormatFormat: strDateFormatForDisplay)
        }
        
        if let date = strDateFromAPI.toDate(dateFormatFormat: dateFormat_yyyy_MM_dd_HH_mm_ss) {
            return date.toString(dateFormatFormat: strDateFormatForDisplay)
        }
        
        if let date = strDateFromAPI.toDate(dateFormatFormat: dateFormat_MM_dd_yyyy_hh_mm_ss_AM_PM) {
            return date.toString(dateFormatFormat: strDateFormatForDisplay)
        }
        
        if let date = strDateFromAPI.toDate(dateFormatFormat: k_Date_getFromAPI_dd_MM_yyyy_hh_mm_AM_PM) {
            return date.toString(dateFormatFormat: strDateFormatForDisplay)
        }
        
        if let date = strDateFromAPI.toDate(dateFormatFormat: k_Date_getFromAPI_dd_MM_yyyy_hh_mm_ss) {
            return date.toString(dateFormatFormat: strDateFormatForDisplay)
        }
        if let date = strDateFromAPI.toDate(dateFormatFormat: dateFormat_yyyy_MM_dd_HH_mm_ss1) {
            return date.toString(dateFormatFormat: strDateFormatForDisplay)
        }
        
        
        return ""
    }
    
    //MARK:- Alert
    struct Alert {
        
        static let visitorName = "Enter visitor name."
        static let visitorType = "Select visitor type."
        static let purposeOfVisit = "Enter purpose of visit."
        static let constactNo = "Enter contact number."
        static let meetingDescription = "Enter meetting description."
        static let iDProofNo = "Enter ID Proof No."
        static let vehicleNo = "Enter vehicle No."
        static let whoToYouWish = "Enter who do you wish to meet?."
        static let companyName = "Enter visitor comapny name."
        static let totalVisitor = "Select total No. of visitor."
        static let emailValid = "Enter valid email address."
        static let validUsernameNadPassowrd = "Enter valid username and password."
        static let address = "Enter address."
        static let postcode = "Enter postcode."
        static let yourImage = "Capture your image first."
        static let departmetn = "Select department."
        static let country = "Select Country."
        static let state = "Select State."
        static let City = "Select City."
        static let dateSelect = "Select Visit Date."
    }
    
    
    //Smart Visitor Management
    
    struct Colors {
        
        
            static let colorPrimary = hexStringToUIColor(hex: "#fcbc13")
            static let colorPrimaryDark = hexStringToUIColor(hex: "#CA9916")
            static let colorAccent = hexStringToUIColor(hex: "#4c4c4c")
            static let app_logo_background = hexStringToUIColor(hex: "#FFFFFF")
            static let colorAppBackground = hexStringToUIColor(hex: "#ECF1F4")
            static let colorBorder = hexStringToUIColor(hex: "#e1e2e3")
            static let colorDark = hexStringToUIColor(hex: "#343434")
            static let colorBg = hexStringToUIColor(hex: "#FFFFFF")
            static let colorPrimaryText = hexStringToUIColor(hex: "#343434")
            static let colorSecondaryText = hexStringToUIColor(hex: "#757575")
            static let colorTextBackground = hexStringToUIColor(hex: "#66332233")
            static let colorHintText = hexStringToUIColor(hex: "#cc888888")
            static let colorDivider = hexStringToUIColor(hex: "#BDBDBD")
            static let colorLightYellow = hexStringToUIColor(hex: "#25FFC107")
            static let colorDarkYellow = hexStringToUIColor(hex: "#CA9916")
            static let colorWhite = hexStringToUIColor(hex: "#fff")
            static let colorRed = hexStringToUIColor(hex: "#f00")
            static let colorDarkGreen = hexStringToUIColor(hex: "#13B113")
            static let colorBlack = hexStringToUIColor(hex: "#000")
            static let colorGray = hexStringToUIColor(hex: "#cc888888")
            static let colorLightGray = hexStringToUIColor(hex: "#34888888")
            static let colorOffWhite = hexStringToUIColor(hex: "#eee")
        
    }
    
    struct Languages {
        static let eglishLanguage = "he"
        static let hindiLanguage = "hi"
        static let gujaratiLanguage = "gu"
    }
    
    //MARK:- Get Json Dictionary
    static func getJson(Dictionary : [String:Any]) {
        
        if ISDebug {
            if let theJSONData = try?  JSONSerialization.data(withJSONObject: Dictionary, options: .prettyPrinted), let theJSONText = String(data: theJSONData, encoding: String.Encoding.ascii) {
                printLog(strLog: "JSON string = \n\(theJSONText)")
            }
        }
    }
    
    static func getJsonFromArray(Array : Array<Any>) {
        
        if ISDebug {
            if let theJSONData = try?  JSONSerialization.data(withJSONObject: Array, options: .prettyPrinted), let theJSONText = String(data: theJSONData, encoding: String.Encoding.ascii) {
                printLog(strLog: "JSON string = \n\(theJSONText)")
            }
        }
    }
    
    static func getCurrentDate(outputFormat:String, isUTC : Bool = false) -> String {
        let date = Date()
        let formatter = DateFormatter()
        
        if isUTC {
            formatter.timeZone = TimeZone(identifier: "UTC")
        }
        
        formatter.dateFormat = outputFormat
        let currentDate = formatter.string(from: date)
        
        return currentDate
    }
    
    static func convertChatMsgTime(dateTime: String, outFormat : String = CHAT_MSG_TIME_FORMAT) -> String  {
        var msgDateTime:String = dateTime
        if msgDateTime != "" {
            msgDateTime = Constants.dateConversion(inputFormat: Constants.SERVICE_DATE_FORMAT_1, outputFormat: Constants.CHAT_MSG_TIME_FORMAT, inputDate: msgDateTime) ?? (dateConversion(inputFormat: Constants.RESPONSE_DATE_FORMAT_3, outputFormat: outFormat, inputDate: msgDateTime) ?? "")
        } else {
            msgDateTime = ""
        }
        return msgDateTime
    }
    // Function to convert date in user defined date format
    static func dateConversion(inputFormat:String, outputFormat:String, inputDate:String, isUTC : Bool = true) -> String? {
        var outputDate:String?
        
        if  !inputDate.isEmpty {
            let inputFormatter = DateFormatter()
            inputFormatter.dateFormat = inputFormat
            
            if isUTC {
                inputFormatter.timeZone = TimeZone(abbreviation: "UTC")
            }
            
            guard let showDate = inputFormatter.date(from: inputDate) else {
                return nil
            }
            
            inputFormatter.dateFormat = outputFormat
            
            if isUTC {
                inputFormatter.timeZone = Calendar.current.timeZone
            }
            
            guard outputDate != "" else { return nil}
            outputDate = inputFormatter.string(from: showDate)
        }
        
        return outputDate
    }
    
    //MARK:- Color hexa
    static func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    //MARK:- Display Toast
    static func displayToastAlert(objViewController : UIViewController,strTitle: String,strDescription : String, objimage : UIImage? = nil) {
        
        
        let snackbar = TTGSnackbar(message: strTitle, duration: .middle)
        snackbar.show()
        
        
    }
    
    struct CustomNotification {
        
        static func everyOtherDay(wtihStartDate startDate: Date) -> [Int]? {
            
            //
            let currentDate = Date()
            // get initial week day from start date to compare dates
            let weekDay = startDate.weekday
            
            // Then we need to get week of years for both dates
            let cal = Calendar.current
            
            guard let weekA = cal.dateComponents([.weekOfYear], from: startDate).weekOfYear else { return nil}
            
            guard let weekB = cal.dateComponents([.weekOfYear], from: currentDate).weekOfYear else {return nil}
            
            // create two arrays for week days
            
            let weekOne = [1,3,5,7]
            let weekTwo = [2,4,6]
            
            // then we create a module to check if we are in week one or week two
            
            let currentWeek = (weekA - weekB) % 2
            
            if currentWeek == 0 {
                //week 1
                return weekOne.contains(weekDay) ? weekOne : weekTwo
            } else {
                // week 2
                return weekOne.contains(weekDay) ? weekTwo : weekOne
            }
        }
    }
    
    //MARK:- Calculation Two Strings Value
    //Fstr : First String Value
    //Sstr : Second String Value
    //Operator : Pass +,-,/,*
    //Return String value calculation of two value
    static func twoStringCalculation(Fstr: Any, Sstr: Any, Operator: String) -> String
    {
        guard let F = Fstr as? String else {
            return ""
        }
        guard let S = Sstr as? String else {
            return ""
        }
        var strValue1 = removeOptional(str: F)
        
        var strValue2 = removeOptional(str: S)
        
        if strValue1 == ""
        {
            strValue1 = "0"
        }
        if strValue2 == ""
        {
            strValue2 = "0"
        }
        
        guard let a = Double(strValue1)?.rounded(toPlaces: 2) else {
            return "0"
        }
        guard let b = Double(strValue2)?.rounded(toPlaces: 2) else {
            return "0"
        }
        if Operator == "+"
        {
            return String(a + b)
        }
        else if Operator == "*"
        {
            return String(a * b)
        }
        else if Operator == "/"
        {
            return String(a / b)
        }
        return String(a - b)
    }
    
    static func isTwoStringGreaterThan(Fstr: Any, Sstr: Any) -> Bool
    {
        guard let F = Fstr as? String else {
            return false
        }
        guard let S = Sstr as? String else {
            return false
        }
        let fValu = removeOptional(str: F)
        
        let sValue = removeOptional(str: S)
      
        guard let a = Double(fValu) else {
            return false
        }
        guard let b = Double(sValue) else {
            return false
        }
      
        if a > b
        {
            return true
        }
        return false
    }
    
    static func CalculateTotal(arr:[[String:String]],key:String) -> String
    {
        var TotalValue = 0.0
        
        for dic in arr
        {
            if let temp = dic[key]
            {
                let strValue = removeOptional(str: temp)
                guard let a = Double(strValue) else {
                    return String(TotalValue)
                }
                TotalValue = TotalValue + a
            }
        }
        return String(TotalValue)
    }
    
    //Conver String value to String with 2 digit places
    static func Round2DigitPlaces(str: String) -> String {
        
        let strValue = removeOptional(str: str)
     
        if let value = NumberFormatter().number(from: strValue)?.doubleValue
        {
            return String(format: "%.2f", value)
        }
        else if let currentRatio = Double (strValue) {
                return String(format: "%.2f", currentRatio)
        }
        return "0.0"
    }
    
    static func removeOptional(str: String?)->String
    {
        var strValue = ""
        if let str1 = str
        {
            strValue = str1.replacingOccurrences(of: "Optional(", with: "").replacingOccurrences(of: ")", with: "").replacingOccurrences(of: ",", with: "").replacingOccurrences(of: "<null>", with: "")
        }
        return strValue
    }
    
}
extension UIColor {
    
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(strHex: Int) {
        
        self.init(
            red: (strHex >> 16) & 0xFF,
            green: (strHex >> 8) & 0xFF,
            blue: strHex & 0xFF
        )
    }
}
extension URL {
    var typeIdentifier: String? {
        return (try? resourceValues(forKeys: [.typeIdentifierKey]))?.typeIdentifier
    }
    var localizedName: String? {
        return (try? resourceValues(forKeys: [.localizedNameKey]))?.localizedName
    }
}
extension Double {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
