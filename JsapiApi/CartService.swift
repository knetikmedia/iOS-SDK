//
//  Cart.swift
//  JsapiApi
//
//  Created by youssef on 3/11/15.
//  Copyright (c) 2015 Knetik. All rights reserved.
//

import Foundation
open class CartService:NSObject
{

    /**"Creates a new cart from scratch
    *@params cartsparams it's emptyDictionry
    */
    open func createCart(_ cartsparams:Dictionary<String,String>,callback:@escaping (String,String,Bool)->Void)
    {
        let methodurl:String=JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.SCARTS

        JsapiRest.sharedInstance.postrequest(methodurl,postParams: Utilities.jsonRequestFromDictionary(cartsparams),isJson:true)
            {
                (result:NSDictionary,issuccess:Bool) in
                let cartNumberResponse=CartResponse(fromDictionary: result)
                if(!issuccess)
                {
                    callback("",cartNumberResponse.errormessage,issuccess)

                }else
                {
                    callback(cartNumberResponse.cartnumber,"",issuccess)
                }
        }
    }

    /**Generates and save a new SKU based on the given prefix
    *@params skuparams {"quantity": 5,"prefix": "WHAT"}
    */
    open func createCartSku(_ skuparams:Dictionary<String,String>,callback:@escaping (Array<String>,String,Bool)->Void)
    {
        let methodurl:String=JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.CARTSSKU

        JsapiRest.sharedInstance.postrequest(methodurl,postParams: Utilities.jsonRequestFromDictionary(skuparams),isJson:true)
            {
                (result:NSDictionary,issuccess:Bool) in
                let skuResponse=CartSKUResponse(fromDictionary: result)
                if(!issuccess)
                {
                    callback(Array<String>(),skuResponse.errormessage,issuccess)
                }else
                {
                    callback(skuResponse.cartsku.skus,"",issuccess)
                }
        }
    }
    
    
    /**Returns the cart with the given GUID
    *guidID String
    *@params cart {"cartguid": "cart GUID"}
    */
    open func getCart(_ cart:Dictionary<String,String>,guidID:String,callback:@escaping (CartDetails,String,Bool)->Void)
    {
        let methodurl:String=JsapiAPi.sharedInstance.getJsapiUrl()+JSAPIConstant.SCARTS+"/"+guidID

        JsapiRest.sharedInstance.getRequest(methodurl,postParams: Utilities.getGETRequestFromDictionary(cart as Dictionary<String, AnyObject>))
            {
                (result:NSDictionary,issuccess:Bool) in
               let getCartResponse = GetCartResponse(fromDictionary: result)
                if(!issuccess)
                {
                    callback(CartDetails(),getCartResponse.errormessage,issuccess)

                }else
                {
                    callback(getCartResponse.cartdetails,"",issuccess)
                }
        }
    }


