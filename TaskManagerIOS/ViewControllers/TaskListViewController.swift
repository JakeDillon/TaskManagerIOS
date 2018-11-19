//
//  ViewController.swift
//  TaskManagerIOS
//
//  Created by Jake Dillon on 10/30/18.
//  Copyright © 2018 Jake Dillon. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
   
    
    
    
    
    
    

    @IBOutlet weak var taskListViewTable: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        taskListViewTable.reloadData()
    }
    func tableViewTable(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TaskManager.sharedInstance.getTaskCount()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell") as! TaskTableViewCell
        
        let currentTask = TaskManager.sharedInstance.getTask(at: indexPath.row)
        
        cell.taskNameLabel.text = currentTask.title
        cell.importanceLabel.text = currentTask.importance
    
    if currentTask.checkedIn {
    cell.taskNameLabel.backgroundColor = UIColor.green
    } else {
    cell.taskNameLabel.backgroundColor = UIColor.red
    }
    
    return cell
    
}
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Delete") { _, _ in
            // Remove the task at the current index from our game array
            TaskManager.sharedInstance.removeGame(at: indexPath.row)
            // Delete the row from the table view at the current index path
            tableView.deleteRows(at: [indexPath], with: .bottom)
        }
        let taskForIndex = TaskManager.sharedInstance.getTask(at: indexPath.row)
        let title = taskForIndex.checkedIn ? "Checked Out" : "Checked In"
        let checkOutOrINAction = UITableViewRowAction(style: .normal, title: title) {
            _, _ in
            TaskManager.sharedInstance.taskInOrOut(at: indexPath.row)
            tableView.reloadRows(at: [indexPath], with: .fade)
        }
        return [deleteAction, checkOutOrINAction]
    }
    
    @IBAction func unwindToGameList(segue: UIStoryboardSegue) { }
}

