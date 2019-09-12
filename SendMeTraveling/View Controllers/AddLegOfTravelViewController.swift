//
//  AddLegOfTravelViewController.swift
//  SendMeTraveling
//
//  Created by Samantha Gatt on 8/28/19.
//  Copyright © 2019 Samantha Gatt. All rights reserved.
//

import UIKit

class AddLegOfTravelViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // MARK: Properties
    
    var datePickerIndex: IndexPath? {
        didSet {
            addLegOfTravelTableView.beginUpdates()
            if let oldIndex = oldValue {
                cellIds[oldIndex.section].remove(at: oldIndex.row)
                addLegOfTravelTableView.deleteRows(at: [oldIndex], with: .middle)
                addLegOfTravelTableView.deselectRow(at: IndexPath(row: oldIndex.row - 1, section: oldIndex.section), animated: true)
            }
            if let index = datePickerIndex {
                cellIds[index.section].insert("DatePickerCell", at: index.row)
                addLegOfTravelTableView.insertRows(at: [index], with: .middle)
            }
            addLegOfTravelTableView.endUpdates()
        }
    }
    var cellIds: [[String]] = [
        ["StartLocationCell", "EndLocationCell"],
        ["ListSelectionCell", "RightInputCell", "StartDateCell", "EndDateCell"],
        ["StartDateCell", "EndDateCell"]
    ]
    
    // MARK: Outlets
    
    @IBOutlet weak var addLegOfTravelTableView: UITableView!
    
    // MARK: Methods
    
    func setupView() {
        // Stops tableView from autoscrolling and messing up the navigation bar
        addLegOfTravelTableView.contentInsetAdjustmentBehavior = .never
    }
}

// MARK: - Life Cycle Methods
extension AddLegOfTravelViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let indexPath = addLegOfTravelTableView.indexPathForSelectedRow {
            addLegOfTravelTableView.deselectRow(at: indexPath, animated: false)
        }
    }
}

// MARK: - Table View Data Source
extension AddLegOfTravelViewController {
    func numberOfSections(in tableView: UITableView) -> Int {
        return cellIds.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellIds[section].count
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

// MARK: - Table View Delegate
extension AddLegOfTravelViewController {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if tableView.cellForRow(at: indexPath) is DateTableViewCell, datePickerIndex != IndexPath(row: indexPath.row + 1, section: indexPath.section) {
            
            // if the datePicker is already above the selected cell
            if let datePickerIndexPath = datePickerIndex,
                datePickerIndexPath.section == indexPath.section,
                datePickerIndexPath.row < indexPath.row {
                
                datePickerIndex = indexPath
                
            } else {
                datePickerIndex = IndexPath(row: indexPath.row + 1, section: indexPath.section)
            }
        } else {
            datePickerIndex = nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return datePickerIndex == indexPath ? 216 : 44
    }
}
