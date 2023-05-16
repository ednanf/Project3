//
//  DetailViewController.swift
//  Project1
//
//  Created by Ednan R. Frizzera Filho on 13/05/23.
//

import UIKit

class DetailViewController: UIViewController {
// MARK: - IBOutlets
    @IBOutlet var ImageView: UIImageView!
 
    
// MARK: - Properties
    var selectedImage: String?
    var selectedPictureNumber = 0 // contains the image position in the array
    var totalPictures = 0 // contains the total number of pictures
  

// MARK: - Setup
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Image \(selectedPictureNumber) of \(totalPictures)"
        navigationItem.largeTitleDisplayMode = .never
        
        // Adds a action button to the top bar.
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))

        if let imageToLoad = selectedImage {
            ImageView.image = UIImage(named: imageToLoad)
        }
   
    }


// MARK: - Functions
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    // Activity View Controller (share sheet):
    // @objc marks as being available to Objective-C code.
    @objc func shareTapped() {
        guard let image = ImageView.image?.jpegData(compressionQuality: 0.8) else {
            print("No image found")
            return
        }

        let vc = UIActivityViewController(activityItems: [image], applicationActivities: []) // Array of items to be shared and array of app's own services.
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem // Tells where the activity view controller should be anchored -- FOR iPAD!
        present(vc, animated: true)
        
        // ATTENTION: To allow saving photos, info.plist (last file on the left column) must be editted:
        // 1. Right-click and add a new row;
        // 2. Select: Privacy - Photo Library Additions Usage Description;
        // 3. Add an explanation to the text field on the right side.
    }
    
    
    
    
}
