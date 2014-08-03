//
//  NewEventViewController.swift
//  Mayfly
//
//  Created by Kushal Nigam on 8/1/14.
//  Copyright (c) 2014 Kushal Nigam. All rights reserved.
//

import UIKit

class NewEventViewController: UIViewController {
    //UI References
    
    var event: EventModel = EventModel(id: 0)
    
    @IBOutlet var nameTextField: UITextField
    @IBOutlet var descriptionTextField: UITextField
    @IBOutlet var locationTextField: UITextField
    @IBOutlet var minTextField: UITextField
    @IBOutlet var maxTextField: UITextField
    @IBOutlet var startTimeTextField: UITextField  //Change to UIDatePicker
    @IBOutlet var endTimeTextField: UITextField    //Change to UIDatePicker
    @IBOutlet var openToggle: UISwitch
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func createOnClick(sender: AnyObject) {
        if validateLabels() && createEvent(){
            //navegate to viewcontroller for the created event
        }
    }
    
    @IBAction func openOnToggle(sender: AnyObject) {
        event.open = openToggle.on
    }
    
    @IBAction func viewTapped(sender: AnyObject) {
        self.view.endEditing(true)
    }
    
    func validateLabels() -> Bool{
        var cont: Bool = true
        var error:String = ""
        
        let name: String = self.nameTextField.text
        let description: String = self.descriptionTextField.text
        let location: String = self.locationTextField.text
        let min: Int = minTextField.text.isEmpty ? -1 : Int(minTextField.text.bridgeToObjectiveC().intValue)
        let max: Int = maxTextField.text.isEmpty ? -1 : Int(maxTextField.text.bridgeToObjectiveC().intValue)
        let startTime: String = startTimeTextField.text
        let endTime: String = endTimeTextField.text
        
        if (min > max && max > -1) {
            cont = false
            error = "minimum attendees must be smaller than maximum"
        }
        if (countElements(description) > 255) {
            cont = false
            error = "description is too long"
        }
        if endTime.isEmpty {
            cont = false
            error = "please select end time"
        }
        if startTime.isEmpty {
            cont = false
            error = "please select start time"
        }
        if location.isEmpty {
            cont = false
            error = "please specify a location"
        }
        if name.isEmpty {
            cont = false
            error = "please specify the event name"
        }
        
        if !cont {
            var alert: UIAlertView = UIAlertView()
            alert.title = "Error creating event"
            alert.message = error
            alert.addButtonWithTitle("Ok")
            alert.show()
        }
        else {
            event.name = name
            event.eventDescription = description
            event.startTime = startTime
            event.endTime = endTime
            event.location = location
            event.min = min
            event.max = max
        }
        return cont
    }
    
    func createEvent() -> Bool {
        var error: String = ""
        
        //send event to server here
        var success: Bool = true
        
        if success {
            return true
        }
        else {
            var alert: UIAlertView = UIAlertView()
            alert.title = "Error creating event"
            alert.message = error
            alert.addButtonWithTitle("Ok")
            alert.show()
            return false
        }
    }
}