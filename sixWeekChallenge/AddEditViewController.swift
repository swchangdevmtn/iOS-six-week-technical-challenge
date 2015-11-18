//
//  AddEditViewController.swift
//  sixWeekChallenge
//
//  Created by Sean Chang on 11/18/15.
//  Copyright © 2015 Sean Chang. All rights reserved.
//

import UIKit

class AddEditViewController: UIViewController {

    var entityA: EntityA?
    
    @IBOutlet weak var entityTextField: UITextField!
    
    @IBAction func saveButtonTapped(sender: AnyObject) {
        if let entityA = self.entityA{
            entityA.name = self.entityTextField.text!
        } else {
            let newEntityA = EntityA(name: self.entityTextField.text!, pair: "Alone")
            EntityController.sharedController.addEntityA(newEntityA)
            self.entityA = newEntityA
        }
        
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateWithEntry(entityA: EntityA) {
        self.entityA = entityA
        
        self.entityTextField.text = entityA.name
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
