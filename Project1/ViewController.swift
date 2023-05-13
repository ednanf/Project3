//
//  ViewController.swift
//  Project1
//
//  Created by Ednan R. Frizzera Filho on 13/05/23.
//

import UIKit

class ViewController: UITableViewController {
// MARK: - Properties
    var pictures: [String] = []
    
    
// MARK: - Setup
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        // This loop appends the files in the filesystem that have the prefix "nssl" to the array declared above called "pictures."
        for item in items {
            if item.hasPrefix("nssl") {
                // this is a picture to load!
                pictures.append(item)
            }
        }
    }
    
    // This function will create as many cells as needed for pictures.
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    // This function recycles the cells while scrolling, obtaining the file name and adding it as the cell's content.
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath) // This method called on tableView returns a UITableViewCell
        cell.textLabel?.text = pictures[indexPath.row] // Access the properties from the constant cell created above - the text.
        return cell // Returns the declared cell to the function.
    }
    
}

