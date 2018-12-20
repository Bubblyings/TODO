//
//  ViewController.swift
//  TODO
//
//  Created by Bubblyings on 2018/12/20.
//  Copyright © 2018 Bubblyings. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    let defaults = UserDefaults.standard;
    
    var itemArray = ["Buy water cups", "Take some medicine", "Change password"];
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if let items = defaults.array(forKey: "ToDoListArray") as? [String] {
            
            itemArray = items;
            
        }
        
    }
    
    //MARK: - Table View DataSource methods
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath);
        
        cell.textLabel?.text = itemArray[indexPath.row];
        
        return cell;
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return itemArray.count;
        
    }
    
    //MARK: - Table View Delegate methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if tableView.cellForRow(at: indexPath)?.accessoryType != .checkmark {
            
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark;
            
        }else {
            
            tableView.cellForRow(at: indexPath)?.accessoryType = .none;
            
        }
        
        tableView.deselectRow(at: indexPath, animated: true);
        
    }

    //MARK: - Add New Items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField();
        
        let alert = UIAlertController(title: "Add a new  ToDo item", message: "", preferredStyle: .alert);
        
        let action = UIAlertAction(title: "Add item", style: .default) { (action) in
            
            self.itemArray.append(textField.text!);
            
            self.defaults.set(self.itemArray, forKey: "ToDoListArray");
            
            self.tableView.reloadData();
            
        }
        
        alert.addTextField { (alertTextField) in
            
            alertTextField.placeholder = "Create a new item ... ";
            
            textField = alertTextField;
            
        }
        
        alert.addAction(action);
        
        present(alert, animated: true, completion: nil);
        
    }
    
}

