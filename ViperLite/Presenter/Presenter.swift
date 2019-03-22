//
//  Presenter.swift
//  ViperLite
//
//  Created by Luis Eduardo Moreno Nava on 04/03/19.
//  Copyright © 2019 blc. All rights reserved.
//

import UIKit

protocol presenterToViewDelegate {
    func obtainUser(user: UserEnt)
    func getSegue(segue: String)
}

class Presenter: NSObject, interactorToPresenterDelegate, routerToPresenterDelegate{
    
    var viewDelegate: presenterToViewDelegate?
    
    var interactor: Interactor = Interactor()
    var router: Router = Router()
    
    func retrieveUser(){
        interactor.presentorDelegate = self
        interactor.retrieveUser()
    }
    
    func retrieveSegue(){
        router.presenterDelegate = self
        router.retriveSegue()
    }
    
    func obtainUser(user: UserEnt) {
        viewDelegate?.obtainUser(user: user)
    }
    
    func returnSegue(ssegue: String) {
        viewDelegate?.getSegue(segue: ssegue)
    }
    
}
