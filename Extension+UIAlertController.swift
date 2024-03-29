
import Foundation
import UIKit

extension UIAlertController {
    /**
     Display an Alert / Actionsheet
     
     - parameter controller:     Object of controller on which you need to display Alert/Actionsheet
     - parameter aStrMessage:    Message to display in Alert / Actionsheet
     - parameter style:          .Alert / .Actionshhet
     - parameter aCancelBtn:     Cancel button title
     - parameter aDistrutiveBtn: Distructive button title
     - parameter otherButtonArr: Array of other button title
     - parameter completion:     Completion block. Other Button Index Starting From - 0 | Destructive Index - (Last / 2nd Last Index) | Cancel Index - (Last / 2nd Last Index)
     */
    class func showAlert(_ controller : AnyObject ,
                         position : CGRect,
                         strTitle :String? = APP_NAME,
                         aStrMessage :String? ,
                         style : UIAlertController.Style ,
                         aCancelBtn :String? ,
                         aDistrutiveBtn : String?,
                         otherButtonArr : Array<String>?,
                         completion : ((Int, String) -> Void)?) -> Void {
        
        let alert = UIAlertController.init(title: strTitle, message: aStrMessage, preferredStyle: style)
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            let Vc =  controller as? UIViewController
            if Vc != nil{
                
                alert.popoverPresentationController?.sourceView = Vc!.view!
                alert.popoverPresentationController?.sourceRect = position
            }
        }
        
        if let strDistrutiveBtn = aDistrutiveBtn {
            
            let aStrDistrutiveBtn = strDistrutiveBtn
            
            alert.addAction(UIAlertAction.init(title: aStrDistrutiveBtn, style: .destructive, handler: { (UIAlertAction) in
                
                completion?(otherButtonArr != nil ? otherButtonArr!.count : 0, strDistrutiveBtn)
                
            }))
        }
        
        if let strCancelBtn = aCancelBtn {
            
            let aStrCancelBtn = strCancelBtn
            
            alert.addAction(UIAlertAction.init(title: aStrCancelBtn, style: .cancel, handler: { (UIAlertAction) in
                
                if ( aDistrutiveBtn != nil ) {
                    completion?(otherButtonArr != nil ? otherButtonArr!.count + 1 : 1, strCancelBtn)
                } else {
                    completion?(otherButtonArr != nil ? otherButtonArr!.count : 0, strCancelBtn)
                }
                
            }))
        }
        
        if let arr = otherButtonArr {
            
            for (index, value) in arr.enumerated() {
                
                let aValue = value
                
                alert.addAction(UIAlertAction.init(title: aValue, style: .default, handler: { (UIAlertAction) in
                    
                    completion?(index, value)
                    
                }))
            }
        }
        
