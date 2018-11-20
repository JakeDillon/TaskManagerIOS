//
//  AddTasksViewController.swift
//  TaskManagerIOS
//
//  Created by Jake Dillon on 11/1/18.
//  Copyright © 2018 Jake Dillon. All rights reserved.
//

import UIKit

class AddTasksViewController: UIViewController {
    
    
    @IBOutlet weak var newTaskTextField: UITextField!
    
    @IBOutlet weak var importanceSegmentController: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    @IBAction func submitButtonTapped(_ sender: Any) {
        guard let title = newTaskTextField.text, title.trimmingCharacters(in: .whitespacesAndNewlines) != "" else {
            return
        }
        
        
        // importance
        var importance: String!
        switch importanceSegmentController.selectedSegmentIndex {
        case 0:
            importance = "not that important"
        case 1:
            importance = "Need to do soon"
        case 2:
            importance = "Urgeent, do ASAP"
        default:
            return
        }
        
        
        
        let newTask = Task()
        
        
        //setting the properties for the new task using dot notation
        newTask.title = title
        newTask.importance = importance
        
        
        TaskManager.sharedInstance.addTask(task: newTask)
        
        self.performSegue(withIdentifier: "unwindToTaskList", sender: self)
        
        
    }
    
    
    
    
    
    
}
