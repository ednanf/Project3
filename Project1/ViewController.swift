//
//  ViewController.swift
//  Project1
//
//  Created by Ednan R. Frizzera Filho on 13/05/23.
//

import UIKit

class ViewController: UIViewController {
// MARK: - Properties
    var pictures: [String] = []
    
    
// MARK: - Setup
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl") {
                // this is a picture to load!
                pictures.append(item)
            }
        }
        print(pictures)
    }
// MARK: - Functions

    
    
    
    
    
    
}

