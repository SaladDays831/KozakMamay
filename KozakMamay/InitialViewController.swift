//
//  InitialViewController.swift
//  KozakMamay
//
//  Created by Danil Kurilo on 07/08/2019.
//  Copyright © 2019 Danil Kurilo. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController {

    
    
    @IBOutlet var popUpView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        popUpView.layer.cornerRadius = 5

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    
    @IBAction func infoButtonPressed(_ sender: UIButton) {
        
        self.view.addSubview(popUpView)
        popUpView.center = self.view.center
        
        popUpView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        popUpView.alpha = 0
        
        
        UIView.animate(withDuration: 0.5) {
            self.popUpView.alpha = 1
            self.popUpView.transform = CGAffineTransform.identity
        }
        
    }
    

    
    @IBAction func closeButtonPressed(_ sender: UIButton) {
        
        UIView.animate(withDuration: 0.3, animations: {
            self.popUpView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
            self.popUpView.alpha = 0
        }) { (success) in
            self.popUpView.removeFromSuperview()
        }
        
    }
    
    
}
