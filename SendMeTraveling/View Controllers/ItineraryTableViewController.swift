//
//  ItineraryTableViewController.swift
//  SendMeTraveling
//
//  Created by Samantha Gatt on 8/28/19.
//  Copyright © 2019 Samantha Gatt. All rights reserved.
//

import UIKit

class ItineraryTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var itineraryTableView: UITableView!
    
    @IBAction func showAddItineraryAlert(_ sender: Any) {
    }
}

// MARK: - Table View Data Source
extension ItineraryTableViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = itineraryTableView.dequeueReusableCell(withIdentifier: "ItineraryCell", for: indexPath)
        return cell
    }
}
