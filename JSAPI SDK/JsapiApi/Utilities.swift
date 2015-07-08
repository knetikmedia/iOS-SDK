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
        var datastring: String = NSString(data:body, encoding:NSUTF8StringEncoding)! as String
        println(datastring)
        return datastring
    }
    

    /*
    generate formated Put String
    */
    class func getformatedPutString(requestparamters:String)->String
    {
      return "\""+requestparamters+"\""
    }

    
    /*
    generate Json Request from Dictionary
    */
    class func jsonRequestFromDictionary(requestparamters:Dictionary<String,Int>)->String
    {
        var err: NSError?
        let body = NSJSONSerialization.dataWithJSONObject(requestparamters, options: nil, error: &err)!
        var datastring: String = NSString(data:body, encoding:NSUTF8StringEncoding)! as String
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
        var datastring: String = NSString(data:body, encoding:NSUTF8StringEncoding)! as String
        println(datastring)
        return datastring
    }

    
    /*
    generate Json Request from Dictionary
    */
    class func getGETRequestFromDictionary(requestparamters:Dictionary<String,AnyObject>)->String
    {
        var datastring="?";
        for (myKey,myValue) in requestparamters {
            if let str = myValue as? String {
                datastring+=myKey+"="+(myValue as! String)+"&"
            }
            else {
                datastring+=myKey+"="+myValue.stringValue+"&"
            }
           }
        return datastring
    }

    class func currentTimeMillis() -> Int64{
        var nowDouble = NSDate().timeIntervalSince1970
        return Int64(nowDouble*1000)
    }
    
}