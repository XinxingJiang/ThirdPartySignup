//
//  EmailUtil.swift
//
//  Created by Xinxing Jiang on 10/1/15.
//  Copyright © 2015 xjiang. All rights reserved.
//

import Foundation

class EmailUtil {
    
    // MARK: - Is email valid
    
    class func isEmailValid(email email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let isEmailValid = emailTest.evaluateWithObject(email)
        return email.characters.count >= Constants.MinLength && email.characters.count <= Constants.MaxLength && isEmailValid
    }
    
    // MARK: - Constants
    
    struct Constants {
        static let MinLength = 6 // minimal length of email
        static let MaxLength = 30 // maximal length of email
        static let InvalidMessage = "邮箱长度应该为\(Constants.MinLength)到\(Constants.MaxLength)个字符，并且格式合法"
    }
}