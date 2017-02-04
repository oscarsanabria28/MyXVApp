//
//  SingleTableViewController.swift
//  MyXVApp
//
//  Created by Oscar Alejandro Sanabria on 03/12/16.
//  Copyright © 2016 Hello Word Technologies. All rights reserved.
//

import UIKit

class SingleTableViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    var arrayFamily : [Familia] = []
    
    @IBOutlet var textFieldNameF: UITextField!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
       
        // Do any additional setup after loading the view.
    }

    @IBAction func addFamily(_ sender: UIButton) {
        if textFieldNameF.text! == ""{
        
        }else{
            //let family = Familia(name: "\(textFieldNameF.text!)'s family")
            let family = Familia(name: textFieldNameF.text!, numberGuests: 0)
            arrayFamily.append(family)
            
            alertMessage(message: "Your new family was saved correctly")
        }
        
        
        //print(arrayFamily)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func alertMessage(message: String){
        let alertController = UIAlertController(title: "Message!", message: "\(message)", preferredStyle: .actionSheet)
        
        let cancelAction =  UIAlertAction(title: "Accept", style: .cancel){ (action) in
            self.tableView.reloadData()
        
        }
        
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
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

extension SingleTableViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayFamily.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let fam = arrayFamily[indexPath.row]
        let cellId = "guestTable"
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! GuestTableViewCell
        
        cell.imageGuest.layer.cornerRadius = 20.0
        cell.imageGuest.clipsToBounds = true
        
        cell.labelNameGuest.text = "\(fam.name.uppercased())'s table"
        cell.labelNGuestd.text = "Guest in your table: \(fam.numberGuests!)"
        
        
        
        return cell
    }

}

extension SingleTableViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("he seleccionado la familia: \(indexPath.row)")
    }
    
}



























