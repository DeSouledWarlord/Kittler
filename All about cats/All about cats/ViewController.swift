//
//  ViewController.swift
//  All about cats
//
//  Created by P.M. Student on 11/7/19.
//  Copyright © 2019 Gage. All rights reserved.
//

import UIKit
import AVFoundation
import CoreLocation
import UserNotifications

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    let manager = CLLocationManager()
    
    var audioPlayer = AVAudioPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let sound = Bundle.main.path(forResource: "Cat-meowing-loudly", ofType: "mp3")
        
        do {
            try audioPlayer = AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
        }
        catch{
            print(error)
        }
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge], completionHandler: {didAllow, error in})
        
        manager.delegate = self
        manager.desiredAccuracy=kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }

    @IBAction func playMeow(_ sender: UIButton) {
        audioPlayer.play()
    }
    
    

//    func createAlert(title:String, message:String) {
//        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
//        
//        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { (action) in
//            alert.dismiss(animated: true, completion: nil)
//        }))
//        
//        alert.addAction(UIAlertAction(title: "DON'T ALLOW", style: UIAlertAction.Style.default, handler: { (action) in
//            alert.dismiss(animated: true, completion: nil)
//        }))
//        
//        self.present(alert, animated: true, completion: nil)
//    }
//    
//    
//    override func viewDidAppear(_ animated: Bool) {
//        createAlert(title: "Kittler Would Like To Send You Notifications.", message: "Notifications may include alerts, sounds, and icon badges. These can be configured in Settings.")
//    }
    

}
