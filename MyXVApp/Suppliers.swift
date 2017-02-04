//
//  Suppliers.swift
//  MyXVApp
//
//  Created by Oscar Alejandro Sanabria on 04/12/16.
//  Copyright © 2016 Hello Word Technologies. All rights reserved.
//

import UIKit

class Suppliers: NSObject {
    var name : String!
    var image : UIImage!
    var descriptionS: String!
    
    init(name: String, image: UIImage, descriptionS: String) {
        self.name = name
        self.image = image
        self.descriptionS = descriptionS
    }
}
