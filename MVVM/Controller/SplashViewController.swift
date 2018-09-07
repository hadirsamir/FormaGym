//
//  SplashViewController.swift
//  Forma
//
//  Created by Yahia El-Dow on 6/27/18.
//  Copyright © 2018 P-Codes. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {

    @IBOutlet weak var splash_img_imageRotate: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true);

        let fullRotation = CABasicAnimation(keyPath: "transform.rotation")
//        fullRotation.delegate = self
        fullRotation.fromValue = NSNumber(floatLiteral: 0)
        fullRotation.toValue = NSNumber(floatLiteral: Double(CGFloat.pi * 2))
        fullRotation.duration = 0.5
        fullRotation.repeatCount = 011
        splash_img_imageRotate.layer.add(fullRotation, forKey: "360")
        
        
        Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(runTimedCode), userInfo: nil, repeats: true)
        
    
    }
    @IBAction func runTimedCode(){
        
        self.performSegue(withIdentifier: "seg_fireApp", sender: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
