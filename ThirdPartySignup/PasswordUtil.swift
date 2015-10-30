//
//  PasswordUtil.swift
//
//  Created by Xinxing Jiang on 10/1/15.
//  Copyright © 2015 xjiang. All rights reserved.
//

import Foundation

class PasswordUtil {
    
    // MARK: - Is password valid
    
    class func isPasswordValid(password password: String) -> Bool {
        return password.characters.count >= Constants.MinLength && password.characters.count <= Constants.MaxLength
    }
    
    // MARK: - Constants
    
    struct Constants {
        static let MinLength = 6 // minimal length of password
        static let MaxLength = 30 // maximal length of password
        static let InvalidMessage = "密码长度应该为\(Constants.MinLength)到\(Constants.MaxLength)个字符，无效"
    }
}