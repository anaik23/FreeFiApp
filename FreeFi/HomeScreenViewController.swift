//
//  ViewController.swift
//  FreeFi
//
//  Created by Abhay Naik on 10/23/20.
//

import UIKit
import Parse
import Charts

class HomeScreenViewController: UIViewController {
    
    


    @IBOutlet weak var pieChartView: PieChartsView!
    
    
    override func viewDidLoad() {
        
       
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let query = PFQuery(className: "User")
        let name = query.includeKey("firstName")
        
        print(name)
        
        
       
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
       
        
    
        
    }
    
   
   

    @IBAction func onLogOut(_ sender: Any) {
        
        
        self.dismiss(animated: true, completion: nil)
        UserDefaults.standard.set(false, forKey: "userLoggedIn")
        
    }

}

