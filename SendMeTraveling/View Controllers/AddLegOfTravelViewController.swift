//
//  AddLegOfTravelViewController.swift
//  SendMeTraveling
//
//  Created by Samantha Gatt on 8/28/19.
//  Copyright © 2019 Samantha Gatt. All rights reserved.
//

import UIKit

class AddLegOfTravelViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var datePickerIndex: IndexPath?
    var cellIds: [[String]] = [
        ["LocationCell", "LocationCell"],
        ["ListSelectionCell", "RightInputCell", "DateCell", "DateCell"],
        ["DateCell", "DateCell"]
    ]
    
    @IBOutlet weak var addLegOfTravelTableView: UITableView!
    
    func setupView() {
        
    }
}

// MARK: - Table View Data Source
extension AddLegOfTravelViewController {
    func numberOfSections(in tableView: UITableView) -> Int {
        return cellIds.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var rowCount = 0
        if let datePickerSection = datePickerIndex?.section,
            datePickerSection == section {
            rowCount = 1
        }
        
        return rowCount + cellIds[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = addLegOfTravelTableView.dequeueReusableCell(withIdentifier: cellIds[indexPath.section][indexPath.row], for: indexPath)
        return cell
    }
   
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Where?"
        case 1:
            return "How?"
        case 2:
            return "When?"
        default:
            return ""
        }
    }
}
