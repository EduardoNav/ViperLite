//
//  Interactor.swift
//  ViperLite
//
//  Created by Luis Eduardo Moreno Nava on 04/03/19.
//  Copyright © 2019 blc. All rights reserved.
//

import UIKit
import CoreData

protocol interactorToPresenterDelegate {
    func obtainUser(user: UserEnt)
}

class Interactor: NSObject {
    
    var presentorDelegate: interactorToPresenterDelegate?
    
    func retrieveUser(){
        retriveData()
    }
    
    func retriveData(){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let moc = appDelegate.persistentContainer.viewContext
        let fecthedRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        do {
            let result = try moc.fetch(fecthedRequest)
            let usAr = result as! [NSManagedObject]
            let usr = usAr[0]
            let user: UserEnt = UserEnt()
            user.name = (usr.value(forKey: "name") as! String)
            presentorDelegate?.obtainUser(user: user)
        } catch{
            
        }
    }
    
}
