//
//  ViewController.swift
//  TODO
//
//  Created by Bubblyings on 2018/12/20.
//  Copyright © 2018 Bubblyings. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    let itemArray = ["Buy water cups", "Take some medicine", "Change password"];
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
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


}

