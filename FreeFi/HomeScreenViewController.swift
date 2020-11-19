//
//  ViewController.swift
//  FreeFi
//
//  Created by Abhay Naik on 10/23/20.
//

import UIKit
import Parse

class HomeScreenViewController: UIViewController {
    

    //var users = [PFObject]()

    @IBOutlet weak var helloLabel: UILabel!
    
    override func viewDidLoad() {
        
       
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
    
       
    }
    
   // let post = users[indexpath.row]
    
    //let comments = (post["comments"] as? [PFObject]) ?? []
   

    @IBAction func onLogOut(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
        UserDefaults.standard.set(false, forKey: "userLoggedIn")
        self.performSegue(withIdentifier: "backToHomeSegue", sender: nil)
        
    }
    
}

