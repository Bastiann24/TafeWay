//
//  InfoDirectionScreenViewController.swift
//  TafeWay
//
//  Created by Kiel on 11/10/21.
//

import UIKit

class InfoDirectionScreenViewController: UIViewController {

    //Variable that will store the area that the info is being displayed for
    var areaToDisplayInfo : String?
    // Label that will display the info
    @IBOutlet weak var displayTextLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if (areaToDisplayInfo == "BASEMENT - Sector B"){
            displayTextLabel.text = "Sector B contains classroom B.B01, B.B02, B.B03 and B.B04"
        }
        if (areaToDisplayInfo == "BASEMENT - Sector D"){
            displayTextLabel.text = "Sector D contains classroom D.B01, D.B02, D.B03, D.B04, D.B05, D.B06, D.B07, D.B08 and there is a toilter in between classrooms D.B06 and D.B07 "
        }
        
    }
    
}
