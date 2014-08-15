//
//  HttpHelper.swift
//  Mayfly
//
//  Created by Atul Nigam on 8/3/14.
//  Copyright (c) 2014 Kushal Nigam. All rights reserved.
//

import Foundation


protocol HTTPHelperDelegate{
    
    func didReceiveHTTPResponseResults(results: NSDictionary) 
    
}


class HTTPHelper{
    
    init(){}
    
    class func httpPostJSON(uri: String, data:NSDictionary, delegate: HTTPHelperDelegate? ){
        
        let url: NSURL = NSURL(string: uri)
        
        var request = NSMutableURLRequest(URL:  url)
        
        var err: NSError?
        
        request.HTTPMethod = "POST"
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.HTTPBody = NSJSONSerialization.dataWithJSONObject(data, options: nil, error: &err)
        
        if(err?) {
            // If there is an error parsing JSON, print it to the console
            println("Error in creating dataWithJSONObject:  \(err!.localizedDescription)")
        }
        
        var session = NSURLSession.sharedSession()
        
        var task = session.dataTaskWithRequest(request, completionHandler: {data, response, error-> Void
            in
            println("Response: \(response)")
            var strData = NSString(data: data, encoding: NSUTF8StringEncoding)
            println("Body: \(strData)")
            var responseError: NSError?
            var response = NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers, error: &responseError) as NSDictionary
            
            if(responseError?) {
                // If there is an error parsing JSON, print it to the console
                println("Error in creating JSONObjectWithData: \(responseError!.localizedDescription)")
            } else {
                println("Response received successfully \(response.debugDescription)")
            }
            // Now send the JSAON result to our delegate object
            delegate?.didReceiveHTTPResponseResults(response)
            })
        task.resume()
        
    }
    
    class func httpGet(uri: String, delegate: HTTPHelperDelegate? ){
        
        let url: NSURL = NSURL(string: uri)
        
        var request = NSMutableURLRequest(URL:  url)
        
        var err: NSError?
        
        request.HTTPMethod = "GET"
        
        var session = NSURLSession.sharedSession()
        
        var task = session.dataTaskWithRequest(request, completionHandler: {data, response, error-> Void
            in
            println("Response: \(response)")
            var strData = NSString(data: data, encoding: NSUTF8StringEncoding)
            println("Body: \(strData)")
            var responseError: NSError?
            
            var response = NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers, error: &responseError) as NSDictionary
            
            if(responseError?) {
                // If there is an error parsing JSON, print it to the console
                println("Error in creating JSONObjectWithData: \(responseError!.localizedDescription)")
            } else {
                println("Response received successfully \(response.debugDescription)")
            }
            // Now send the JSAON result to our delegate object
            delegate?.didReceiveHTTPResponseResults(response)
            })
        task.resume()
        
    }

    
    class func httpDelete(uri: String, delegate: HTTPHelperDelegate? ){
        
        let url: NSURL = NSURL(string: uri)
        
        var request = NSMutableURLRequest(URL:  url)
        
        var err: NSError?
        
        request.HTTPMethod = "DELETE"
        
        var session = NSURLSession.sharedSession()
        
        var task = session.dataTaskWithRequest(request, completionHandler: {data, response, error-> Void
            in
            println("Response: \(response)")
            var strData = NSString(data: data, encoding: NSUTF8StringEncoding)
            println("Body: \(strData)")
            var responseError: NSError?
            
            var response = NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers, error: &responseError) as NSDictionary
            
            if(responseError?) {
                // If there is an error parsing JSON, print it to the console
                println("Error in creating JSONObjectWithData: \(responseError!.localizedDescription)")
            } else {
                println("Response received successfully \(response.debugDescription)")
            }
            // Now send the JSAON result to our delegate object
            delegate?.didReceiveHTTPResponseResults(response)
            })
        task.resume()
        
    }
    
    
}



