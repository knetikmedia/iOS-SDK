//
//  Utilities.swift
//  JsapiApi
//
//  Created by youssef on 3/12/15.
//  Copyright (c) 2015 Knetik. All rights reserved.
//

import Foundation
class Utilities {

    /*
    generate Json Request from Dictionary
    */
    class func jsonRequestFromDictionary(requestparamters:Dictionary<String,String>)->String
    {
        var err: NSError?
        let body = NSJSONSerialization.dataWithJSONObject(requestparamters, options: nil, error: &err)!
        var datastring: String = NSString(data:body, encoding:NSUTF8StringEncoding)!
        println(datastring)
        return datastring
    }
    

    /*
    generate Json Request from Dictionary
    */
    class func jsonRequestFromDictionary(requestparamters:Dictionary<String,Int>)->String
    {
        var err: NSError?
        let body = NSJSONSerialization.dataWithJSONObject(requestparamters, options: nil, error: &err)!
        var datastring: String = NSString(data:body, encoding:NSUTF8StringEncoding)!
        println(datastring)
        return datastring
    }

    /*
    generate Json Request from Dictionary
    */
    class func jsonRequestFromDictionary(requestparamters:Dictionary<String,AnyObject>)->String
    {
        var err: NSError?
        let body = NSJSONSerialization.dataWithJSONObject(requestparamters, options: nil, error: &err)!
        var datastring: String = NSString(data:body, encoding:NSUTF8StringEncoding)!
        println(datastring)
        return datastring
    }

}