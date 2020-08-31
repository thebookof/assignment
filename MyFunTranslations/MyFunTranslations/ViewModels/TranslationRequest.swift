//
//  TranslationRequest.swift
//  MyFunTranslations
//
//  Created by admin on 2020/08/27.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

class TranslationRequest {
    
    func getTranslation(requestString: String, completion: @escaping(Bool, String?) -> Void) {
        if let url = URL(string: requestString) {
            let dataTask = URLSession.shared.dataTask(with: url) {data, _, error in
                if error == nil {
                    guard let data = data else { return }
                    
                    do {
                        //let jsonData = try JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                        let contentData = try JSONDecoder().decode(ContentData.self, from: data)
                        let translatedText = contentData.contents.translated
                        DispatchQueue.main.async {
                            completion(true, translatedText)
                        }
                    } catch{
                        DispatchQueue.main.async {
                            completion(false, "Error fetching data")
                        }
                    }
                }
            }
            dataTask.resume()
        } else {
            print("Something went wrong constructing the URL")
        }        
    }
}