//
//  ViewController.swift
//  sixWeekChallenge
//
//  Created by Sean Chang on 11/18/15.
//  Copyright © 2015 Sean Chang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableViewA: UITableView!
    
    
    @IBAction func randomButtonTapped(sender: AnyObject) {
        
        //shuffle entitiesA
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tableViewA.reloadData()
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
            return EntityController.sharedController.entitiesA.count

    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
            let cellA = tableView.dequeueReusableCellWithIdentifier("listACell", forIndexPath: indexPath)
            let entityA = EntityController.sharedController.entitiesA[indexPath.row]
            cellA.textLabel?.text = "\(entityA.name) - \(entityA.pair)"
            return cellA
        
  
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "toEditFromListA" {
            
            if let addEditViewController = segue.destinationViewController as? AddEditViewController {
                
                // Following line forces the view from Storyboard to load UI elements to make available for testing
                _ = addEditViewController.view
                
                let indexPath = tableViewA.indexPathForSelectedRow
                
                if let selectedRow = indexPath?.row {
                    let entityA = EntityController.sharedController.entitiesA[selectedRow]
                    addEditViewController.updateWithEntry(entityA)
                }
            }
        }
    }
    
}

