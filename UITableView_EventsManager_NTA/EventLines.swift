//
//  EventLines.swift
//  UITableView_EventsManager_NTA
//
//  Created by THANH on 4/27/17.
//  Copyright © 2017 THANH. All rights reserved.
//

import Foundation
import UIKit
class EventLines
{
    // Khai báo biến
    var dates: String            // ngày của sự kiện(event) được chọn
    var events: [Event]     //  Tất cả event trong ngày được chọn
    var dateImages: UIImage
    
    init(dateOfWeek: String, includeEvents: [Event], dateImage: UIImage)
    {
        dates = dateOfWeek     //Gán ngày trog tuần
        events = includeEvents //Gán các sự kiện
        dateImages = dateImage //Gán ảnh với ngày tương ứng
    }
    
    //Hàm trả về List các sụ kiện
    class func eventLines() -> [EventLines]
    {
        return [self.ngayThuHai(), self.ngayThuBa(), self.ngayThuTu(), self.ngayThuNam(), self.ngayThuSau(), self.ngayThuBay(),self.ngayChuNhat()]
    }
    
    // Hàm xử lí thêm sự kiện trong ngày Thứ Hai
    private class func ngayThuHai() -> EventLines {
        var events = [Event]()
        
        events.append(Event(tenViec: "Rửa mặt", noidungCV: "Rửa mặt"))
        events.append(Event(tenViec: "Ăn Sáng", noidungCV: "Mua Hủ tiếu về ăn sáng ^^"))
        events.append(Event(tenViec: "Lên Trường", noidungCV: "Đi học buổi sáng"))
        events.append(Event(tenViec: "Học KTMT", noidungCV: "Học KTMT"))
        events.append(Event(tenViec: "Học CĐ2", noidungCV: "Học CHuyên Đề 2"))
        events.append(Event(tenViec: "Ăn Trưa", noidungCV: "Nghỉ ngơi ăn trưa"))
        events.append(Event(tenViec: "Ngủ Trưa", noidungCV: "Ngủ trưa"))
        events.append(Event(tenViec: "Học CĐ3", noidungCV: "Học Chuyên ĐỀ 3"))
        events.append(Event(tenViec: "Ăn Tối", noidungCV: "Nấu bữa tối"))
        events.append(Event(tenViec: "Học AV", noidungCV: "Học Anh Văn"))
        
        return EventLines(dateOfWeek: "Thứ 2 Khởi Động", includeEvents: events, dateImage: #imageLiteral(resourceName: "thuHai"))
    }
    
    // Hàm xử lí thêm sự kiện trong ngày Thứ Ba
    private class func ngayThuBa() -> EventLines {
        
        var events = [Event]()
        
        events.append(Event(tenViec: "Rửa mặt", noidungCV: "Rửa mặt"))
        events.append(Event(tenViec: "Ăn Sáng", noidungCV: "Mua Hủ tiếu về ăn sáng ^^"))
        events.append(Event(tenViec: "Lên Trường", noidungCV: "Đi học buổi sáng"))
        events.append(Event(tenViec: "Học KTMT", noidungCV: "Học KTMT"))
        events.append(Event(tenViec: "Học CĐ2", noidungCV: "Học CHuyên Đề 2"))
        events.append(Event(tenViec: "Ăn Trưa", noidungCV: "Nghỉ ngơi ăn trưa"))
        events.append(Event(tenViec: "Ngủ Trưa", noidungCV: "Ngủ trưa"))
        events.append(Event(tenViec: "Học CĐ3", noidungCV: "Học Chuyên ĐỀ 3"))
        events.append(Event(tenViec: "Ăn Tối", noidungCV: "Nấu bữa tối"))
        events.append(Event(tenViec: "Học AV", noidungCV: "Học Anh Văn"))
        
        return EventLines(dateOfWeek: "Thứ 3 Vượt chướng ngại vật", includeEvents: events, dateImage: #imageLiteral(resourceName: "thuBa"))
    }
    
    // Hàm xử lí thêm sự kiện trong ngày Thứ Tư
    private class func ngayThuTu() -> EventLines {
        
        var events = [Event]()
        
        events.append(Event(tenViec: "Rửa mặt", noidungCV: "Rửa mặt"))
        events.append(Event(tenViec: "Ăn Sáng", noidungCV: "Mua Hủ tiếu về ăn sáng ^^"))
        events.append(Event(tenViec: "Lên Trường", noidungCV: "Đi học buổi sáng"))
        events.append(Event(tenViec: "Học KTMT", noidungCV: "Học KTMT"))
        events.append(Event(tenViec: "Học CĐ2", noidungCV: "Học CHuyên Đề 2"))
        events.append(Event(tenViec: "Ăn Trưa", noidungCV: "Nghỉ ngơi ăn trưa"))
        events.append(Event(tenViec: "Ngủ Trưa", noidungCV: "Ngủ trưa"))
        events.append(Event(tenViec: "Học CĐ3", noidungCV: "Học Chuyên ĐỀ 3"))
        events.append(Event(tenViec: "Ăn Tối", noidungCV: "Nấu bữa tối"))
        events.append(Event(tenViec: "Học AV", noidungCV: "Học Anh Văn"))
        
        return EventLines(dateOfWeek: "Thứ 4 NOT YESTERDAY", includeEvents: events, dateImage: #imageLiteral(resourceName: "thuTu"))
    }
    
    // Hàm xử lí thêm sự kiện trong ngày Thu Năm
    private class func ngayThuNam() -> EventLines {
        
        var events = [Event]()
        
