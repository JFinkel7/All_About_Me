//
//  FavoritesViewController.swift
//  All About Me
//
//  Created by Student on 6/11/19.
//  Copyright © 2019 Student. All rights reserved.
// Software Developer: Denis J Finkel

import UIKit

class FavoritesViewController: UITableViewController {
    //
    var favoritesList = ["Shreveport","Russia"]
    //
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return (1)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return (favoritesList.count)
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "viewFavorites", for: indexPath)

        // Configure the cell...
        let selectedFavorites = favoritesList[indexPath.row]
        cell.textLabel?.text = selectedFavorites
        return cell
    }
 

}
