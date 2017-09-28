//
//  Message.swift
//  ParseChat
//
//  Created by Ali Mir on 9/27/17.
//  Copyright © 2017 com.AliMir. All rights reserved.
//

import Foundation
import Parse


class Message: PFObject, PFSubclassing {
    @NSManaged var text: String?
    
    class func parseClassName() -> String {
        return "Message"
    }
}
