//
//  ViewController.swift
//  MyXVApp
//
//  Created by Oscar Alejandro Sanabria on 30/11/16.
//  Copyright © 2016 Hello Word Technologies. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

     //Buttons
    @IBOutlet var buttonSignUp: UIButton!
    @IBOutlet var buttonSignIn: UIButton!
    
    //textFields
    
    @IBOutlet var textFieldUserName: UITextField!
    @IBOutlet var textFieldPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       buttonSignUp.layer.cornerRadius = 15
       buttonSignIn.layer.cornerRadius = 15
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func actionButton(_ sender: UIButton) {
        
        //errorAlert(error: "entro al buton")
        let user : String = textFieldUserName.text!
        let pass : String = textFieldPassword.text!
        
       var resultValue : Int =  0;
        
        if user == "" || pass == "" {
            errorAlert(error: "Complete all text fields please")
        }else {
            
            let request = NSMutableURLRequest(url: URL(string: "http://oscarsanabria.azurewebsites.net/php/connect.php")! as URL)
            
            request.httpMethod = "POST"
            
            let getString = "subirUsuario=si&user=\(user)&pass=\(pass)"
            
            request.httpBody = getString.data(using: String.Encoding.utf8)
            
            let sema = DispatchSemaphore( value: 0 )
            
            let task = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: {
                (data,response,error) -> Void in
                guard error == nil && data != nil
                    else{
                        print("error=\(error)")
                        return
                }
                if let httpStatus = response as? HTTPURLResponse , httpStatus.statusCode != 200{
                    print("statusCoid should be 200 but is \(httpStatus.statusCode)")
                    print("response=\(response)")
                }
                
                let responseString = String(data: data!, encoding: String.Encoding.utf8)
                
                print(responseString!)
                
                if responseString! == "1 Bien " {
                    resultValue = 1
                    
                    //self.changePage(sender : sender)
                    
                }else{
                    resultValue = 2
                }
                sema.signal()
                
            })
            
            
            task.resume()
            sema.wait()
            changePage(sender: sender, result: resultValue)
            
        }
        
        
    }
    
    func changePage(sender : UIButton, result : Int){
        if result == 1 {
            //errorAlert(error: "Perfect \(textFieldUserName.text!) you was Sign in correctly")
            performSegue(withIdentifier: "segueSignIn", sender: sender)
        }else{
            errorAlert(error: "Your User or Password are incorrect, please check again")
        }
        
    }
    
    
    func errorAlert(error : String){
        
        let alertController = UIAlertController(title: "Alert!", message: "\(error)", preferredStyle: .actionSheet)
        
        let cancelAction =  UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
}



















