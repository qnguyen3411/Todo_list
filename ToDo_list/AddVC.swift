//
//  AddVC.swift
//  ToDo_list
//
//  Created by Quang Nguyen on 9/8/18.
//  Copyright © 2018 Quang Nguyen. All rights reserved.
//

import UIKit
import CoreData

enum inputError: Error {
    case NoTitleError
    case NoDescError
    case NoDateError
    case DateInPastError
}

class AddVC: UIViewController {
    
    
    let context = (UIApplication.shared.delegate as! AppDelegate)
        .persistentContainer.viewContext
    
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var descTextView: UITextView!
    
    @IBOutlet weak var dateField: UIDatePicker!
    
    
    @IBAction func addButtonPressed(_ sender: UIButton) {
        do {
            try addTodoItem()
            print("WE DID IT BOYS")
        } catch {
            print("\(error)")
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addTodoItem() throws {
        guard let title = titleTextField.text else {
            throw inputError.NoTitleError
        }
        guard let desc = descTextView.text else {
            throw inputError.NoDescError
        }
        guard let dueDate = dateField?.date else {
            throw inputError.NoDateError
        }
        guard dueDate > Date() else {
            throw inputError.DateInPastError
        }
        
        let newTodoItem = TodoItem(context: context)
        newTodoItem.title = title
        newTodoItem.desc = desc
        newTodoItem.dueDate = dueDate
        newTodoItem.isDone = false
        
        try context.save()
        
        
    }


}
