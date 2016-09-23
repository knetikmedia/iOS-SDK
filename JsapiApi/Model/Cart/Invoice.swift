//
//	Invoice.swift
//
//	Create by Youssef on 14/4/2015
//	Copyright © 2015. All rights reserved.
import Foundation

open class Invoice:NSObject{
    
    var address1 : AnyObject!
    var address2 : AnyObject!
    var billingAddress1 : AnyObject!
    var billingAddress2 : AnyObject!
    var billingCityName : AnyObject!
    var billingCountryName : AnyObject!
    var billingPostalCode : AnyObject!
    var billingStateName : AnyObject!
    var cartId : NSNumber!
    var cityName : AnyObject!
    var countryName : AnyObject!
    var createDate : String!
    var currency : String!
    var currentFulfillmentStatus : NSNumber!
    var currentFulfillmentStatusDescription : String!
    var currentFulfillmentStatusName : String!
    var currentStatus : NSNumber!
    var currentStatusDescription : String!
    var currentStatusName : String!
    var deleted : NSNumber!
    var discount : NSNumber!
    var email : AnyObject!
    var fedTax : NSNumber!
    var fullName : String!
    var grandTotal : NSNumber!
    var invoiceId : NSNumber!
    var namePrefix : AnyObject!
    var orderNotes : AnyObject!
    var parentInvoiceId : AnyObject!
    var phone : AnyObject!
    var phoneNumber : AnyObject!
    var postalCode : AnyObject!
    var shipping : NSNumber!
    var stateName : AnyObject!
    var stateTax : NSNumber!
    var subtotal : NSNumber!
    var updateDate : String!
    var userId : NSNumber!
    var vendorId : NSNumber!
    
    open func getAddress1 ()-> AnyObject{ return address1}
    open func getAddress2 ()-> AnyObject{ return address2}
    open func getBillingAddress1 ()-> AnyObject{ return billingAddress1}
    open func getBillingAddress2 ()-> AnyObject{ return billingAddress2}
    open func getBillingCityName ()-> AnyObject{ return billingCityName}
    open func getBillingCountryName ()-> AnyObject{ return billingCountryName}
    open func getBillingPostalCode ()-> AnyObject{ return billingPostalCode}
    open func getBillingStateName ()-> AnyObject{ return billingStateName}
    open func getCartId ()-> NSNumber{ return cartId}
    open func getCityName ()-> AnyObject{ return cityName}
    open func getCountryName ()-> AnyObject{ return countryName}
    open func getCreateDate ()-> String{ return createDate}
    open func getCurrency ()-> String{ return currency}
    open func getCurrentFulfillmentStatus ()-> NSNumber{ return currentFulfillmentStatus}
    open func getCurrentFulfillmentStatusDescription ()-> String { return currentFulfillmentStatusDescription}
    open func getCurrentFulfillmentStatusName ()-> String{ return currentFulfillmentStatusName}
    open func getCurrentStatus ()-> NSNumber{ return currentStatus}
    open func getCurrentStatusDescription ()-> String{ return currentStatusDescription}
    open func getCurrentStatusName ()-> String{ return currentStatusName}
    open func getDeleted ()-> NSNumber{ return deleted}
    open func getDiscount ()-> NSNumber{ return discount}
    open func getemail ()-> AnyObject{ return email}
    open func getFedTax ()-> NSNumber{ return fedTax}
    open func getFullName ()-> String{ return fullName}
    open func getGrandTotal ()-> NSNumber{ return grandTotal}
    open func getId ()-> NSNumber{ return invoiceId}
    open func getNamePrefix ()-> AnyObject{ return namePrefix}
    open func getOrderNotes ()-> AnyObject{ return orderNotes}
    open func getParentInvoiceId ()-> AnyObject{ return parentInvoiceId}
    open func getPhone ()-> AnyObject{ return phone}
    open func getPhoneNumber ()-> AnyObject{ return phoneNumber}
    open func getPostalCode ()-> AnyObject{ return postalCode}
    open func getShipping ()-> NSNumber{ return shipping}
    open func getStateName ()-> AnyObject{ return stateName}
    open func getStateTax ()-> NSNumber{ return stateTax}
    open func getSubtotal ()-> NSNumber{ return subtotal}
    open func getUpdateDate ()-> String{ return updateDate}
    open func getUserId ()-> NSNumber{ return userId}
    open func getVendorId ()-> NSNumber{ return vendorId}

    /**
    * Instantiate the instance using the passed dictionary values to set the properties values
    */
    init(fromDictionary dictionary: NSDictionary){
        address1 = dictionary["address1"] as AnyObject!
        address2 = dictionary["address2"] as AnyObject!
        billingAddress1 = dictionary["billing_address1"] as AnyObject!
        billingAddress2 = dictionary["billing_address2"] as AnyObject!
        billingCityName = dictionary["billing_city_name"] as AnyObject!
        billingCountryName = dictionary["billing_country_name"] as AnyObject!
        billingPostalCode = dictionary["billing_postal_code"] as AnyObject!
        billingStateName = dictionary["billing_state_name"] as AnyObject!
        cartId = dictionary["cart_id"] as? NSNumber
        cityName = dictionary["city_name"] as AnyObject!
        countryName = dictionary["country_name"] as AnyObject!
        createDate = dictionary["create_date"] as? String
        currency = dictionary["currency"] as? String
        currentFulfillmentStatus = dictionary["current_fulfillment_status"] as? NSNumber
        currentFulfillmentStatusDescription = dictionary["current_fulfillment_status_description"] as? String
        currentFulfillmentStatusName = dictionary["current_fulfillment_status_name"] as? String
        currentStatus = dictionary["current_status"] as? NSNumber
        currentStatusDescription = dictionary["current_status_description"] as? String
        currentStatusName = dictionary["current_status_name"] as? String
        deleted = dictionary["deleted"] as? NSNumber
        discount = dictionary["discount"] as? NSNumber
        email = dictionary["email"] as AnyObject!
        fedTax = dictionary["fed_tax"] as? NSNumber
        fullName = dictionary["full_name"] as? String
        grandTotal = dictionary["grand_total"] as? NSNumber
        invoiceId = dictionary["id"] as? NSNumber
        namePrefix = dictionary["name_prefix"] as AnyObject!
        orderNotes = dictionary["order_notes"] as AnyObject!
        parentInvoiceId = dictionary["parent_invoice_id"] as AnyObject!
        phone = dictionary["phone"] as AnyObject!
        phoneNumber = dictionary["phone_number"] as AnyObject!
        postalCode = dictionary["postal_code"] as AnyObject!
        shipping = dictionary["shipping"] as? NSNumber
        stateName = dictionary["state_name"] as AnyObject!
        stateTax = dictionary["state_tax"] as? NSNumber
        subtotal = dictionary["subtotal"] as? NSNumber
        updateDate = dictionary["update_date"] as? String
        userId = dictionary["user_id"] as? NSNumber
        vendorId = dictionary["vendor_id"] as? NSNumber
    }
    
}
