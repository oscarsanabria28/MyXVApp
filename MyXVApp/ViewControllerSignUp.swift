//
//  ViewControllerSignUp.swift
//  MyXVApp
//
//  Created by Oscar Alejandro Sanabria on 02/12/16.
//  Copyright © 2016 Hello Word Technologies. All rights reserved.
//

import UIKit

class ViewControllerSignUp: UIViewController {

    @IBOutlet var textFielUserSU: UITextField!
    @IBOutlet var textFielPassSU: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func signUpAction(_ sender: UIButton) {
        
        let user : String = textFielUserSU.text!
        let pass : String = textFielPassSU.text!
        
        var resultValue : Int =  0;
        
        if user == "" || pass == "" {
            errorAlert(error: "Complete all text fields please")
        }else {
            
            let request = NSMutableURLRequest(url: URL(string: "http://oscarsanabria.azurewebsites.net/php/register.php")! as URL)
            
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
    
    func changePage(sender : UIButton, result: Int) {
        if result == 1{
            //errorAlert(error: "Excelent \(textFielUserSU.text!), enjoy your app ")
            performSegue(withIdentifier: "signUpUser", sender: sender)
        }else{
            errorAlert(error: "Ups! something was wrong with you register process, please try again later")
        }
    }
    
    func errorAlert(error : String) {
        //print("\(error)")
        
        let alertController = UIAlertController(title: "Alert!", message: "\(error)", preferredStyle: .actionSheet)
        
        let cancelAction =  UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
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
