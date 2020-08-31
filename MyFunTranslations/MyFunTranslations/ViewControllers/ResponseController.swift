//
//  ResponseController.swift
//  MyFunTranslations
//
//  Created by admin on 2020/08/30.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class ResponseContoller: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var requestString: String?
    
    let translationRequest = TranslationRequest()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "My Fun Translations!"
      
        translationRequest.getTranslation(requestString: requestString!) {[weak self] result, _ in
           if result {
               self?.tableView.reloadData()
           }
        }
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.backgroundColor = .green

        if let translatedData = translationRequest.contentData?.translated {
            cell.textLabel?.text = translatedData
        } else {
            // Hanlde error situation
            let alert = UIAlertController( title: "Error", message: "Unable to get translation", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title:"OK", style:.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
        return cell
    }
}
