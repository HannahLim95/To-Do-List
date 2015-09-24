//
//  ViewController.swift
//  To-do List
//
//  Created by Hannah Lim on 24-09-15.
//  Copyright (c) 2015 Hannah Lim. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textNewTodo: UITextField!
    @IBOutlet weak var labelNewTodo: UILabel!
    
    let toDoList = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonAddTodo(sender: AnyObject) {
        labelNewTodo.text = textNewTodo.text
        if(textNewTodo.text != ""){
            var listToDo = toDoList.arrayForKey("todolist")
            var newToDo = textNewTodo.text
            listToDo!.append(newToDo)
            toDoList.setObject(listToDo!, forKey: "todolist")
            print(toDoList.arrayForKey("todolist")!)
        }
    }

}

 