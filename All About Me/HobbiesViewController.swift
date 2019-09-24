//
//  HobbiesViewController.swift
//  All About Me
//
//  Created by Student on 6/11/19.
//  Copyright © 2019 Student. All rights reserved.
// Software Developer: Denis J Finkel

import UIKit
// Private
var hobbyList:[Hobby]=[]
//
class HobbiesViewController: UITableViewController {
    // Public
    let hobbyAlert = UIAlertController(title: "Add New Hobby",message: "Enter Information About Your New Hobby.",preferredStyle: UIAlertController.Style.alert)
    //*
    override func viewDidLoad() {
        super.viewDidLoad()
        var hiking = Hobby()
        hiking.title = "Hiking"
        hiking.description = "Hiking in the mountains of the Arkansas is fun."
        hiking.imageName = UIImage(named:"hiking")
        //
        var chrochet = Hobby()
        chrochet.title = "Crochet"
        chrochet.description = "Crochet Is A Textile art that uses yarn to create fabric."
        chrochet.imageName = UIImage(named:"chrochet")
        hobbyList += [hiking,chrochet]
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    // MARK: - Table view data source
    
    // TABLE VIEW
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return (1)
    }
    // TABLE VIEW
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #Warning Incomplete implementation, Return The Number Of Rows
        return (hobbyList.count)
    }
    // TABLE VIEW
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "viewHobbies", for: indexPath)

        // Configure the cell...
        let selectedHobby = hobbyList[indexPath.row]
        cell.textLabel?.text = selectedHobby.title
        return (cell)
    }
    
  // ADD UI Bar Button
    @IBAction func add_UIBarButton(_ sender: UIBarButtonItem) {
        hobbyAlert.addTextField(configurationHandler:{(txtNewHobby:UITextField!) in   txtNewHobby.placeholder = "Enter The Name Of Hobby Here"
        })
        hobbyAlert.addTextField(configurationHandler:{(txtNewDesc:UITextField) in
            txtNewDesc.placeholder = "Enter Description Of Hobby Here"
        })
        let addHobby = UIAlertAction(title: "Add Hobby",style: UIAlertAction.Style.destructive){
            (UIAlertAction) -> Void in
            let txtNewHobby = self.hobbyAlert.textFields![0] as UITextField
            let txtNewDesc = self.hobbyAlert.textFields![1] as UITextField
            var newHobby = Hobby()
            newHobby.title = txtNewHobby.text!
            newHobby.description = txtNewDesc.text!
            newHobby.imageName = UIImage(named:"noImage")
            if(newHobby.title != "" && newHobby.description != ""){
                hobbyList += [newHobby]
                self.tableView.beginUpdates()
                self.tableView.insertRows(at: [IndexPath.init(row:hobbyList.count - 1,section: 0 )], with: .automatic)
                self.tableView.endUpdates()
            }
        }
        hobbyAlert.addAction(addHobby)
        self.present(hobbyAlert,animated:true,completion:nil)
        self.tableView.reloadData()
        self.tableView.setNeedsDisplay()
    }
    

}
