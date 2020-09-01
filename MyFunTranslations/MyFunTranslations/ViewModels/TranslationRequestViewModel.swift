//
//  TranslationRequest.swift
//  MyFunTranslations
//
//  Created by admin on 2020/08/27.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

struct TranslationRequestViewModel {
    
    func getTranslation(requestString: String, completion: @escaping(Bool, String?) -> Void) {
        if let url = URL(string: requestString) {
            let dataTask = URLSession.shared.dataTask(with: url) {data, _, error in
                if error == nil {
                    guard let data = data else { return }
                    
                    do {
                        let contentData = try JSONDecoder().decode(ContentData.self, from: data)
                        let translatedText = contentData.contents.translated
                        DispatchQueue.main.async {
                            completion(true, translatedText)
                        }
                    } catch{
                        DispatchQueue.main.async {
                            completion(false, nil)
                        }
                    }
                }
            }
            dataTask.resume()
        } else {
            DispatchQueue.main.async {
                completion(false, nil)
            }
        }        
    }
}
