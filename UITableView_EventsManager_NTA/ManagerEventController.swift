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
        return eventLines.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let eventLine = eventLines[section]
        return eventLine.events.count // trả về số event trong section
    }
    
    //Mark  Header Section Mặc định
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
     let eventLine = eventLines[section]
     return eventLine.dates // số dòng sự kiện mỗi ngày
    }
    
    //Mark   Chỉnh sửa Header Section
    // Người dùng phải set height để show  section
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return heightofHeader
    }
    
  //  override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    //    let headerViewSection = Bundle.main.loadNibNamed("HeaderViewSection", owner: self, options: nil)?.first as! HeaderViewSection
        
      //  headerViewSection.headerSectionImage.image = eventLines[section].dateImages
        //headerViewSection.headerSectionLabel.text = eventLines[section].dates
        
        //return headerViewSection
    //}
    // Set data cho tableView
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CongViec_Cell", for: indexPath)
        
        let eventLine = eventLines[indexPath.section]
        let event = eventLine.events[indexPath.row]
        cell.textLabel?.text = event.tenViec
        //tenCV detail
        // Cấu hình, tuỳ chỉnh lại cell
        return cell
    }
    
    // Override lại hàm tableView cho việc chỉnh sửa trên table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Xoá một hàng từ data source
            let eventLine = eventLines[indexPath.section]
            eventLine.events.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic
            )
            
        } else if editingStyle == .insert {
        // Tạo mới một instance thuộc  appropriate class, chèn nó vào mảng (array), và thêm (add) 1hàng mới (row) vào table view
        }
    }
    
    //Sắp xếp và Chuyển Data từ Section đến Section
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
        // Lấy về new view controller sử dụng segue.destinationViewController.
        // Pass đối tượng đã chọn (the selected object) đến view controller mới.
        
        if (segue.identifier == "ChiTiet_CongViec") {
            // Khởi tạo một view controller và cast nó vào view controller
            let eventDetailVC = segue.destination as! EventDetailController
            if let indexPath = self.tableView.indexPathForSelectedRow{
                eventDetailVC.event = eventAtIndexPath(indexPath: indexPath as NSIndexPath)
                eventDetailVC.dateEvent = dateAtIndexPath(indexPath: indexPath as NSIndexPath)
                eventDetailVC.dateImages = imageAtIndexPath(indexPath: indexPath as NSIndexPath)
            }
        }
    }
    
    //Lấy Công việc, sự kiện (event) dựa trên indexPath
    func eventAtIndexPath(indexPath: NSIndexPath) -> Event{
        let eventLine = eventLines[indexPath.section]
        return eventLine.events[indexPath.row]
    }
    
    //Lấy Thứ(date) dựa trên indexPath
    func dateAtIndexPath(indexPath: NSIndexPath) -> String{
        let eventLine = eventLines[indexPath.section]
        return eventLine.dates
    }
    
    //Lấy image nhờ indexPath
    func imageAtIndexPath(indexPath: NSIndexPath) -> UIImage{
        let eventLine = eventLines[indexPath.section]
        return eventLine.dateImages
    }
    
    //Animation cho TableView
    func animateTable() {
        
        let cells = tableView.visibleCells
        let tableViewHeight = tableView.bounds.size.height
    
        for cell in cells {
            cell.transform = CGAffineTransform(translationX: 0, y: tableViewHeight)
        }
        
        var delayCounter = 0
        for cell in cells {
            UIView.animate(withDuration: 0.5, delay: Double(delayCounter) * 0.05, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                cell.transform = CGAffineTransform.identity
            }, completion: nil)
            delayCounter += 1
        }
    }
}
