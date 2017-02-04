//
//  familia.swift
//  MyXVApp
//
//  Created by Oscar Alejandro Sanabria on 03/12/16.
//  Copyright © 2016 Hello Word Technologies. All rights reserved.
//

import Foundation


class  Familia: NSObject {
    
    var name : String!
    var numberGuests : Int!
    var guests : [String]!
    
    init(name : String, numberGuests : Int) {
        self.name = name
        self.numberGuests = numberGuests
    }
    
}
