//
//  ViewControllerSuppliers.swift
//  MyXVApp
//
//  Created by Oscar Alejandro Sanabria on 04/12/16.
//  Copyright © 2016 Hello Word Technologies. All rights reserved.
//

import UIKit

class ViewControllerSuppliers: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    var supplier : [Suppliers] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var supp = Suppliers(name: "Dress", image: #imageLiteral(resourceName: "dress"), descriptionS: "You can find a perfect dress")
        supplier.append(supp)
        
        supp = Suppliers(name: "Cake", image: #imageLiteral(resourceName: "cake"), descriptionS: "The most delicious party cakes")
        supplier.append(supp)
        
        supp = Suppliers(name: "Music", image: #imageLiteral(resourceName: "music"), descriptionS: "You will not stop to dancing")
        supplier.append(supp)
        
        supp = Suppliers(name: "Cocktails", image: #imageLiteral(resourceName: "cock"), descriptionS: "Just drinks whit love 😜")
        supplier.append(supp)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

extension ViewControllerSuppliers : UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return supplier.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
       let fam = supplier[indexPath.row]
        let cellId = "supplierTable"
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! SupplierTableViewCell
        
        /*
         cell.textLabel?.text = fam.name
       
 */
        cell.imageSupplier.image = fam.image
        cell.labelName.text = fam.name
        cell.labelDescript.text = fam.descriptionS
        
        cell.imageSupplier.layer.cornerRadius = 44.0
        cell.imageSupplier.clipsToBounds = true
        
        
 
        return cell
    }
    
}
