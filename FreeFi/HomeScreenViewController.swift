//
//  ViewController.swift
//  FreeFi
//
//  Created by Abhay Naik on 10/23/20.
//

import UIKit

class HomeScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()

        
    }

    @IBAction func onLogOut(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
