//
//  ViewController.swift
//  Hajime
//
//  Created by Robin 🌸 on 8/22/23.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        reloadBackground()
        
        // Handle PFP
        PFP.layer.borderWidth = 5
        PFP.layer.cornerRadius = PFP.frame.width / 2
        PFP.clipsToBounds = true
        
        // Handle Twitter
        let twitterGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(openTwitter))
        Twitter.addGestureRecognizer(twitterGestureRecognizer)
        
        // Handle Github
        let githubGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(openGithub))
        Github.addGestureRecognizer(githubGestureRecognizer)
        
        // Handle Reload
        let reloadGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(reloadBackground))
        Reload.addGestureRecognizer(reloadGestureRecognizer)
        
        // Handle Map
        let utdCoordinates = CLLocationCoordinate2D(latitude: 32.986633, longitude: -96.750508)
        let camera = MKMapCamera(lookingAtCenter: utdCoordinates, fromDistance: 500, pitch: 45, heading: 0)

        Map.setCamera(camera, animated: false)
        Map.isUserInteractionEnabled = false
    }
    
    // Runs on Twitter Tap
    @objc func openTwitter() {
        if let url = URL(string: "https://twitter.com/roeegh") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    // Runs on Github Tap
    @objc func openGithub() {
        if let url = URL(string: "https://github.com/roeegh") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    // Runs on Reload Tap
    @objc func reloadBackground() {
        let mainBackground = generateRandomColor()
        let secondaryBackground = UIColor { traits in
            return traits.userInterfaceStyle == .dark ? UIColor(red: 0, green: 0, blue: 0, alpha: 0.50) : UIColor(red: 1, green: 1, blue: 1, alpha: 0.50)
        }
        
        view.backgroundColor = mainBackground
        PFP.layer.borderColor = mainBackground.cgColor
        Bio.textColor = mainBackground
        
        Profile.backgroundColor = secondaryBackground
        Map.backgroundColor = secondaryBackground
        Twitter.backgroundColor = secondaryBackground
        Github.backgroundColor = secondaryBackground
        Reload.backgroundColor = secondaryBackground
    }
    
    // Generates random color
    func generateRandomColor() -> UIColor {
        let red = CGFloat.random(in: 0...1)
        let green = CGFloat.random(in: 0...1)
        let blue = CGFloat.random(in: 0...1)
        
        return UIColor(red: red, green: green, blue: blue, alpha: 1)
    }


    @IBOutlet weak var Profile: UIView!
    @IBOutlet weak var PFP: UIImageView!
    @IBOutlet weak var Bio: UILabel!
    @IBOutlet weak var Map: MKMapView!
    @IBOutlet weak var Twitter: UIView!
    @IBOutlet weak var Github: UIView!
    @IBOutlet weak var Reload: UIView!
}
