//
//  JSAPIConstant.swift
//  JsapiApi
//
//  Created by youssef on 3/3/15.
//  Copyright (c) 2015 Knetik. All rights reserved.
//

import Foundation
class JSAPIConstant
{
class var OAUTH_TOKEN:String {return "/oauth/token" }  // Login EndPoint class
class var REGISTER:String {return "/services/latest/registration/register" }  // Register Endpoint
    
//Cart EndPoints 
class var SCARTS:String {return "/services/latest/carts" }  // SCARTS because there is carts class
class var CARTSSKU:String {return "/services/latest/carts/skus" }  // SCARTS because there is carts class
class var CARTCHECKOUT:String {return "/services/latest/carts/%@/checkout" }  // %@ CARTGUID
class var CARTCOUNTRIES:String {return "/services/latest/carts/%@/countries" }  // %@ CARTGUID countries
class var CARTDISCOUNT:String {return "/services/latest/carts/%@/discounts" }  // %@ CARTGUID discount
class var CARTITEMS:String {return "/services/latest/carts/%@/items" }  // %@ CARTGUID discount
class var SHIPPINGADDRESS:String {return "/services/latest/carts/%@/shipping-address" }  // %@ CARTGUID discount
class var SHIPPABLE:String {return "/services/latest/carts/%@/shippable" }  // %@ CARTGUID discount
    
    ///End Carts
}


