//
//  ViewController.swift
//  JBKeyboardPicker
//
//  Created by Bhavesh Patel on 15/06/16.
//  Copyright (c) 2016 Bhavesh Patel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var TextField1: UITextField!
    @IBOutlet weak var TextField2: UITextField!
    let Keyboardview = KeyboardPicker()
    override func viewDidLoad() {
        super.viewDidLoad()
        let numberToolbar = UIToolbar(frame: CGRectMake(0, 0, self.view.frame.size.width, 50))
        numberToolbar.barStyle = UIBarStyle.Default
        numberToolbar.items = [
            UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.Plain, target: self, action: "keyboardCancelButtonTapped"),
            UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil),
            UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.Plain, target: self, action: "keyboardDoneButtonTapped")]
        numberToolbar.sizeToFit()
        TextField1.inputAccessoryView = numberToolbar
        Keyboardview.Values = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
        TextField1.inputView = Keyboardview
        Keyboardview.RowSelected = 2
        Keyboardview.onDateSelected = { (Value: String) in
            self.TextField1.text = Value
        }
        TextField1.becomeFirstResponder()
       }
    func keyboardCancelButtonTapped()
    {
        TextField1.text = ""
        self.view.endEditing(true)
    }
    func keyboardDoneButtonTapped()
    {
        TextField1.text = Keyboardview.Values[Keyboardview.RowSelected-1]
        TextField2.becomeFirstResponder()
    }
}

