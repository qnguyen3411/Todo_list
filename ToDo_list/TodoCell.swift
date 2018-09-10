//
//  TodoCell.swift
//  ToDo_list
//
//  Created by Quang Nguyen on 9/8/18.
//  Copyright © 2018 Quang Nguyen. All rights reserved.
//

import UIKit

class TodoCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var descLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func heightNeeded() -> CGFloat {
        return 150.0
    }
    
    func drawCheckmark(if todoIsDone: Bool) {
        if todoIsDone {
            self.accessoryType = .checkmark
        } else {
            self.accessoryType = .none
        }
    }
}
