//
//  KeyboardPicker.Swift
//
//  Created by Bhavesh Patel on 15/04/2016.
//

import UIKit
class KeyboardPicker: UIPickerView, UIPickerViewDelegate, UIPickerViewDataSource {

    var Values : [String]!
    var RowSelected: Int = 0 {
        didSet {
            selectRow(RowSelected-1, inComponent: 0, animated: false)
            let Val = Values[self.selectedRowInComponent(0)]
            if let block = onDateSelected {
                block(Value: Val)
            }
        }
    }
    var onDateSelected: ((Value: String) -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        RowSelected = 0
        self.backgroundColor = UIColor.whiteColor()
        self.delegate = self
        self.dataSource = self
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // Mark: UIPicker Delegate / Data Source
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return Values[row]
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Values.count
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let Val = Values[self.selectedRowInComponent(0)]
        RowSelected = self.selectedRowInComponent(0)+1
        if let block = onDateSelected {
            block(Value: Val)
        }
    }
    deinit
    {
        NSLog("bsjb")
    }
}

