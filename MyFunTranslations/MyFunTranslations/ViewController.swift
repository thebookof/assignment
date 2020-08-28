//
//  ViewController.swift
//  MyFunTranslations
//
//  Created by admin on 2020/08/26.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextViewDelegate {
    
    @IBOutlet weak var picker:UIPickerView!
    @IBOutlet weak var textView:UITextView!
    
    var translationType = "morse"
    var translatedText = ""

    
    let pickerData = ["English to Morse", "Morse to English", "US to UK", "UK to US", "English to Shakespeare"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.picker.delegate = self
        self.picker.dataSource = self
        
        self.textView.delegate = self
    }
    
    //Picker Methods
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch row {
        case 0:
            translationType = "morse"
        case 1:
            translationType = "morse"
        case 2:
            translationType = "us2uk"
        case 3:
            translationType = "uk2us"
        case 4:
            translationType = "shakespeare"
        default:
            translationType = ""
        }
    }
    
    //TextView Methods
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
    
    //Button Methods
    @IBAction func translateTapped(_ sender: UITextView){
        guard let textToTranslated = textView.text else {return}
        let translationRequest = TranslationRequest(translationType: translationType, translationText: textToTranslated)
        
        translationRequest.getTranslation {[weak self] result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let text):
                print(text)
                self?.translatedText = text
            }
        }
    }
    

}

