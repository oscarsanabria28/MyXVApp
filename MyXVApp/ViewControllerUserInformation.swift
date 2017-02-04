//
//  ViewControllerUserInformation.swift
//  MyXVApp
//
//  Created by Oscar Alejandro Sanabria on 04/12/16.
//  Copyright © 2016 Hello Word Technologies. All rights reserved.
//

import UIKit

class ViewControllerUserInformation: UIViewController {

    @IBOutlet var labelUser: UILabel!
    @IBOutlet var labelPassword: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        checkUserInformation()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func checkUserInformation(){
        let request = NSMutableURLRequest(url: URL(string: "http://oscarsanabria.azurewebsites.net/php/selectOne.php")! as URL)
        
        request.httpMethod = "POST"
        
        //let getString = "subirUsuario=si&user=\(user)"
        let getString = "subirUsuario=si&user=oscar"
        
        request.httpBody = getString.data(using: String.Encoding.utf8)
        
        //let sema = DispatchSemaphore( value: 0 )
        
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
            let response = responseString!.components(separatedBy: "%%%")
            //print(words)
            if response[0] == "1" {
                
                self.labelUser.text = "User name: \(response[1])"
                self.labelPassword.text = "User password: \(response[2])"
            }
            //sema.signal()
            
        })
        
        
        task.resume()
        //sema.wait()
        
        
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
