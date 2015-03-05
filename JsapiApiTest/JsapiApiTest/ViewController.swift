//
//  ViewController.swift
//  JsapiApiTest
//
//  Created by youssef on 3/3/15.
//  Copyright (c) 2015 Knetik. All rights reserved.
//

import UIKit
import JsapiApi
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        testDoAuthentication()
       
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    Test Singleton Shared Instance Object
    */
    func testDoAuthentication()
    {
        var userDetails=Dictionary<String,String>()
        userDetails["username"]="admin"
        userDetails["password"]="123123"
        userDetails["email"]="youssef@knetik.com"
        userDetails["password"]="123123"

        
        

        JsapiAPi.sharedInstance.doUserLogin(userDetails)
        {
        (result:NSDictionary,issuccess:Bool) in
            if(!issuccess)
            {
            }else
            {
            }

        }
     
    }
    
    
    /*
    Test Singleton Shared Instance Object
    */
    func testUserRegisteration()
    {
        var userDetails=Dictionary<String,String>()
         userDetails["username"]="youssef"
          userDetails["password"]="123123"
        userDetails["email"]="youssef@knetik.com"
        userDetails["gender"]="male"
        
        
        
        
        JsapiAPi.sharedInstance.doUserRegistration(userDetails)
            {
                (result:NSDictionary,issuccess:Bool) in
                if(!issuccess)
                {
                }else
                {
                }
                
        }
        
    }


}

