//
//  Event.swift
//  UITableView_EventsManager_NTA
//
//  Created by THANH on 4/27/17.
//  Copyright © 2017 THANH. All rights reserved.
//
import Foundation
import UIKit

class Event{
    //Khai báo biến
    var tenViec: String
    var noidungCV: String
    
    //Hàm khởi tạo
    init(tenVieced: String, noidungCVed: String)
    {
        self.tenViec = tenVieced
        self.noidungCV = noidungCVed
    }
}
