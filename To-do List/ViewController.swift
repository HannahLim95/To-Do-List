//
//  ViewController.swift
//  To-do List
//
//  Created by Hannah Lim on 24-09-15.
//  Copyright (c) 2015 Hannah Lim. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var textNewTodo: UITextField!
    @IBOutlet weak var labelNewTodo: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    let defaults = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonAddTodo(sender: AnyObject) {
        if(textNewTodo.text != ""){
            var newToDo = textNewTodo.text
            if (defaults.arrayForKey("todolist") == nil) {
                var listArray = [newToDo]
                defaults.setObject(listArray, forKey: "todolist")
            } else {
                var listToDo = defaults.arrayForKey("todolist")
                listToDo!.append(newToDo)
                defaults.setObject(listToDo!, forKey: "todolist")
            }
            print(defaults.arrayForKey("todolist")!)
            tableView.reloadData()
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return defaults.arrayForKey("todolist")!.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell
        cell = self.tableView.dequeueReusableCellWithIdentifier("cell") as! UITableViewCell
        var listToDo = defaults.arrayForKey("todolist")!
        cell.textLabel?.text = listToDo[indexPath.row] as? String
        return cell
    }
    
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    //Alleen maar gelukt om een korte click te doen, maar hij doet het eindelijk wel!
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!){
        var listToDo = defaults.arrayForKey("todolist")!
        listToDo.removeAtIndex(indexPath.row)
        defaults.setObject(listToDo, forKey: "todolist")
        tableView.reloadData()
    }
    
    



}






