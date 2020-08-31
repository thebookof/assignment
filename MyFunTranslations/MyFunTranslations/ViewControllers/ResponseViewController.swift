//
//  ResponseController.swift
//  MyFunTranslations
//
//  Created by admin on 2020/08/30.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class ResponseViewContoller: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var requestString: String?
    var translatedText: String?
    
    let translationRequest = TranslationRequest()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "My Fun Translations!"
        activityIndicator.startAnimating()
        translationRequest.getTranslation(requestString: requestString!) {[weak self] result, translatedText in
            if result {
                self?.translatedText = translatedText!
                self?.tableView.reloadData()
                self?.activityIndicator.stopAnimating()
                self?.activityIndicator.hidesWhenStopped = true
            }
        }
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.backgroundColor = .green
        cell.textLabel?.text = translatedText
        
        return cell
    }
}