        controller.present(alert, animated: true, completion: nil)
        
    }
    
    /**
     Display an Alert / Actionsheet
     
     - parameter controller:     Object of controller on which you need to display Alert/Actionsheet
     - parameter aStrMessage:    Message to display in Alert / Actionsheet
     - parameter style:          .Alert / .Actionshhet
     - parameter aCancelBtn:     Cancel button title
     - parameter aDistrutiveBtn: Distructive button title
     - parameter otherButtonArr: Array of other button title
     - parameter completion:     Completion block. Other Button Index Starting From - 0 | Destructive Index - (Last / 2nd Last Index) | Cancel Index - (Last / 2nd Last Index)
     */
    class func showAlert(_ controller : AnyObject ,
                         strTitle :String? = APP_NAME,
                         aStrMessage :String? ,
                         style : UIAlertController.Style ,
                         aCancelBtn :String? ,
                         aDistrutiveBtn : String?,
                         otherButtonArr : Array<String>?,
                         completion : ((Int, String) -> Void)?) -> Void {
        
        let alert = UIAlertController.init(title: strTitle, message: aStrMessage, preferredStyle: style)
        
        
        if let strDistrutiveBtn = aDistrutiveBtn {
            
            let aStrDistrutiveBtn = strDistrutiveBtn
            
            alert.addAction(UIAlertAction.init(title: aStrDistrutiveBtn, style: .destructive, handler: { (UIAlertAction) in
                
                completion?(otherButtonArr != nil ? otherButtonArr!.count : 0, strDistrutiveBtn)
                
            }))
        }
        
        if let strCancelBtn = aCancelBtn {
            
            let aStrCancelBtn = strCancelBtn
            
            alert.addAction(UIAlertAction.init(title: aStrCancelBtn, style: .cancel, handler: { (UIAlertAction) in
                
                if ( aDistrutiveBtn != nil ) {
                    completion?(otherButtonArr != nil ? otherButtonArr!.count + 1 : 1, strCancelBtn)
                } else {
                    completion?(otherButtonArr != nil ? otherButtonArr!.count : 0, strCancelBtn)
                }
                
            }))
        }
        
        if let arr = otherButtonArr {
            
            for (index, value) in arr.enumerated() {
                
                let aValue = value
                
                alert.addAction(UIAlertAction.init(title: aValue, style: .default, handler: { (UIAlertAction) in
                    
                    completion?(index, value)
                    
                }))
            }
        }
        
        controller.present(alert, animated: true, completion: nil)
        
    }
    
    
    
    /**
     Display an Alert With "Ok" Button
     
     - parameter controller:  Object of controller on which you need to display Alert
     - parameter aStrMessage: Message to display in Alert
     - parameter completion:  Completion block. Ok Index - 0
     */
    class func showAlertWithOkButton(_ controller : AnyObject ,
                                     strTitle :String? = APP_NAME,
                                     aStrMessage :String? ,
                                     completion : ((Int, String) -> Void)?) -> Void {
        
        self.showAlert(controller, strTitle: strTitle, aStrMessage: aStrMessage, style: .alert, aCancelBtn: nil, aDistrutiveBtn: nil, otherButtonArr: ["OK"], completion: completion)
        
    }
    
    class func showErrorAlertWithOkButton(_ controller : AnyObject ,
                                     strTitle :String? = APP_NAME,
                                     aStrMessage :String?) -> Void {
        
        self.showAlert(controller, strTitle: strTitle, aStrMessage: aStrMessage, style: .alert, aCancelBtn: nil, aDistrutiveBtn: nil, otherButtonArr: ["OK"], completion: nil)
        
    }
    
    class func showAlertWithOkCancelButton(_ controller : AnyObject ,
                                          strTitle :String? = APP_NAME,
                                          aStrMessage :String? ,
                                          completion : ((Int, String) -> Void)?) -> Void {
        
        self.showAlert(controller, strTitle: strTitle, aStrMessage: aStrMessage, style: .alert, aCancelBtn: nil, aDistrutiveBtn: nil, otherButtonArr: ["OK","Cancel"], completion: completion)
        
    }
    
    class func showAlertWithOkRetryButton(_ controller : AnyObject ,
                                          strTitle :String? = APP_NAME,
                                          aStrMessage :String? ,
                                          completion : ((Int, String) -> Void)?) -> Void {
        
        self.showAlert(controller, strTitle: strTitle, aStrMessage: aStrMessage, style: .alert, aCancelBtn: nil, aDistrutiveBtn: nil, otherButtonArr: ["Cancel","Retry"], completion: completion)
        
    }
    
    /**
     Display an Alert With "Cancel" Button
     
     - parameter controller:  Object of controller on which you need to display Alert
     - parameter aStrMessage: Message to display in Alert
     - parameter completion:  Completion block. Cancel Index - 0
     */
    class func showAlertWithCancelButton(_ controller : AnyObject ,
                                         strTitle :String? = APP_NAME,
                                         aStrMessage :String? ,
                                         completion : ((Int, String) -> Void)?) -> Void {
        
        self.showAlert(controller, strTitle: strTitle, aStrMessage: aStrMessage, style: .alert, aCancelBtn: "Cancel", aDistrutiveBtn: nil, otherButtonArr: nil, completion: completion)
        
    }
    
    
    
    /**
     Display an Alert For Delete Confirmation
     
     - parameter controller:  Object of controller on which you need to display Alert
     - parameter aStrMessage: Message to display in Alert
     - parameter completion:  Completion block. Use Gallery Index - 0 | Use Camera Index - 1 | Cancel Index - 2
     */
    class func showDeleteAlert(_ controller : AnyObject ,
                               strTitle :String? = APP_NAME,
                               aStrMessage :String? ,
                               completion : ((Int, String) -> Void)?) -> Void {
        
        self.showAlert(controller, strTitle: strTitle, aStrMessage: aStrMessage, style: .alert, aCancelBtn: "Cancel", aDistrutiveBtn: "Delete", otherButtonArr: nil, completion: completion)
        
    }
    
    
    
    /**
     Display an Actionsheet For ImagePicker
     
     - parameter controller:  Object of controller on which you need to display Alert
     - parameter aStrMessage: Message to display in Actionsheet
     - parameter completion:  Completion block. Delete Button Index - 0 | Cancel Button Index - 1
     */
    class func showActionsheetForImagePicker(_ controller : AnyObject ,
                                             strTitle :String? = APP_NAME,
                                             aStrMessage :String? ,
                                             completion : ((Int, String) -> Void)?) -> Void {
        
        self.showAlert(controller, strTitle: strTitle, aStrMessage: aStrMessage, style: .actionSheet, aCancelBtn: "Cancel", aDistrutiveBtn: nil, otherButtonArr: ["Use Gallery", "Use Camera", "Use iCloud Drive"], completion: completion)
        
    }
    
    
    /**
     Display an Actionsheet For ImagePicker
     
     - parameter controller:  Object of controller on which you need to display Alert
     - parameter aStrMessage: Message to display in Actionsheet
     - parameter completion:  Completion block. Delete Button Index - 0 | Cancel Button Index - 1
     */
    class func showActionsheetForImagePicker(_ controller : AnyObject ,
                                             position : CGRect,
                                             strTitle :String? = APP_NAME,
                                             aStrMessage :String? ,
                                             completion : ((Int, String) -> Void)?) -> Void {
        
        self.showAlert(controller, position : position ,strTitle: strTitle,aStrMessage: aStrMessage, style: .actionSheet, aCancelBtn: "Cancel", aDistrutiveBtn: nil, otherButtonArr: ["Use Gallery", "Use Camera"], completion: completion)
        
    }
    
    class func showActionsheetForGender(_ controller : AnyObject ,
                                             position : CGRect,
                                             strTitle :String? = "Select Gender",
                                             aStrMessage :String? ,
                                             completion : ((Int, String) -> Void)?) -> Void {
        
        self.showAlert(controller, position : position ,strTitle: strTitle,aStrMessage: aStrMessage, style: .actionSheet, aCancelBtn: "Cancel", aDistrutiveBtn: nil, otherButtonArr: ["Male", "Female"], completion: completion)
        
    }
    
    class func showActionsheetForLogout(_ controller : AnyObject ,
                                        position : CGRect,
                                        strTitle :String? = APP_NAME,
                                        aStrMessage :String? ,
                                        completion : ((Int, String) -> Void)?) -> Void {
        
        
        self.showAlert(controller, position : position ,strTitle: strTitle, aStrMessage: aStrMessage, style: .alert, aCancelBtn: "Cancel", aDistrutiveBtn: "Logout", otherButtonArr: nil, completion: completion)
        
    }
    
    class func showActionsheetForVidePicker(_ controller : AnyObject ,
                                            position : CGRect,
                                            strTitle :String? = APP_NAME,
                                            aStrMessage :String? ,
                                            completion : ((Int, String) -> Void)?) -> Void {
        
        self.showAlert(controller, position : position ,strTitle: strTitle, aStrMessage: aStrMessage, style: .actionSheet, aCancelBtn: "Cancel", aDistrutiveBtn: nil, otherButtonArr: ["Use Gallery", "Use Camera"], completion: completion)
        
    }
    
    //For Displaying mail and message
    class func showActionsheetForMailorMessage(_ controller : AnyObject ,
                                             strTitle :String? = APP_NAME,
                                             aStrMessage :String? ,
                                             completion : ((Int, String) -> Void)?) -> Void {
        
        
        if UIDevice.current.userInterfaceIdiom == .phone {
            self.showAlert(controller, strTitle: strTitle, aStrMessage: aStrMessage, style: .actionSheet, aCancelBtn: "Cancel", aDistrutiveBtn: nil, otherButtonArr: ["Send Mail", "Send Message"], completion: completion)
        }
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            self.showAlert(controller, strTitle: strTitle, aStrMessage: aStrMessage, style: .alert, aCancelBtn: "Cancel", aDistrutiveBtn: nil, otherButtonArr: ["Send Mail", "Send Message"], completion: completion)
        }
    }
    class func showActionsheetForViewEditDelete(_ controller : AnyObject ,
                                             strTitle :String? = APP_NAME,
                                             aStrMessage :String? ,
                                             strArray : [String],
                                             completion : ((Int, String) -> Void)?) -> Void {
        //["View", "Edit", "Delete"]
        
        if UIDevice.current.userInterfaceIdiom == .phone {
            self.showAlert(controller, strTitle: strTitle, aStrMessage: aStrMessage, style: .actionSheet, aCancelBtn: "Cancel", aDistrutiveBtn: nil, otherButtonArr: strArray, completion: completion)
        }
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            self.showAlert(controller, strTitle: strTitle, aStrMessage: aStrMessage, style: .alert, aCancelBtn: "Cancel", aDistrutiveBtn: nil, otherButtonArr: strArray, completion: completion)
        }
    }
}
