//
//  ShowingDirectionViewController.swift
//  TafeWay
//
//  Created by Bastian Ugalde  on 30/9/21.
//

import UIKit
import AVKit

class ShowingDirectionViewController: UIViewController {

    //Variables that are stroring data passed from EnterDestinationScreenController
    public var area  = ""
    public var entrance = ""

    
    @IBOutlet weak var videoView: UIView!
    //Set player
    var player: AVPlayer!
    //Set player controller
    var avpController = AVPlayerViewController()
    override func viewDidLoad() {
        super.viewDidLoad()
        //sample code for video testing
        guard let path = Bundle.main.path(forResource: "sample", ofType:"mp4") else {
                    debugPrint("sample.mp4 not found")
                    return
                }
        guard let path2 = Bundle.main.path(forResource: "sample2", ofType:"mp4") else {
                    debugPrint("sample2.mp4 not found")
                    return
                }
        //Paths for videos
//        guard let pathSectorBFromMain = Bundle.main.path(forResource: "SectorBFromMain", ofType:"mp4") else {
//                    debugPrint("SectorBFromMain.mp4 not found")
//                    return
//                }
//        guard let pathSectorBFromMorphet = Bundle.main.path(forResource: "SectorBTFromMorphet", ofType:"mp4") else {
//                    debugPrint("SectorBFromMorphet.mp4 not found")
//                    return
//                }
//        guard let pathSectorBFromRosina = Bundle.main.path(forResource: "SectorBFromRosina", ofType:"mp4") else {
//                    debugPrint("SectorBFromRosina.mp4 not found")
//                    return
//                }
//        guard let pathSectorDFromMain = Bundle.main.path(forResource: "SectorDFromMain", ofType:"mp4") else {
//                    debugPrint("SectorDFromMain.mp4 not found")
//                    return
//                }
//        guard let pathSectorDFromMorphet = Bundle.main.path(forResource: "SectorDFromMorphet", ofType:"mp4") else {
//                    debugPrint("SectorDFromMorphet.mp4 not found")
//                    return
//                }
//        guard let pathSectorDFromRosina = Bundle.main.path(forResource: "SectorDFromRosina", ofType:"mp4") else {
//                    debugPrint("SectorDFromRosina.mp4 not found")
//                    return
//                }
        //Code handling to select correct video.
        if (area == "BASEMENT - Sector B" && entrance == "Main Entrance"){
            let player = AVPlayer(url: URL(fileURLWithPath: path2))
            avpController.player = player
        }
        else if (area == "BASEMENT - Sector B" && entrance == "Morphet Street Entrance"){
            let player = AVPlayer(url: URL(fileURLWithPath: path2))
            avpController.player = player
        }
        else if (area == "BASEMENT - Sector B" && entrance == "Rosina Street Entrance"){
            let player = AVPlayer(url: URL(fileURLWithPath: path2))
            avpController.player = player
        }
        else if (area == "BASEMENT - Sector D" && entrance == "Main Entrance"){
            let player = AVPlayer(url: URL(fileURLWithPath: path))
            avpController.player = player
        }
        else if (area == "BASEMENT - Sector D" && entrance == "Morphet Street Entrance"){
            let player = AVPlayer(url: URL(fileURLWithPath: path))
            avpController.player = player
        }
        else if (area == "BASEMENT - Sector D" && entrance == "Rosina Street Entrance"){
            let player = AVPlayer(url: URL(fileURLWithPath: path))
            avpController.player = player
        }
        
        //Resize frame to display correctly
        avpController.view.frame.size.height = videoView.frame.size.height
        avpController.view.frame.size.width = videoView.frame.size.width
        self.videoView.addSubview(avpController.view)
        //Testing if area and entrance was passed correctly.
        print("Your area is " + area + " " + entrance)

        // Do any additional setup after loading the view.
    }

}
