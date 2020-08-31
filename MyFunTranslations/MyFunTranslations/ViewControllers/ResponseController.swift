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
      
        translationRequest.getTranslation(requestString: requestString!) {[weak self] result, error in
           if result {
               self?.tableView.reloadData()
           } else {
               let alert = UIAlertController( title: "Error", message: error, preferredStyle: .alert)
               alert.addAction(UIAlertAction(title:"OK", style:.default, handler: nil))
               self?.present(alert, animated: true, completion: nil)
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
        //Possible unwrapping of nil optional - find out how to handle
        cell.textLabel?.text = translationRequest.contentData.translated
        
        return cell
    }
}
