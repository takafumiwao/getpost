//
//  ViewController.swift
//  getpost
//
//  Created by 岩男高史 on 2019/01/20.
//  Copyright © 2019 岩男高史. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
  
  

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    
    
    
  }
  
  @IBOutlet weak var button: UIButton!
  
  @IBOutlet weak var textfield: UITextField!
  
  @IBOutlet weak var textView: UITextView!
  
  @IBAction func postButton(_ sender: UIButton) {
    let urlString = "https://08d1b809.ngrok.io/getpost/"
    let request =  NSMutableURLRequest(url: URL(string: urlString)!)
    request.httpMethod = "POST"
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    
    let params:[String:Any] = ["\(textfield.text!)":"\(textView.text!)"]
    
    do{
      request.httpBody = try JSONSerialization.data(withJSONObject: params, options: .prettyPrinted)
      let task:URLSessionDataTask = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
        let resultData = String(data: data!, encoding: .utf8)!
        print("result:\(resultData)")
        print("response:\(response!)")
      })
      task.resume()
    }catch{
      print("Error:\(error)")
      return
    }
    
}

}
