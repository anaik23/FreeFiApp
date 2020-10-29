# FreeFiApp

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema)

## Overview
### Description
This app helps you keep track of your finances. It lets you visualize your spending habits both in numbers and charts. This app also provides advice based on your prior expenses.

### App Evaluation
[Evaluation of your app across the following attributes]
- **Category:** Personal Finance
- **Mobile:** This app is developed currently for a mobile platform but it has the versatility to be integrated into a website based application.
- **Story:** Allows people to track their personal finances and be aware of their finacial desisions and habits.
- **Market:** Made specifically for young adults but it works for everybody.
- **Habit:** This app is more focused towards using it on a monthly bases but the user can take away great information from the app everyday.
- **Scope:** This is app is personal so as the user continuously uses the app, they will gain knowledge of finance and eventually make sound disions and will be finacially literate.

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**
- [ ] Users can Login
- [ ] Users can Sign Up
- [ ] Users can Log Out
- [ ] Users can enter their personal data during Sign Up (Name, email, Password, Location, Age, Salary, Household size)
- [ ] Users can enter monthly spending data
- [ ] Users can view how they spent their money in a certain month in a chart format

**Optional Nice-to-have Stories**
- [ ] Users can view past expense graphs
- [ ] Users can read and understand what each item means while their filling out their monthly spending data
- [ ] The app can pull data from their bank/credit card account to automatically fill in their monthly spending amount
- [ ] Allow with Login in with FaceID
- [ ] User get a summary of the data produced by their inputs

### 2. Screen Archetypes

* Login Screen
   * There are two options where users can put in information like email and password and login or if they have not registered then they can press Sign up button which will lead to Sign Up Screen. 
* Sign Up Screen 
   * Page 1 - If the user is a first time user of the app and presses the Sign up button on the login in screen they will be lead to the the Sign Up screen. In this screen the user will have to input information such as Name, email, Password which will be used to login to the app.
   * Page 2 - After entering the inital information and then pressing SignUp button they are lead to a second page in the Sign up process called the Account details screen where they will input personal information such as Location, Age, Salary, Household size. 
* Home Screen
   * This allows the users to view their most recent expense graph if they have inputed anything. It also allows them to press a button to view past expenses. On this screen the user can press a button on the top bar to add a new expense report or sign off. 
* Monthly Expense Reporting Screen
   * This screen allows users to enter in how much they spent in a paticular month. There are multiple expense categories where the user can fillout with a certain dollar amount. 
* Past Expense Report Screen
   * This screen allows the users to view their previous months expense report. It is a infinite scroll page with the latest expense on the top and the oldest on the bottom. 

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Add New Expense
* Sign Off
* Back Button leads you to the previous screen that the user was on

**Flow Navigation** (Screen to Screen)

* Forced login -> Account creation if no login is available 
   * It leads to sign up screen
* Add New Expense
   * It leads to Monthly Expense Reporting Screen


## Wireframes
<a href="https://ibb.co/7K9L09x"><img src="https://i.ibb.co/hVqwTqx/Free-Fi-App-Wire-Frame.jpg" alt="Free-Fi-App-Wire-Frame" border="0"></a>

### [BONUS] Digital Wireframes & Mockups
<a href="https://ibb.co/sHHwhjv"><img src="https://i.ibb.co/gVVTGyM/Screen-Shot-2020-10-22-at-4-03-57-PM.png" alt="Screen-Shot-2020-10-22-at-4-03-57-PM" border="0"></a>
### [BONUS] Interactive Prototype
<img src="http://g.recordit.co/bFotbdHJpc.gif" width=250><br>
## Schema 

### Models
| Property      | Type          | Description
| ------------- | ------------- |-------------
| fullName      | String        | Users first and last name
| username      | String        | Email for the user to login
| password      | String        | Password for the user to login
| chart         | Graph         | Pie chart to store user entries
| location      | String        | Used to gather more information about the user
| salary        | Double        | Used to gather more information about the user
| houseSize     | Integer       | Used to gather more information about the user
| age           | Integer       | Used to gather more information about the user
| date          | DateTime      | To keep track of the date of expense entry
| homeExp       | Double        | Money spent on rent and home/utility bills
| incExp        | Double        | Money spent on insurance
| foodExp       | Double        | Money spent on food/groceries for the month
| lifestyleExp  | Double        | Money spent on shopping
| entertainExp  | Double        | Money spent on movies, vacations, events
| autoExp       | Double        | Money spent on monthly car payments or lease, car repair servicing/upgrades
| miscExp       | Double        | Money spent on elsewhere like monthly subcriptions 
### Networking
- Home Screen:
```swift
 let query = PFQuery(className:"Charts")
     query.whereKey("username", equalTo: currentUser)
     query.includeKeys(["date","homeExp","incExp", "foodExp", "lifestyleExp", "entertainExp","autoExp", "miscExp"])
     query.limit = 20
     query.findObjectsInBackground { (charts, error) in
            if charts != nil {
                self.charts = charts!
                self.tableView.reloadData()
            }
            
```
- Login Screen:
 ```swift
@IBAction func onSignIn(_ sender: Any) {
        let username = usernameField.text!
        let password = passwordField.text!
        
        PFUser.logInWithUsername(inBackground: username, password: password)
        { (user, error) in
            if user != nil {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            } else {
                print("Error: \(error?.localizedDescription)")
            }
            
        }
        
    }
 ```
 - Sign Up Screen
 ```swift
 @IBAction func onSignUp(_ sender: Any) {
        let user = PFUser()
        user.username = usernameField.text
        user.password = passwordField.text
        user.signUpInBackground { (success, error) in
            if success {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            } else {
                print("Error: \(error?.localizedDescription)")
            }
            
        }
    }
```
