//
//  ImageViewController.swift
//  LandmarkBook
//
//  Created by Yurii Sameliuk on 04/02/2020.
//  Copyright © 2020 Yurii Sameliuk. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    var selectedLandmarkName = ""
    var selectedLandmarkImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        label.text = selectedLandmarkName
        imageView.image = selectedLandmarkImage
    }
    
}
