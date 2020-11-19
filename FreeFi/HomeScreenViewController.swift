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
    

        override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let query = PFQuery(className: "User")
        let name = query.includeKey("firstName")
        
        print(name)
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        

        pieChartView.noDataText = "You must enter values first Dummy"
        

        
        let categories = ["Home expense", "Insurance", "Food/Groceries"]//, "Internet/Cable", "Lifestyle", "Entertainment", "Gas/Autmobile", "Miscellanious"]
        let userEntries = [3000.87, 500.50, 200.78]//, 50.98, 100.99, 200.78, 200.20, 300.50]
        setChart(dataPoints: categories, values: userEntries)
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

    
    

    @IBAction func onLogOut(_ sender: Any) {
        
        
        self.dismiss(animated: true, completion: nil)
        UserDefaults.standard.set(false, forKey: "userLoggedIn")
        
    }

}
