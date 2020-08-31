//
//  ViewController.swift
//  MyFunTranslations
//
//  Created by admin on 2020/08/26.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextViewDelegate {
    
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var textView: UITextView!
    
    var translationType = "morse"
    let pickerData = ["English to Morse", "Morse to English", "US to UK", "UK to US", "English to Shakespeare"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.textView.delegate = self
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
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if let selectedTranslationType = SelectedTranslationType(rawValue: row) {
            translationType = selectedTranslationType.name
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
    
    @IBAction func translateTapped(_ sender: UITextView){
        guard let textToTranslate = textView.text else { return }
        let translatedText = textToTranslate.replacingOccurrences(of: " ", with: "%20")
        let requestString = "https://api.funtranslations.com/translate/\(translationType).json?text=\(translatedText)"
        let responseController = self.storyboard?.instantiateViewController(withIdentifier: "ResponseViewController") as! ResponseViewContoller
        responseController.requestString = requestString
        
        self.navigationController?.pushViewController(responseController, animated: true)
    }
}

enum SelectedTranslationType: Int {
    case morse = 0
    case morse2english
    case us2uk
    case uk2us
    case shakespeare
    
    var name: String {
        get {return String(describing: self)}
    }
}
