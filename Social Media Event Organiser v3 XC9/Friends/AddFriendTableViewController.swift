//
//  AddFriendTableViewController.swift
//  Social Media Event Organiser v3 XC9
//
//  Created by Seena Shafai on 24/04/2018.
//  Copyright © 2018 Seena Shafai. All rights reserved.
//

import UIKit
import Firebase

class AddFriendTableViewController: UITableViewController, UISearchResultsUpdating {
    
    var tag = ""
    var filteredUserNames: [String]?
    let searchController = UISearchController(searchResultsController: nil)
    
    var userIDArray = [String]()
    var userSelected: String = ""
    
    var ref: DatabaseReference?
    var refHandle: DatabaseHandle?
    
    
    override func viewDidLoad() {
        ref = Database.database().reference()
        
        let userIDListRef = ref?.child("UserList")
        refHandle = userIDListRef?.observe(.childAdded, with: {(snapshot) in
            
            
            if let item = snapshot.value as? String
            {
                print("item", item)
                self.userIDArray.append(item)
                self.tableView.reloadData()
                print("array", self.userIDArray)
                
            }
            
        })
        
        
        filteredUserNames = userIDArray
        searchController.searchResultsUpdater = self
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.dimsBackgroundDuringPresentation = false
        tableView.tableHeaderView = searchController.searchBar
        
        
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        searchController.dismiss(animated: false, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let usernames = filteredUserNames else {
            return 0
        }
        return usernames.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Prototype", for: indexPath)
        
        if let usernamesArray = filteredUserNames?.sorted() {
            let cellName = ("\(String(describing: usernamesArray[indexPath.row]))")
            cell.textLabel?.text = cellName
        }
        return cell
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        if let searchText = searchController.searchBar.text, !searchText.isEmpty {
            filteredUserNames = userIDArray.filter { individual in
                return individual.lowercased().contains(searchText.lowercased())
                //puts everything in same case for effective searching
            }
            
        } else {
            filteredUserNames = userIDArray
            //since the tableview only displayed what has been searched (filtered), if there are no searches, filtered = all
        }
        tableView.reloadData()
        //reloads tableview with new data given by searching
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Users"
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tag = filteredUserNames![indexPath.row]
        
        print(tag)
        self.performSegue(withIdentifier: "ViewSegue", sender: nil)
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        filteredUserNames = userIDArray.sorted()
        super.viewWillAppear(true)
        self.tableView.reloadData()

        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        let toSend = segue.destination as! FriendDetailViewController
        toSend.datacomingin = tag
    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

