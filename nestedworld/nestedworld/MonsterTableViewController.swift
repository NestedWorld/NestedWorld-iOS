//
//  MonsterTableViewController.swift
//  nestedworld
//
//  Created by Jean-Antoine Dupont on 25/02/2016.
//  Copyright © 2016 NestedWorld. All rights reserved.
//

import UIKit

class MonsterTableViewController: UITableViewController
{
    var monsters: [Monster?] = [Monster]()
    
    // MARK: Override functions
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return self.monsters.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("MonsterTableViewCell", forIndexPath: indexPath) as! MonsterTableViewCell
        let monster = self.monsters[indexPath.row]
        
        cell.nameLabel.text = monster?.name
        
        return cell
    }
    
    
    // MARK: Private functions
    
}