        events.append(Event(tenViec: "Rửa mặt", noidungCV: "Rửa mặt"))
        events.append(Event(tenViec: "Ăn Sáng", noidungCV: "Mua Hủ tiếu về ăn sáng ^^"))
        events.append(Event(tenViec: "Lên Trường", noidungCV: "Đi học buổi sáng"))
        events.append(Event(tenViec: "Học KTMT", noidungCV: "Học KTMT"))
        events.append(Event(tenViec: "Học CĐ2", noidungCV: "Học CHuyên Đề 2"))
        events.append(Event(tenViec: "Ăn Trưa", noidungCV: "Nghỉ ngơi ăn trưa"))
        events.append(Event(tenViec: "Ngủ Trưa", noidungCV: "Ngủ trưa"))
        events.append(Event(tenViec: "Học CĐ3", noidungCV: "Học Chuyên ĐỀ 3"))
        events.append(Event(tenViec: "Ăn Tối", noidungCV: "Nấu bữa tối"))
        events.append(Event(tenViec: "Học AV", noidungCV: "Học Anh Văn"))
        
        return EventLines(dateOfWeek: "Thứ 5 Tăng Tốc", includeEvents: events, dateImage: #imageLiteral(resourceName: "thuNam"))
    }
    
    // Hàm xử lí thêm sự kiện trong ngày Thứ Sáu
    private class func ngayThuSau() -> EventLines {
        
        var events = [Event]()
        
        events.append(Event(tenViec: "Rửa mặt", noidungCV: "Rửa mặt"))
        events.append(Event(tenViec: "Ăn Sáng", noidungCV: "Mua Hủ tiếu về ăn sáng ^^"))
        events.append(Event(tenViec: "Lên Trường", noidungCV: "Đi học buổi sáng"))
        events.append(Event(tenViec: "Học KTMT", noidungCV: "Học KTMT"))
        events.append(Event(tenViec: "Học CĐ2", noidungCV: "Học CHuyên Đề 2"))
        events.append(Event(tenViec: "Ăn Trưa", noidungCV: "Nghỉ ngơi ăn trưa"))
        events.append(Event(tenViec: "Ngủ Trưa", noidungCV: "Ngủ trưa"))
        events.append(Event(tenViec: "Học CĐ3", noidungCV: "Học Chuyên ĐỀ 3"))
        events.append(Event(tenViec: "Ăn Tối", noidungCV: "Nấu bữa tối"))
        events.append(Event(tenViec: "Học AV", noidungCV: "Học Anh Văn"))
        
        return EventLines(dateOfWeek: "Thứ 6 KEEP CALM", includeEvents: events, dateImage: #imageLiteral(resourceName: "thuSau"))
    }
    
    // Hàm xử lí thêm sự kiện trong ngày Thứ Bảy
    private class func ngayThuBay() -> EventLines {
        
        var events = [Event]()
        
        events.append(Event(tenViec: "Rửa mặt", noidungCV: "Rửa mặt"))
        events.append(Event(tenViec: "Ăn Sáng", noidungCV: "Mua Hủ tiếu về ăn sáng ^^"))
        events.append(Event(tenViec: "Lên Trường", noidungCV: "Đi học buổi sáng"))
        events.append(Event(tenViec: "Học KTMT", noidungCV: "Học KTMT"))
        events.append(Event(tenViec: "Học CĐ2", noidungCV: "Học CHuyên Đề 2"))
        events.append(Event(tenViec: "Ăn Trưa", noidungCV: "Nghỉ ngơi ăn trưa"))
        events.append(Event(tenViec: "Ngủ Trưa", noidungCV: "Ngủ trưa"))
        events.append(Event(tenViec: "Học CĐ3", noidungCV: "Học Chuyên ĐỀ 3"))
        events.append(Event(tenViec: "Ăn Tối", noidungCV: "Nấu bữa tối"))
        events.append(Event(tenViec: "Học AV", noidungCV: "Học Anh Văn"))
        
        return EventLines(dateOfWeek: "Thứ 7 VỀ ĐÍCH", includeEvents: events, dateImage: #imageLiteral(resourceName: "thuBay"))
    }
    
    // Hàm xử lí thêm sự kiện trong ngày Chủ Nhật
    private class func ngayChuNhat() -> EventLines {
        //  Khai báo biến chứa các sự kiện
        var events = [Event]()
        //Thêm nội dung vào List sự kiện
        events.append(Event(tenViec: "Rửa mặt", noidungCV: "Đánh răng, rửa mặt"))
        events.append(Event(tenViec: "Ăn điểm tâm sáng", noidungCV: "Mua bánh mì ăn sáng @@"))
        events.append(Event(tenViec: "Đọc tin tức", noidungCV: "Đọc tin tức trên mạng"))
        events.append(Event(tenViec: "Học CĐ1", noidungCV: "Thực Hành iOS"))
        events.append(Event(tenViec: "Học KTMT", noidungCV: "Học Kiến Trúc Máy Tính"))
        events.append(Event(tenViec: "Ăn Trưa", noidungCV: "Nấu ăn buổi trưa"))
        events.append(Event(tenViec: "Ngủ Trưa", noidungCV: "Ngủ Trưa 1h-5h PM ^^"))
        events.append(Event(tenViec: "Nấu bữa tối", noidungCV: "Nấu ăn buổi tối"))
        events.append(Event(tenViec: "Đi xem phim", noidungCV: "Đi xem phim với Gấu"))
        events.append(Event(tenViec: "Ngủ", noidungCV: "Đi ngủ sớm"))
        
        return EventLines(dateOfWeek: "Ngày Chủ Nhật CHUẨN BỊ", includeEvents: events, dateImage: #imageLiteral(resourceName: "ngayCN"))
    }
    
}
