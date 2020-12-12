//
//  NewExpenseViewController.swift
//  FreeFi
//
//  Created by Abhay Naik on 11/19/20.
//

import UIKit
import Parse
import CurrencyTextField
import Charts

class NewExpenseViewController: UIViewController{
    
    var expenses = [String]()
    
    @IBOutlet weak var pieChartView: PieChartView!

    @IBOutlet weak var dateTextField: UITextField!
    
    let categories = ["Home expense", "Insurance", "Food/Groceries", "Internet/Cable", "Lifestyle", "Entertainment", "Gas/Autmobile", "Miscellanious"]
    
    
    @IBOutlet weak var homeExpTextField: UITextField!
    @IBOutlet weak var insurExpTextField: UITextField!
    @IBOutlet weak var foodExpTextField: UITextField!
    @IBOutlet weak var cableExpTextField: UITextField!
    @IBOutlet weak var lifeExpTextField: UITextField!
    @IBOutlet weak var entertainExpTextField: UITextField!
    @IBOutlet weak var carExpTextField: UITextField!
    @IBOutlet weak var extraExpTextField: UITextField!
    
    var datePicker: UIDatePicker!
    
    let dateFormat = DateFormatter()

    override func viewDidLoad() {
        super.viewDidLoad()

       setupdatePicker()
        
        let query = PFQuery(className:"Expense")
        query.includeKeys(["homeExpense", "insurenceExpense", "foodExpense", "cableExpense", "lifeExpense", "entertainmentExpense", "carExpense", "extraExpense"])

        //Hiding Navigation Bar Line
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        
    }
    


    func setupdatePicker(){

        self.datePicker = UIDatePicker.init(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width,
            height: 200))
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(self.dateChanged), for: .allEvents)

        if #available(IOS 13.4,*){
            datePicker.preferredDatePickerStyle = .wheels
        }
        self .dateTextField.inputView = datePicker
        let toolBar:UIToolbar = UIToolbar.init(frame: CGRect(x: 0, y: 0, width:
            self.view.bounds.width, height: 44 ))
        let spaceButton:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem:
            UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let doneButton:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem:
            UIBarButtonItem.SystemItem.done, target: self, action: #selector(self.tapOnDoneBut))

        toolBar.setItems([spaceButton, doneButton], animated: true)
        self.dateTextField.inputAccessoryView = toolBar

    }
    @objc func dateChanged() {
        
        dateFormat.dateStyle = .medium
        self.dateTextField.text = dateFormat.string(from: datePicker.date)
    }

    @objc func tapOnDoneBut() {
        dateTextField.resignFirstResponder()
    }
    
    
    @IBAction func onAnalyze(_ sender: Any) {
        let expense = PFObject(className: "Expenses")
        
        self.dateTextField.text = dateFormat.string(from: datePicker.date)
        
        let date = dateTextField.text!
        
        let homeExp = homeExpTextField.text!
        expenses.append(homeExp)
        let insurExp = insurExpTextField.text!
        expenses.append(insurExp)
        let foodExp = foodExpTextField.text!
        expenses.append(foodExp)
        let lifeExp = lifeExpTextField.text!
        expenses.append(lifeExp)
        let entertainExp = entertainExpTextField.text!
        expenses.append(entertainExp)
        let carExp = carExpTextField.text!
        expenses.append(carExp)
        let extraExp = extraExpTextField.text!
        expenses.append(extraExp)
        
        print(expenses)
        
        
        
        /* expense["date"] = date
        
        
        expense["homeExpense"] = homeExp
        expense["insuranceExpense"] = insurExp
        expense["foodExpense"] = foodExp
        expense["lifestyleExpense"] = lifeExp
        expense["entertainmentExpense"] = entertainExp
        expense["automobileExpense"] = carExp
        expense["miscellaneous"] = extraExp
        
        expense["user"] = PFUser.current()!
        expense.saveInBackground { (succeeded, error) in
            if succeeded {
                print("good")
            } else {
                print("failed")
            }
        }
        */
    
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    
    @IBAction func onBackButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    

//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }
//    */
    
}
