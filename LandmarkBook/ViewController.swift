//
//  ViewController.swift
//  LandmarkBook
//
//  Created by Yurii Sameliuk on 04/02/2020.
//  Copyright © 2020 Yurii Sameliuk. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
     var landmarkNames = [String]()
    var landmarkImages = [UIImage]()
    
    var chosenLandmarkNames = ""
    var chosenLandmarkImages = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
       
        landmarkNames.append("GreatWall")
        landmarkNames.append("Kolizey")
        landmarkNames.append("Moskwa")
        landmarkNames.append("Stonehenge")
        landmarkNames.append("TadzhMahal")
        
        
        landmarkImages.append(UIImage(named: "greatWall")!)
        landmarkImages.append(UIImage(named: "kolizey")!)
        landmarkImages.append(UIImage(named: "Moskwa")!)
        landmarkImages.append(UIImage(named: "stonehenge")!)
        landmarkImages.append(UIImage(named: "tadzhMahal")!)
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        cell.textLabel?.text = landmarkNames[indexPath.row]
        
        
        return cell
        }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return landmarkNames.count
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        // pri wzmache ja4ejki w bok delaem wozmognum ee edalenije
        if editingStyle == .delete {
            // ykazuwaem kakuju imenno ja4ejky ydalit
            landmarkNames.remove(at: indexPath.row)
            // sinchronno ydaliaem i ja4ejky iz image
            landmarkImages.remove(at: indexPath.row)
            // ydaliaem stroky s animacuej ydalenija
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
            
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            chosenLandmarkNames = landmarkNames[indexPath.row]
            chosenLandmarkImages = landmarkImages[indexPath.row]
        
        performSegue(withIdentifier: "toImageViewController", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toImageViewController" {
            let destinationVC = segue.destination as! ImageViewController
            destinationVC.selectedLandmarkName = chosenLandmarkNames
            destinationVC.selectedLandmarkImage = chosenLandmarkImages
        }
    }
}

