//
//  HeaderViewSection.swift
//  UITableView_EventsManager_NTA
//
//  Created by THANH on 4/29/17.
//  Copyright © 2017 THANH. All rights reserved.
//

import UIKit

class HeaderViewSection: UIView//UITableViewCell 
{

    @IBOutlet weak var headerSectionImage: UIImageView!
    @IBOutlet weak var headerSectionLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

//    override func setSelected(_ selected: Bool, animated: Bool) {
  //      super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
   // }

    //Lỗi
    //Xoá file(Move to Trash) nhưng không xoá tham chiếu(Reference), chương trình vẫn chạy nhưng hiện warning, Em chưa khắc phục được
}
