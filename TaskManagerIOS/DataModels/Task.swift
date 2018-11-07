//
//  Task.swift
//  TaskManagerIOS
//
//  Created by Jake Dillon on 11/2/18.
//  Copyright © 2018 Jake Dillon. All rights reserved.
//

import Foundation
import RealmSwift


class Task: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var importance: String = ""
    @objc dynamic var dueDate: Date? = nil
    @objc dynamic var checkedIn: Bool = true
    
}
