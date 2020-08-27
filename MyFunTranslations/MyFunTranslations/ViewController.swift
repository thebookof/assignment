//
//  ViewController.swift
//  MyFunTranslations
//
//  Created by admin on 2020/08/26.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var picker:UIPickerView!
    @IBOutlet weak var textField:UITextField!
    
    let pickerData = ["English to Morse", "Morse to English", "US to UK", "UK to US", "English to Shakespeare"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.picker.delegate = self
        self.picker.dataSource = self
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    

}

