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
    class func jsonRequestFromDictionary(_ requestparamters:Dictionary<String,String>)->String
    {
        let body = try! JSONSerialization.data(withJSONObject: requestparamters, options: [])
        let datastring: String = NSString(data:body, encoding:String.Encoding.utf8.rawValue)! as String
        return datastring
    }
    

    /*
    generate formated Put String
    */
    class func getformatedPutString(_ requestparamters:String)->String
    {
      return "\""+requestparamters+"\""
    }

    
    /*
    generate Json Request from Dictionary
    */
    class func jsonRequestFromDictionary(_ requestparamters:Dictionary<String,Int>)->String
    {
        let body = try! JSONSerialization.data(withJSONObject: requestparamters, options: [])
        let datastring: String = NSString(data:body, encoding:String.Encoding.utf8.rawValue)! as String
        return datastring
    }

    /*
    generate Json Request from Dictionary
    */
    class func jsonRequestFromDictionary(_ requestparamters:Dictionary<String,AnyObject>)->String
    {
        let body = try! JSONSerialization.data(withJSONObject: requestparamters, options: [] )
        let datastring: String = NSString(data:body, encoding:String.Encoding.utf8.rawValue)! as String
        return datastring
    }

    
    /*
    generate Json Request from Dictionary
    */
    class func getPostValueRequestFromDictionary(_ requestparamters:Dictionary<String,AnyObject>)->String
    {
        var datastring="\"";
        for (myKey,myValue) in requestparamters {
            if let str = myValue as? String {
                datastring+=(myValue as! String)
            }
          
        }
        return datastring+"\""
    }

    
    /*
    generate Json Request from Dictionary
    */
    class func getGETRequestFromDictionary(_ requestparamters:Dictionary<String,AnyObject>)->String
    {
        var datastring="?";
        for (myKey,myValue) in requestparamters {
            
            if let str = myValue as? String {
                
                let myStringValue = myValue.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
                
                datastring+=myKey + "=" + myStringValue + "&"
            }
            else {
                
                 let myStringValue = myValue.stringValue.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
                
                datastring+=myKey+"="+myStringValue+"&"
                
            }
           }
        return datastring
    }

    class func currentTimeMillis() -> Int64{
        let nowDouble = Date().timeIntervalSince1970
        return Int64(nowDouble*1000)
    }
    
}
