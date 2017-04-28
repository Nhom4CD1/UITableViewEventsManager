//
//  ManagerEventController.swift
//  UITableView_EventsManager_NTA
//
//  Created by THANH on 4/27/17.
//  Copyright © 2017 THANH. All rights reserved.
//

import UIKit

var heightofHeader : CGFloat = 44

class ManagerEventController: UITableViewController {
    
    lazy var eventLines: [EventLines] = {
        return EventLines.eventLines()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        //Show Edit Button
        self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
        animateTable()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        /*return dateSections.count*/
        return eventLines.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let eventLine = eventLines[section]
        return eventLine.events.count // the number of event in the section
    }
    
    //Mark Default Header Section
    /*override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
     let eventLine = eventLines[section]
     return eventLine.dates // the number of each day
     }*/
    
    //Mark Edit Header Section
    // User must set height to show the section
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return heightofHeader
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerViewSection = Bundle.main.loadNibNamed("HeaderViewSection", owner: self, options: nil)?.first as! HeaderViewSection
        
        headerViewSection.headerSectionImage.image = eventLines[section].dateImages
        headerViewSection.headerSectionLabel.text = eventLines[section].dates
        
        return headerViewSection
    }
    
    // Set data for tableView
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Event_Cell", for: indexPath)
        
        let eventLine = eventLines[indexPath.section]
        let event = eventLine.events[indexPath.row]
        cell.textLabel?.text = event.tenViec
        //Title detail
        // Configure the cell...
        return cell
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            let eventLine = eventLines[indexPath.section]
            eventLine.events.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic
            )
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    //Sort And Move Data From Section to Section
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        //get data in sourceIndexPath
        let evenLine = eventLines[sourceIndexPath.section];
        let event = evenLine.events[sourceIndexPath.row];
        
        evenLine.events.remove(at: sourceIndexPath.row)
        
        let evenLineDes = eventLines[destinationIndexPath.section];
        evenLineDes.events.insert(event, at: destinationIndexPath.row);
        
    }
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if (segue.identifier == "Event_Detail") {
            // initialize new view controller and cast it as your view controller
            let eventDetailVC = segue.destination as! EventDetailController
            if let indexPath = self.tableView.indexPathForSelectedRow{
                eventDetailVC.event = eventAtIndexPath(indexPath: indexPath as NSIndexPath)
                eventDetailVC.dateEvent = dateAtIndexPath(indexPath: indexPath as NSIndexPath)
                eventDetailVC.dateImages = imageAtIndexPath(indexPath: indexPath as NSIndexPath)
            }
            
        }
        
        
    }
    
    //Get event by indexPath
    func eventAtIndexPath(indexPath: NSIndexPath) -> Event{
        let eventLine = eventLines[indexPath.section]
        return eventLine.events[indexPath.row]
    }
    
    //Get date by indexPath
    func dateAtIndexPath(indexPath: NSIndexPath) -> String{
        let eventLine = eventLines[indexPath.section]
        return eventLine.dates
    }
    
    //Get image by indexPath
    func imageAtIndexPath(indexPath: NSIndexPath) -> UIImage{
        let eventLine = eventLines[indexPath.section]
        return eventLine.dateImages
    }
    
    //Animation for TableView
    func animateTable() {
        
        let cells = tableView.visibleCells
        
        let tableViewHeight = tableView.bounds.size.height
        
        for cell in cells {
            cell.transform = CGAffineTransform(translationX: 0, y: tableViewHeight)
        }
        
        var delayCounter = 0
        for cell in cells {
            UIView.animate(withDuration: 0.85, delay: Double(delayCounter) * 0.05, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                cell.transform = CGAffineTransform.identity
            }, completion: nil)
            delayCounter += 1
        }
    }
}
