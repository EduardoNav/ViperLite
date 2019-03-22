//
//  Router.swift
//  ViperLite
//
//  Created by Luis Eduardo Moreno Nava on 04/03/19.
//  Copyright © 2019 blc. All rights reserved.
//

import UIKit

protocol routerToPresenterDelegate {
    func returnSegue(ssegue: String)
}

class Router: NSObject {
    
    var presenterDelegate: routerToPresenterDelegate?
    
    func retriveSegue(){
        presenterDelegate?.returnSegue(ssegue: "SG")
    }
    
}
