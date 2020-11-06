//
//  SignUpViewController.swift
//  FreeFi
//
//  Created by Matthew Mogannam on 10/30/20.
//

import UIKit
import Parse

class SignUpViewController: UIViewController {
    

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()

    }
    
    @IBAction func onSignUp(_ sender: Any) {
        let user = PFUser()
        let first = firstNameTextField.text!
        let last = lastNameTextField.text!
        
        let email = emailTextField.text!
        let password = passwordTextField.text!
        
        user["firstName"] = first
        user["lastName"] = last
        user.username = email
        user.password = password
        user.email = email
        
        
        
        let alert = UIAlertController(title: "Could not Sign Up", message: "Account already exists for this email.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        user.signUpInBackground { (success, error) in
            if success {
                print("Fuck yes")
            } else {
                self.present(alert, animated: true)
                print("Error: \(String(describing: error?.localizedDescription))")
            }
        }
        
}
        
        
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
