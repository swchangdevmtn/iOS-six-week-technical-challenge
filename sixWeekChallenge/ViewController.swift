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
    
    @IBAction func pairButtonTapped(sender: AnyObject) {
        
        //pair all in entitiesA
        let count = EntityController.sharedController.entitiesA.count
        var shuffledArray = EntityController.sharedController.entitiesA
        shuffledArray.shuffleInPlace()
        
        for var i = 0; i < count; i += 2 {
            if i+1 >= count {
                shuffledArray[i].pair = "Alone"
            } else {
                shuffledArray[i].pair = shuffledArray[i+1].name
                shuffledArray[i+1].pair = shuffledArray[i].name
            }
        }
        EntityController.sharedController.entitiesA = shuffledArray
        tableViewA.reloadData()
    }
    
    @IBAction func randomButtonTapped(sender: AnyObject) {
        EntityController.sharedController.entitiesA.shuffleInPlace()
        tableViewA.reloadData()
        
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
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            
            let entityA = EntityController.sharedController.entitiesA[indexPath.row]
            
            EntityController.sharedController.removeEntityA(entityA)
            
            // Delete the row from the table view
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            
        }
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

// I take no credit for this
extension MutableCollectionType where Index == Int {
    /// Shuffle the elements of `self` in-place.
    mutating func shuffleInPlace() {
        // empty and single-element collections don't shuffle
        if count < 2 { return }
        
        for i in 0..<count - 1 {
            let j = Int(arc4random_uniform(UInt32(count - i))) + i
            guard i != j else { continue }
            swap(&self[i], &self[j])
        }
    }
}

