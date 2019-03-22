//
//  ViewController.swift
//  ViperLite
//
//  Created by Luis Eduardo Moreno Nava on 04/03/19.
//  Copyright © 2019 blc. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, presenterToViewDelegate{
    
    @IBOutlet weak var lblName: UILabel!
    
    var presenter: Presenter = Presenter()

    override func viewDidLoad() {
        super.viewDidLoad()
        //self.createUser()
        presenter.viewDelegate = self
        presenter.retrieveUser()
    }
    
    @IBAction func boton(_ sender: Any) {
        presenter.retrieveSegue()
    }
    
    //ProtocolMethods

    func obtainUser(user: UserEnt) {
        lblName.text = user.name ?? ""
    }
    
    func getSegue(segue: String) {
        self.performSegue(withIdentifier: "SG", sender: self)
    }
    
    ///////// COREDATA TEST //////////////
    
    func createUser(){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let moc = appDelegate.persistentContainer.viewContext
        let userEntity = NSEntityDescription.entity(forEntityName: "User", in: moc)
        let userStored = NSManagedObject.init(entity: userEntity!, insertInto: moc)
        userStored.setValue("Lalo", forKey: "name")
        do {
            try moc.save()
        } catch let error as NSError {
           print("\(error.userInfo)")
        }
    }
    
}

