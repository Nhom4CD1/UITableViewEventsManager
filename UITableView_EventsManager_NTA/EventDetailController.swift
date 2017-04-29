//
//  EventDetailController.swift
//  UITableView_EventsManager_NTA
//
//  Created by THANH on 4/27/17.
//  Copyright © 2017 THANH. All rights reserved.
//
import UIKit
class EventDetailController: UITableViewController, UITextViewDelegate, UITextFieldDelegate{
    
    //Model
    var event: Event?
    var dateEvent: String?
    var dateImages: UIImage?
    
    @IBOutlet weak var dateImage: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var txtEventTitle: UITextField!
    @IBOutlet weak var eventDesciptionTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateImage.image = dateImages
        txtEventTitle.text = event?.tenViec
        eventDesciptionTextView.text = event?.noidungCV
        dateLabel.text = dateEvent
        
    }
    
    
    // Hàm được gọi khi người dùng quay lại màn hình trước đó ( this view will disappear )
    
    override func viewWillDisappear(_ animated: Bool) {

       event?.tenViec = txtEventTitle.text!
        event?.noidungCV = eventDesciptionTextView.text! //Lấy nội dung event bên modal gán cho TextView hiển thị
    }
    

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // UIScrollViewDelegate ( Disable Keyboard  khi cuôn (scroll) màn hình the UIView )
    override func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        eventDesciptionTextView.resignFirstResponder()
        txtEventTitle.resignFirstResponder()
    }
}
