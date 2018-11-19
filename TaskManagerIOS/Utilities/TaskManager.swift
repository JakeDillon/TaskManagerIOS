//
//  TaskManager.swift
//  TaskManagerIOS
//
//  Created by Jake Dillon on 11/5/18.
//  Copyright © 2018 Jake Dillon. All rights reserved.
//

import Foundation
import RealmSwift

class TaskManager {
    //Shared instance of the TaskManager class
    static let sharedInstance = TaskManager()
    
    //We are creating a private initializer so that no instances of this class can be made anywhere else
    private init() {
        taskArray = realm.objects(Task.self)
    }
    
    //The array of tasks that will be used throughout the application
    private var taskArray: Results<Task>!
    
    //referance to the local realm database
    let realm = try! Realm()
    
    //Function to get the number of task we have
    func getTaskCount() -> Int {
        return taskArray.count
    }
    
    //Function to return a task at a specific index
    func getTask(at index: Int) -> Task {
        return taskArray[index]
    }
    
    //Function to add a task to the game library
    func addTask(task: Task) {
        try! realm.write {
            realm.add(task)
        }
    }
    // Function to remove tasks from library
    func removeGame(at index: Int) {
        try! realm.write {
            realm.delete(getTask(at: index))
        }
    }
    
    //function to show if task is finshed or not
    func taskInOrOut(at index: Int) {
        let taskForIndex = taskArray[index]
        try! realm.write {
            taskForIndex.checkedIn = !taskForIndex.checkedIn
            
            if taskForIndex.checkedIn {
                taskForIndex.dueDate = nil
            } else {
                taskForIndex.dueDate = Calendar.current.date(byAdding: .day, value: 14, to: Date())
            }
        }
    }
}
