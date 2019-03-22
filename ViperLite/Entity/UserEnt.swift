//
//  UserEnt.swift
//  ViperLite
//
//  Created by Luis Eduardo Moreno Nava on 04/03/19.
//  Copyright © 2019 blc. All rights reserved.
//

import UIKit

class UserEnt: NSObject {
    
    var name: String?
    
    override init() {
        super.init()
        self.name = ""
    }
    
    init(Name: String){
        self.name = Name
    }
    
}
