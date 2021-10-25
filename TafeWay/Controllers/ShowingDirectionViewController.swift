//
//  ShowingDirectionViewController.swift
//  TafeWay
//
//  Created by Bastian Ugalde  on 30/9/21.
//

import UIKit
import AVKit

class ShowingDirectionViewController: UIViewController {

    @IBOutlet weak var videoView: UIView!
    //sample code for video testing
    var player: AVPlayer!
    //sample code for video testing
    var avpController = AVPlayerViewController()
    override func viewDidLoad() {
        super.viewDidLoad()
        //sample code for video testing
        guard let path = Bundle.main.path(forResource: "sample", ofType:"mp4") else {
                    debugPrint("video.mp4 not found")
                    return
                }
        //sample code for video testing
        let player = AVPlayer(url: URL(fileURLWithPath: path))
        //sample code for video testing
        avpController.player = player
        //sample code for video testing
        avpController.view.frame.size.height = videoView.frame.size.height
        //sample code for video testing
        avpController.view.frame.size.width = videoView.frame.size.width
        //sample code for video testing
        self.videoView.addSubview(avpController.view)

        // Do any additional setup after loading the view.
    }

}
