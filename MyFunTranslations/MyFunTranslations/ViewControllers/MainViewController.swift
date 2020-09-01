//
//  ViewController.swift
//  MyFunTranslations
//
//  Created by admin on 2020/08/26.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextViewDelegate {
    
    @IBOutlet weak var translationPicker: UIPickerView!
    @IBOutlet weak var textView: UITextView!
    
    let translationPickerDataModel = TranslationPickerDataModel()
    
    var translationType: String? = SelectedTranslationType(rawValue: 0)?.translateCaseString
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.textView.delegate = self
        self.translationPicker.delegate = self
        self.translationPicker.dataSource = self
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.translationPickerDataModel.translationPickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.translationPickerDataModel.translationPickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if let selectedTranslationType = SelectedTranslationType(rawValue: row) {
            translationType = selectedTranslationType.translateCaseString
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
    
    @IBAction func translateTapped(_ sender: UITextView){
        guard let textToTranslate = textView.text else { return }
        let translatedText = textToTranslate.replacingOccurrences(of: " ", with: "%20")
        let requestString = "https://api.funtranslations.com/translate/\(translationType!).json?text=\(translatedText)"
        let responseController = self.storyboard?.instantiateViewController(withIdentifier: "ResponseViewController") as! ResponseViewContoller
        responseController.requestString = requestString
        
        self.navigationController?.pushViewController(responseController, animated: true)
    }
}

enum SelectedTranslationType: Int {
    case us2uk = 0
    case uk2us
    case morse
    case oldenglish
    case shakespeare
    case piglatin
    case dothraki
    case yoda
    case sith
    case vulcan
    case klingon
    
    var translateCaseString: String {
        get {return String(describing: self)}
    }
}
