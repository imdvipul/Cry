////
////  Webservice.swift
////  PhantomExpress
////
////  Created by Macmini on 10/12/18.
////  Copyright © 2018 Citta. All rights reserved.
////
//
//import Foundation
//import UIKit
//import Alamofire
//import UIKit
//import SystemConfiguration
//import SVProgressHUD
//import SafariServices
//
//class Webservice {
//
//    //    let webservice = Webservice()
//
//    //check internet utility
//    class func isNetworkAvailable() -> Bool {
//
//        var zeroAddress = sockaddr_in()
//        zeroAddress.sin_len = UInt8(MemoryLayout<sockaddr_in>.size)
//        zeroAddress.sin_family = sa_family_t(AF_INET)
//
//        guard let defaultRouteReachability = withUnsafePointer(to: &zeroAddress, {
//            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {
//                SCNetworkReachabilityCreateWithAddress(nil, $0)
//            }
//        }) else {
//            return false
//        }
//
//        var flags: SCNetworkReachabilityFlags = []
//        if !SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags) {
//            return false
//        }
//
//        let isReachable = flags.contains(.reachable)
//        let needsConnection = flags.contains(.connectionRequired)
//
//        return (isReachable && !needsConnection)
//    }
//
//}
//
//
//extension Webservice {
//
//    //MARK:- POST METHODS
//    class func API(_ url: String,
//                   param: [String: Any]?,
//                   controller: UIViewController,
//                   header : [String: String]?,
//                   callSilently : Bool = false,
//                   methodType:HTTPMethod,
//                   isDisplayAlertWhenError:Bool = true,
//                   successBlock: @escaping (_ response: NSDictionary) -> Void,
//                   failureBlock: @escaping (_ error: Error? , _ isTimeOut: Bool) -> Void) {
//
//        // Internet is connected
//        if isNetworkAvailable() {
//
//            if !callSilently {
//
//                SVProgressHUD.show()
//            }
//
//            let urlWithUTF8 =  url.addingPercentEncoding(withAllowedCharacters:NSCharacterSet.urlQueryAllowed)
//
//            if ISDebug {
//                print("URL : \(urlWithUTF8!) \nParameters : \(String(describing: param))");
//            }
//
//            let header1 = HTTPHeaders(header!)
//
//            AF.request(urlWithUTF8!, method: methodType, parameters: param, encoding: JSONEncoding.default, headers: header1).responseJSON(completionHandler: { (response) in
//
//
//
//
//
//                if !callSilently {
//                    DispatchQueue.main.async {
//                        SVProgressHUD.dismiss()
//                    }
//                }
//
//                print("---- POST REQUEST URL RESPONSE : \(urlWithUTF8!)\n\(response.result)")
//                //print(response.timeline)
//
//                switch response.result {
//                case .success:
//
////                    if let aJSON = response.result.value as? NSDictionary {
////                        successBlock(aJSON)
////                    }
//
//                case .failure(let error):
//                    print(error)
//                    if (error as NSError).code == -1001 {
//                        // The request timed out error occured. // Code=-1001 "The request timed out."
//
//                        if isDisplayAlertWhenError {
//                            UIAlertController.showAlertWithOkButton(controller, aStrMessage: "The request timed out. Pelase try after again.", completion: nil)
//                        }
//                        failureBlock(error, true)
//                    } else {
//                        if isDisplayAlertWhenError {
//                            UIAlertController.showAlertWithOkButton(controller, aStrMessage: "Something went wrong", completion: nil)
//                        }
//                        failureBlock(error, false)
//                    }
//                    break
//                }
//
//            })
//
//        }
//        else{
//
//            // Internet is not connected
////            if isDisplayAlertWhenError {
////                UIAlertController.showAlertWithOkButton(controller, aStrMessage: "Internet is not available", completion: nil)
////            }
//            let aErrorConnection = NSError(domain: "InternetNotAvailable", code: 0456, userInfo: nil)
//            failureBlock(aErrorConnection as Error , false)
//        }
//    }
//
//    class func APIForPassArray(_ url: String,
//                       param: [[String: Any]]?,
//                       controller: UIViewController,
//                       header : [String: String]?,
//                       callSilently : Bool = false,
//                       methodType:HTTPMethod,
//                       isDisplayAlertWhenError:Bool = true,
//                       successBlock: @escaping (_ response: NSDictionary) -> Void,
//                       failureBlock: @escaping (_ error: Error? , _ isTimeOut: Bool) -> Void) {
//
//            // Internet is connected
//            if isNetworkAvailable() {
//
//                if !callSilently {
//                    SVProgressHUD.show()
//                }
//
//                var semaphore = DispatchSemaphore (value: 0)
//
//                let parameters = param
//
//                let data = try! JSONSerialization.data(withJSONObject: parameters, options: [])
//
//                var request = URLRequest(url: URL(string: url)!,timeoutInterval: Double.infinity)
//                request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//                request.addValue("1.0", forHTTPHeaderField: "api-version")
//
//                request.httpMethod = "POST"
//                request.httpBody = data
//
//                let task = URLSession.shared.dataTask(with: request) { data, response, error in
//
//                if !callSilently {
//                    DispatchQueue.main.async {
//                        SVProgressHUD.dismiss()
//                    }
//                }
//
//                  guard let data = data else {
//                    print(String(describing: error))
//                    failureBlock(error as! Error , false)
//                    return
//                  }
//                  print(String(data: data, encoding: .utf8)!)
//
//                    do {
//                        if let jsonArray = try JSONSerialization.jsonObject(with: data, options : .allowFragments) as? NSDictionary
//                        {
//                           print(jsonArray)
//                            successBlock(jsonArray)
//                        } else {
//                            print("bad json")
//                        }
//                    } catch let error as NSError {
//                        print(error)
//                        failureBlock(error as Error , false)
//                    }
//
//                  semaphore.signal()
//                }
//
//                task.resume()
//                semaphore.wait()
//
//            }
//            else{
//
//                let aErrorConnection = NSError(domain: "InternetNotAvailable", code: 0456, userInfo: nil)
//                failureBlock(aErrorConnection as Error , false)
//            }
//        }
//
//        static let k_FileName_Key = "FileName"
//        static let k_FileExtension_Key = ".jpeg"
//
//        static let k_UIImage_Key = "UIImage"
//        static let k_ReMark_Key = "ReMark"
//
//
//        class func POSTWithMultiPart(_ url: String,
//                                     images:[[String:Any]],
//                                     param: NSDictionary,
//                                     excelFile:URL? = nil,
//                                     controller: UIViewController,
//                                     header : [String: String]?,
//                                     callSilently : Bool = false,
//                                     successBlock: @escaping (_ response: NSDictionary) -> Void,
////                                     failureBlock: @escaping (_ error: Error? , _ isTimeOut: Bool) -> Void) {
////
////
////            if isNetworkAvailable() {
////
////                if !callSilently {
////                   SVProgressHUD.show()
////    //                MBProgressHUD.showAdded(to: (UIApplication.shared.delegate?.window!)! , animated: true)
////                }
////
////
////                let urlWithUTF8 =  url.addingPercentEncoding(withAllowedCharacters:NSCharacterSet.urlQueryAllowed)
////                if ISDebug {   print("URL : \(urlWithUTF8!)");   }
////
////
////                AF.upload(multipartFormData: { (multipartFormData) in
////
////                    let arrParametersKey = NSMutableArray(array: param.allKeys)
////                    let arrParametersValues = NSMutableArray(array: param.allValues)
////
////                    //For normal Parameters
////                    for index in 0 ..< arrParametersKey.count {
////
////                        if let strKey = arrParametersKey.object(at: index) as? String , let strValue = arrParametersValues.object(at: index) as? String {
////
////                            multipartFormData.append(strValue.data(using: .utf8)!, withName: strKey)
////                        }
////                    }
////
////
////                    //For Images
////                    for index in 0 ..< images.count {
////
////                        let dictCell = images[index]
////
////                        if let strKey = dictCell[self.k_FileName_Key] as? String , let strValue = dictCell[self.k_UIImage_Key] as? UIImage {
////
////                            if let data = strValue.jpegData(compressionQuality: 0.8) {
////
////                                //If you change .jpeg then kindly change it
////                                let strFileNameForUpload = strKey
////
////                                multipartFormData.append(data, withName: strFileNameForUpload, fileName: strFileNameForUpload, mimeType: "image/jpg")
////                            }
////
////                        }
////                    }
////
////                    //For ExcelFile
////                    if let fileURL = excelFile {
////
////                        let excelFileName = (fileURL.absoluteString as NSString).lastPathComponent
////
////                        do {
////
////                            let imageData = try Data(contentsOf: fileURL)
////                            Constants.printLog(strLog: "imageData: \(imageData.count)")
////
////                            multipartFormData.append(imageData, withName: excelFileName, fileName: excelFileName, mimeType: "application/vnd.ms-excel")
////
////
////                        } catch {
////                            print ("loading image file error")
////                        }
////
////                    }
////
////                }, usingThreshold: UInt64.init(), to: urlWithUTF8!, method: .post, headers: header) { (encodingResult) in
////
////                    switch encodingResult {
////                    case .success(let upload, _, _):
////
////                        if !callSilently {
////                            DispatchQueue.main.async {
////                              SVProgressHUD.dismiss()
////    //                            MBProgressHUD.hide(for: ((UIApplication.shared.delegate?.window)!)!, animated: true)
////                            }
////                        }
////
////                        upload.responseJSON { response in
////
////                            print("Response : \(String(describing: response.response?.statusCode))")
////
////                            if let aJSON =  response.result.value as? NSDictionary {
////                                print("---- POST SUCCESS RESPONSE : \(aJSON)")
////                                successBlock(aJSON)
////                            } else {
////                                failureBlock(nil, true)
////                            }
////                        }
////                        break
////                    case .failure(let encodingError):
////
////                        if !callSilently {
////                            DispatchQueue.main.async {
////                            SVProgressHUD.dismiss()
////    //                            MBProgressHUD.hide(for: ((UIApplication.shared.delegate?.window)!)!, animated: true)
////                            }
////                        }
////
////                        UIAlertController.showAlertWithOkButton(controller, aStrMessage: "Something went wrong", completion: nil)
////                        failureBlock(encodingError, false)
////                        break
////                    }
////
////                }
////
////            } else {
////                // Internet is not connected
////                UIAlertController.showAlertWithOkButton(controller, aStrMessage: "Internet is not available", completion: nil)
////                let aErrorConnection = NSError(domain: "InternetNotAvailable", code: 0456, userInfo: nil)
////                failureBlock(aErrorConnection as Error , false)
////            }
////
////        }
//
////    class func POSTWithMultiPart(_ url: String,
////                                 images:NSDictionary,
////                                 param: NSDictionary,
////                                 controller: UIViewController,
////                                 header : [String: String]?,
////                                 callSilently : Bool = false,
////                                 successBlock: @escaping (_ response: NSDictionary) -> Void,
////                                 failureBlock: @escaping (_ error: Error? , _ isTimeOut: Bool) -> Void) {
////
////
////        if isNetworkAvailable() {
////
////            if !callSilently {
////               SVProgressHUD.show()
////            }
////
////
////            let urlWithUTF8 =  url.addingPercentEncoding(withAllowedCharacters:NSCharacterSet.urlQueryAllowed)
////            if ISDebug {   print("URL : \(urlWithUTF8!)");   }
////
////
////            Alamofire.upload(multipartFormData: { (multipartFormData) in
////
////                let arrParametersKey = NSMutableArray(array: param.allKeys)
////                let arrParametersValues = NSMutableArray(array: param.allValues)
////
////                //For normal Parameters
////                for index in 0 ..< arrParametersKey.count {
////
////                    if let strKey = arrParametersKey.object(at: index) as? String , let strValue = arrParametersValues.object(at: index) as? String {
////
////                        multipartFormData.append(strValue.data(using: .utf8)!, withName: strKey)
////                    }
////                }
////
////                //For Images
////                for index in 0 ..< images.count {
////
////                    let arrParametersKey = NSMutableArray(array: images.allKeys)
////                    let arrParametersValues = NSMutableArray(array: images.allValues)
////
////                    if let strKey = arrParametersKey.object(at: index) as? String , let strValue = arrParametersValues.object(at: index) as? UIImage {
////
////                        //                        if let data = UIImagePNGRepresentation(strValue) {
////                        //
////                        //                            multipartFormData.append(data, withName: strKey, fileName: strKey,mimeType: "image/png")
////                        //                        }
////
//////                        if let data = UIImageJPEGRepresentation(strValue, 0.6) {
//////                            multipartFormData.append(data, withName: strKey, fileName: strKey,mimeType: "image/jpg")
//////                        }
////
////
////                    }
////                }
////
////            }, usingThreshold: UInt64.init(), to: urlWithUTF8!, method: .post, headers: header) { (encodingResult) in
////
////                switch encodingResult {
////                case .success(let upload, _, _):
////
////                    if !callSilently {
////                        DispatchQueue.main.async {
////                          SVProgressHUD.dismiss()
////                        }
////                    }
////
////                    upload.responseJSON { response in
////
////                        print("Response : \(String(describing: response.response?.statusCode))")
////
////                        if let aJSON =  response.result.value as? NSDictionary {
////                            print("---- POST SUCCESS RESPONSE : \(aJSON)")
////                            successBlock(aJSON)
////                        } else {
////                            failureBlock(nil, true)
////                        }
////                    }
////                    break
////                case .failure(let encodingError):
////
////                    if !callSilently {
////                        DispatchQueue.main.async {
////                        SVProgressHUD.dismiss()
////                        }
////                    }
////
////                    UIAlertController.showAlertWithOkButton(controller, aStrMessage: "Something went wrong", completion: nil)
////                    failureBlock(encodingError, false)
////                    break
////                }
////
////            }
////
////        } else {
////            // Internet is not connected
////            UIAlertController.showAlertWithOkButton(controller, aStrMessage: "Internet is not available", completion: nil)
////            let aErrorConnection = NSError(domain: "InternetNotAvailable", code: 0456, userInfo: nil)
////            failureBlock(aErrorConnection as Error , false)
////        }
////
////    }
//
//    //MARK:- DELETE & PUT
//
////    class func DELETEWithOriginalResponse(_ url: String,
////                                          param: [String: Any]?,
////                                          controller: UIViewController,
////                                          header : [String: String]?,
////                                          callSilently : Bool = false,
////                                          successBlock: @escaping (_ response: NSDictionary) -> Void,
////                                          failureBlock: @escaping (_ error: Error? , _ isTimeOut: Bool) -> Void) {
////
////        let urlWithUTF8 =  url.addingPercentEncoding(withAllowedCharacters:NSCharacterSet.urlQueryAllowed)
////        if ISDebug {   print("URL : \(urlWithUTF8!)");   }
////
////
////        // Internet is connected
////        if isNetworkAvailable() {
////
////            if !callSilently {
////                SVProgressHUD.show()
////            }
////
////            Alamofire.request(urlWithUTF8!, method: .delete, parameters: param, encoding: JSONEncoding(options: []), headers: header).responseJSON(completionHandler: { (response) in
////
////
////                if !callSilently{
////                    DispatchQueue.main.async {
////                        SVProgressHUD.dismiss()
////                    }
////                }
////
////                print("---- GET REQUEST URL RESPONSE : \(urlWithUTF8!)\n\(response.result)")
////                print(response.timeline)
////
////                switch response.result {
////                case .success:
////
////                    if !callSilently{
////                        DispatchQueue.main.async {
////                            SVProgressHUD.dismiss()
////                        }
////                    }
////
////                    if let result = response.result.value as? NSDictionary {
////                        successBlock(result)
////                    }
////
////                case .failure(let error):
////                    print(error)
////
////                    if !callSilently{
////                        DispatchQueue.main.async {
////                           SVProgressHUD.dismiss()
////                        }
////                    }
////
////                    if (error as NSError).code == -1001 {
////                        // The request timed out error occured. // Code=-1001 "The request timed out."
////                        UIAlertController.showAlertWithOkButton(controller, aStrMessage: "The request timed out. Pelase try after again.", completion: nil)
////                        failureBlock(error, true)
////                    } else {
////                        failureBlock(error, false)
////                    }
////                    break
////                }
////
////            })
////
////        }
////        else{
////            // Internet is not connected
////            UIAlertController.showAlertWithOkButton(controller, aStrMessage: "Internet is not available", completion: nil)
////            let aErrorConnection = NSError(domain: "InternetNotAvailable", code: 0456, userInfo: nil)
////            failureBlock(aErrorConnection as Error , false)
////        }
////    }
////
////    class func PUTWithOriginalResponse(_ url: String,
////                                       param: [String: Any]?,
////                                       controller: UIViewController,
////                                       header : [String: String]?,
////                                       callSilently : Bool = false,
////                                       successBlock: @escaping (_ response: NSDictionary) -> Void,
////                                       failureBlock: @escaping (_ error: Error? , _ isTimeOut: Bool) -> Void) {
////
////        let urlWithUTF8 =  url.addingPercentEncoding(withAllowedCharacters:NSCharacterSet.urlQueryAllowed)
////        if ISDebug {   print("URL : \(urlWithUTF8!)");   }
////
////
////        // Internet is connected
////        if isNetworkAvailable() {
////
////            if !callSilently {
////               SVProgressHUD.show()
////            }
////
////            Alamofire.request(urlWithUTF8!, method: .put, parameters: param, encoding: JSONEncoding(options: []), headers: header).responseJSON(completionHandler: { (response) in
////
////
////                if !callSilently{
////                    DispatchQueue.main.async {
////                        SVProgressHUD.dismiss()
////                    }
////                }
////
////                print("---- GET REQUEST URL RESPONSE : \(urlWithUTF8!)\n\(response.result)")
////                print(response.timeline)
////
////                switch response.result {
////                case .success:
////
////                    if !callSilently{
////                        DispatchQueue.main.async {
////                            SVProgressHUD.dismiss()
////                        }
////                    }
////
////                    if let result = response.result.value as? NSDictionary {
////                        successBlock(result)
////                    }
////
////                case .failure(let error):
////                    print(error)
////
////                    if !callSilently {
////                        DispatchQueue.main.async {
////                            SVProgressHUD.dismiss()
////                        }
////                    }
////
////                    if (error as NSError).code == -1001 {
////                        // The request timed out error occured. // Code=-1001 "The request timed out."
////                        UIAlertController.showAlertWithOkButton(controller, aStrMessage: "The request timed out. Pelase try after again.", completion: nil)
////                        failureBlock(error, true)
////                    } else {
////                        failureBlock(error, false)
////                    }
////                    break
////                }
////
////            })
////
////        }
////        else{
////            // Internet is not connected
////            UIAlertController.showAlertWithOkButton(controller, aStrMessage: "Internet is not available", completion: nil)
////            let aErrorConnection = NSError(domain: "InternetNotAvailable", code: 0456, userInfo: nil)
////            failureBlock(aErrorConnection as Error , false)
////        }
////    }
////
////}
