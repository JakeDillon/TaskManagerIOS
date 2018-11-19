//
//  TaskViewTableCell.swift
//  TaskManagerIOS
//
//  Created by Jake Dillon on 10/30/18.
//  Copyright © 2018 Jake Dillon. All rights reserved.
//

import UIKit


class TaskTableViewCell: UITableViewCell {
    
    @IBOutlet weak var taskNameLabel: UILabel!
    
    @IBOutlet weak var importanceLabel: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
