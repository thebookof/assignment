//
//  ResponseController.swift
//  MyFunTranslations
//
//  Created by admin on 2020/08/30.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class ResponseViewContoller: UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var requestString: String?
    
    let translationRequestViewModel = TranslationRequestViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "My Fun Translations!"
        activityIndicator.startAnimating()
        translationRequestViewModel.getTranslation(requestString: requestString!) {[weak self] result, translatedText in
            if result {
                self?.activityIndicator.stopAnimating()
                self?.activityIndicator.hidesWhenStopped = true
                self?.textView.backgroundColor = .systemGreen
                self?.textView.text = translatedText!                
            }
        }
    }
}
