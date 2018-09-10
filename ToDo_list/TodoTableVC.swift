//
//  TodoTableVC.swift
//  ToDo_list
//
//  Created by Quang Nguyen on 9/8/18.
//  Copyright © 2018 Quang Nguyen. All rights reserved.
//

import UIKit
import CoreData


class TodoTableVC: UITableViewController {

    
    let context = (UIApplication.shared.delegate as! AppDelegate)
        .persistentContainer.viewContext
    
    var items:[TodoItem] = []
    
    override func viewWillAppear(_ animated: Bool) {
        fetchAllItems()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 50
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> TodoCell {
        
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "TodoCell", for: indexPath) as! TodoCell
        
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        
        let item = items[indexPath.row]
        cell.titleLabel.text = item.title
        cell.descLabel.text = item.desc
        if let dueDate = item.dueDate {
            cell.dateLabel.text = formatter.string(from: dueDate)
        }
        cell.drawCheckmark(if: item.isDone)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        item.isDone = true
        do {
            try context.save()
        } catch {
            print("\(error)")
        }
        
        tableView.reloadData()
    }
    
    func fetchAllItems() {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "TodoItem")
        do {
            let results = try context.fetch(request)
            items = results as! [TodoItem]
        } catch {
            print("\(error)")
        }
        
    }
    
    
    

}
