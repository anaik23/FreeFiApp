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
    

    @IBOutlet weak var pieChartView: PieChartView!
    //var users = [PFObject]()
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var namesLabel: UILabel!
    var expenses = [PFObject]()
    
    override func viewDidLoad() {
        
       
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let user = PFUser.current()!
        nameLabel.text = user["firstName"] as? String
        namesLabel.text = user["firstName"] as? String
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        pieChartView.noDataText = "You need to provide data for the chart."
        /*
        let query = PFQuery(className:"Expenses")
        query.includeKey("firstName")
        query.limit = 20
        //let test = expenses["homeExpense"]
        query.findObjectsInBackground { (expenses, error) in
            if expenses != nil {
                self.expenses = expenses!
                //self.tableView.reloadData()
            }
            
            let test = expenses["homeExpense"]
           // expense["homeExpense"] = PFUser.current()!
        
        
        let query = PFQuery(className:"Expenses")
        query.includeKey("homeExpense")
        query.limit = 20
    
        query.findObjectsInBackground { [self] (expenses, error) in
        if expenses != nil {
            self.expenses = expenses!
        }
    }
        
        let expense = expenses[0]
        
        */
        let categories = ["Home expense", "Insurance", "Food/Groceries", "Internet/Cable", "Lifestyle", "Entertainment", "Gas/Autmobile", "Miscellanious"]
        let userEntries = [3333.24, 500.50, 200.78, 50.98, 100.99, 200.78, 200.20, 300.50]
        setChart(dataPoints: categories, values: userEntries)
    
       //expense["homeExpense"] as! Double
    }
    
    func setChart(dataPoints: [String], values: [Double]) {
           
        var dataEntries: [PieChartDataEntry] = []
                
        for i in 0..<(dataPoints.count) {
            let dataEntry = PieChartDataEntry(value: values[i], data: i)
            dataEntries.append(dataEntry)
                }
                
        let pieChartDataSet = PieChartDataSet(entries: dataEntries, label: "Categories")
                let pieChartData = PieChartData(dataSet: pieChartDataSet)
                pieChartView.data = pieChartData
        
                var colors: [UIColor] = []
                
                for i in 0..<dataPoints.count {
                    let red = Double(arc4random_uniform(256))
                    let green = Double(arc4random_uniform(256))
                    let blue = Double(arc4random_uniform(256))
                    
                    let color = UIColor(red: CGFloat(red/255), green: CGFloat(green/255), blue: CGFloat(blue/255), alpha: 1)
                    colors.append(color)
                }
                
                pieChartDataSet.colors = colors
           
       }
    
   // let post = users[indexpath.row]
    
    //let comments = (post["comments"] as? [PFObject]) ?? []
   

    
    @IBAction func onPastExpense(_ sender: Any) {
        self.performSegue(withIdentifier: "pastExp", sender: nil)
    }
    
    @IBAction func onLogout(_ sender: Any) {
        PFUser.logOut() //clear Parse cache
        self.dismiss(animated: true, completion: nil)
        UserDefaults.standard.set(false, forKey: "userLoggedIn")
        
    
    }
}

