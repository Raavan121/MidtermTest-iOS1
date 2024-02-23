//
//  ViewController.swift
//  MidtermTest-iOS1
//
//  Created by Rania Arbash on 2023-02-23.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var todoText: UITextField!
    
    @IBOutlet weak var tableView: UITableView!
    
    var todos: [ToDo] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
    }
}

class ToDoTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
}

extension ViewController {
    @IBAction func saveNewToDo(_ sender: Any) {
        
        if let todo_text = todoText.text, !todo_text.isEmpty {
            if  (!todo_text.isEmpty && todo_text.count > 0) {
                let newToDo = ToDo(t: todo_text)
                let newIndexPath = IndexPath(row: allTodos.count, section: 0)
                
                
                allTodos.append(newToDo)
                newlyAddedIndexPaths.insert(newIndexPath)            todos.append(newToDo)
                todoText.text = ""
                tableView.reloadData()
            }
        }
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return todos.count
            
        }
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell", for: indexPath) as! ToDoTableViewCell
            let todo = todos[indexPath.row]
            cell.titleLabel.text = todo.title
            
            return cell
        }
    }
    
    
}
       

  



    
  
 
