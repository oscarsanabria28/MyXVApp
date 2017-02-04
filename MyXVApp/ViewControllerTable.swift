//
//  ViewControllerTable.swift
//  MyXVApp
//
//  Created by Oscar Alejandro Sanabria on 03/12/16.
//  Copyright © 2016 Hello Word Technologies. All rights reserved.
//

import UIKit

class ViewControllerTable: UITableViewController {
    
    var arrayFamily : [Familia] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var family = Familia(name: "Bryan's Family ")
        arrayFamily.append(family)
        
        family = Familia(name: "Oscar's Family ")
        arrayFamily.append(family)
        
        family = Familia(name: "Brittany's Family ")
        arrayFamily.append(family)
        
        family = Familia(name: "Aaron's Family ")
        arrayFamily.append(family)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - UITableViewDataSource
    
    //How many section have our table
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayFamily.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let fam = arrayFamily[indexPath.row]
        let cellId = "guestTable"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        cell.textLabel?.text = fam.name
        
        return cell
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
