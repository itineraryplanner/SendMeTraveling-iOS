//
//  DatePickerTableViewCell.swift
//  SendMeTraveling
//
//  Created by Samantha Gatt on 9/3/19.
//  Copyright © 2019 Samantha Gatt. All rights reserved.
//

import UIKit

protocol DatePickerDelegate {
    func dateDidChange(newDate: Date)
}

class DatePickerTableViewCell: UITableViewCell {
    
    var datePickerDelegate: DatePickerDelegate?
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBAction func updateDate(_ sender: Any) {
        datePickerDelegate?.dateDidChange(newDate: datePicker.date)
    }
}