    /**Closes a cart and generates an invoice
    *itemID String example /services/latest/carts/itemID/checkout
    *@params cart {"cartguid": "cart GUID"}
    */
    open func cartCheckout(_ cart:Dictionary<String,String>,itemID:String,callback:@escaping (Checkout,String,Bool)->Void)
    {
        let endpoint=NSString(format: JSAPIConstant.CARTCHECKOUT as NSString,itemID)
        let methodurl:String=JsapiAPi.sharedInstance.getJsapiUrl()+(endpoint as String)

        JsapiRest.sharedInstance.postrequest(methodurl,postParams: Utilities.jsonRequestFromDictionary(cart),isJson:true)
            {
                (result:NSDictionary,issuccess:Bool) in
               let checkoutResponse = CheckoutResponse(fromDictionary: result)
                if(!issuccess)
                {
                    callback(Checkout(),checkoutResponse.errormessage,issuccess)
                }else
                {
                    callback(checkoutResponse.checkout,"",issuccess)
                }
        }
    }

    
    /**Adds a coupon to the cart identified by GUID
    *itemID String example /services/latest/carts/itemID/discount
    *@params cart {"cartguid": "cart GUID"}
    */
    open func cartDiscount(_ cart:Dictionary<String,String>,itemID:String,callback:@escaping (NSDictionary,Bool)->Void)
    {
        let endpoint=NSString(format: JSAPIConstant.CARTDISCOUNT as NSString,itemID)
        let methodurl:String=JsapiAPi.sharedInstance.getJsapiUrl()+(endpoint as String)

        JsapiRest.sharedInstance.postrequest(methodurl,postParams: Utilities.jsonRequestFromDictionary(cart),isJson:true)
            {
                (result:NSDictionary,issuccess:Bool) in
                if(!issuccess)
                {
                    print(result["error"] ?? "")
                    print(result["error_description"] ?? "")
                }else
                {
                    print(result)
                }
                callback(result,issuccess)
        }
    }
    
    
    /**Get the list of available shipping countries per vendor
    *itemID String example /services/latest/carts/itemID/countries
    *@params cart {"cartguid": "cart GUID"}
    */
    open func cartCountries(_ cart:Dictionary<String,String>,itemID:String,callback:@escaping (Array<Country>,String,Bool)->Void)
    {
        let endpoint=NSString(format: JSAPIConstant.CARTCOUNTRIES as NSString,itemID)
        let methodurl:String=JsapiAPi.sharedInstance.getJsapiUrl()+(endpoint as String)

        JsapiRest.sharedInstance.getRequest(methodurl,postParams: Utilities.getGETRequestFromDictionary(cart as Dictionary<String, AnyObject>))
            {
                (result:NSDictionary,issuccess:Bool) in
                let countriesResponse = CountriesResponse(fromDictionary: result)
                
                if(!issuccess)
                {
                    callback(Array<Country>(),countriesResponse.errormessage,issuccess)

                }else
                {
                    callback(countriesResponse.countries.country,"",issuccess)
                }
        }
    }
    
    
    /**Changes the quantity of an item already in the cart
    *itemID String example latest/carts/itemID/items
    *@params cart {{
    "catalog_id": 0,
    "catalog_sku_id": 0,
    "quantity": 0,
    "status": "",
    "affiliate_key": ""
    }}
    */
    open func changeItem(_ params:Dictionary<String,String>,itemID:String,callback:@escaping (AnyObject,String,Bool)->Void)
    {
        let endpoint=NSString(format: JSAPIConstant.CARTITEMS as NSString,itemID)
        let methodurl:String=JsapiAPi.sharedInstance.getJsapiUrl()+(endpoint as String)

        JsapiRest.sharedInstance.putRequest(methodurl,postParams: Utilities.jsonRequestFromDictionary(params),isJson:true)
            {
                (result:NSDictionary,issuccess:Bool) in
                let baseResponse=BaseResponse(fromDictionary: result)
                if(!issuccess)
                {
                    callback(baseResponse,baseResponse.errormessage,issuccess)
                }else
                {
                    callback(baseResponse,"",issuccess)
                }
        }
    }

    
    
    
    /**Add virtual currency item to cart
    *itemID String example /services/latest/carts/itemID/items
    *@params cart {{
    "catalog_id": 0,
    "catalog_sku_id": 0,
    "quantity": 0,
    "status": "",
    "affiliate_key": ""
    }}
    */
    open func addCartItems(_ params:Dictionary<String,String>,itemID:String,callback:@escaping (AnyObject,String,Bool)->Void)
    {
        let endpoint=NSString(format: JSAPIConstant.CARTITEMS as NSString,itemID)
        let methodurl:String=JsapiAPi.sharedInstance.getJsapiUrl()+(endpoint as String)

        JsapiRest.sharedInstance.postrequest(methodurl,postParams: Utilities.jsonRequestFromDictionary(params),isJson:true)
            {
                (result:NSDictionary,issuccess:Bool) in
                let baseResponse=BaseResponse(fromDictionary: result)
                if(!issuccess)
                {
                    callback(baseResponse,baseResponse.errormessage,issuccess)

                }else
                {
                    callback(baseResponse,"",issuccess)
                }
        }
    }
    
    
    
    /**Modifies or sets the order shipping address
    *itemID String example services/latest/carts/itemID/shipping-address
    @params
    "name_prefix": "",
    "first_name": "",
    "last_name": "",
    "shipping_address_line1": "",
    "shipping_address_line2": "",
    "city": "",
    "postal_state_id": 0,
    "zip": "",
    "email": "",
    "country_id": 0,
    "phone_number": "",
    "order_notes": ""
       */
    open func modifyShippingAddress(_ params:Dictionary<String,String>,itemID:String,callback:@escaping (AnyObject,String,Bool)->Void)
    {
        let endpoint=NSString(format: JSAPIConstant.SHIPPINGADDRESS as NSString,itemID)
        let methodurl:String=JsapiAPi.sharedInstance.getJsapiUrl()+(endpoint as String)

        JsapiRest.sharedInstance.putRequest(methodurl,postParams: Utilities.jsonRequestFromDictionary(params),isJson:true)
            {
                (result:NSDictionary,issuccess:Bool) in
                let shippingResponse=BaseResponse(fromDictionary: result)
                if(!issuccess)
                {
                    callback(shippingResponse,shippingResponse.errormessage,issuccess)
                }else
                {
                    callback(shippingResponse,"",issuccess)
                }
        }
    }
    
    /**Returns whether a cart requires shipping
    *itemID String example services/latest/carts/5145/shippable
    @params
    */
    open func checkShippable(_ params:Dictionary<String,String>,itemID:String,callback:@escaping (Shippable,String,Bool)->Void)
    {
        let endpoint=NSString(format: JSAPIConstant.SHIPPABLE as NSString,itemID)
        let methodurl:String=JsapiAPi.sharedInstance.getJsapiUrl()+(endpoint as String)
        print(methodurl)
        JsapiRest.sharedInstance.getRequest(methodurl,postParams: Utilities.getGETRequestFromDictionary(params as Dictionary<String, AnyObject>))
            {
                (result:NSDictionary,issuccess:Bool) in
                let shippable = ShippableResponse(fromDictionary: result)
                if(!issuccess)
                {
                    callback(Shippable(),shippable.errormessage,issuccess)
                }else
                {
                    callback(shippable.shippable,"",issuccess)
                }
        }
    }
    
    
}
