//
//  TodoTableVC.swift
//  ToDo_list
//
//  Created by Quang Nguyen on 9/8/18.
//  Copyright © 2018 Quang Nguyen. All rights reserved.
//

import UIKit

class TodoTableVC: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 150
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> TodoCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "TodoCell", for: indexPath) as! TodoCell
        return cell
    }
    
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        print(tableView.cellForRow(at: indexPath))
//        if let cell = tableView.cellForRow(at: indexPath) as? TodoCell {
//            print(cell)
//            return cell.heightNeeded()
//        }
//        return 50.0
//    }

}
