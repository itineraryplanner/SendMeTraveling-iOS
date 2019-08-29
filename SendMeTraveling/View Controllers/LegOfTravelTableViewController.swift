//
//  LegOfTravelTableViewController.swift
//  SendMeTraveling
//
//  Created by Samantha Gatt on 8/28/19.
//  Copyright © 2019 Samantha Gatt. All rights reserved.
//

import UIKit

class LegOfTravelTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var legOfTravelTableView: UITableView!
}

// MARK: - Table View Data Source
extension LegOfTravelTableViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = legOfTravelTableView.dequeueReusableCell(withIdentifier: "LegOfTravelCell", for: indexPath)
        return cell
    }
}
