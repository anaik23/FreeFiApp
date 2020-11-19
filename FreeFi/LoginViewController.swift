//
//  LoginViewController.swift
//  FreeFi
//
//  Created by Abhay Naik on 10/29/20.
//

import UIKit
import Parse
import LocalAuthentication

class LoginViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    
    
  
    @IBAction func newUserButton(_ sender: Any) {
        self.performSegue(withIdentifier: "signUpSegue", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //UserDefaults.standard.set(true, forKey: "isUserLoggedIn")
        //UserDefaults.standard.synchronize()

        // Do any additional setup after loading the view.
        emailField.setBottomBorder()
        passwordField.setBottomBorder()
        self.hideKeyboardWhenTappedAround()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        
        if UserDefaults.standard.bool(forKey: "userLoggedIn") == true {
            
           
        let context:LAContext = LAContext()
            
            if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: nil){
                context.evaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Message") { (good, error) in
                    if good{
                        print("Fuck yes")
                        UserDefaults.standard.set(true, forKey: "userLoggedIn")
                        DispatchQueue.main.async {
                            self.performSegue(withIdentifier: "loginSegue", sender: nil)
                        }
                        
                    } else{
                        print("Try Again")
                        self.dismiss(animated: true, completion: nil)
                        UserDefaults.standard.set(false, forKey: "userLoggedIn")
                       
                    }
                    
                }
        }
        
        }
        
        
        
        
        
        
    }
    
   
        
    @IBAction func onLogin(_ sender: Any) {
        let username = emailField.text!
        let password = passwordField.text!
        
        let alert = UIAlertController(title: "Could not Login", message: "Username and/or password is incorrect", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))

        
        
        PFUser.logInWithUsername(inBackground: username, password: password) { (user, error) in
            if user != nil {
                UserDefaults.standard.set(true, forKey: "userLoggedIn")
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
                
            } else {
                self.present(alert, animated: true)
                print("Error: \(String(describing: error?.localizedDescription))")
                
            }
        }
        
       
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

extension UITextField {
  func setBottomBorder() {
    self.borderStyle = .none
    self.layer.backgroundColor = UIColor.white.cgColor

    self.layer.masksToBounds = false
    self.layer.shadowColor = UIColor.lightGray.cgColor
    self.layer.shadowOffset = CGSize(width: 0.0, height: 2.5)
    self.layer.shadowOpacity = 1.0
    self.layer.shadowRadius = 0.0
  }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)

    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}


