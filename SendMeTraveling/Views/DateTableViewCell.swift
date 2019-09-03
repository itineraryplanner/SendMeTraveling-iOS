//
//  DateTableViewCell.swift
//  SendMeTraveling
//
//  Created by Samantha Gatt on 9/2/19.
//  Copyright © 2019 Samantha Gatt. All rights reserved.
//

import UIKit

class DateTableViewCell: UITableViewCell {
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        detailTextLabel?.textColor = selected ? .red : .darkGray
    }
}
