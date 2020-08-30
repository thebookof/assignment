//
//  TranslationRequest.swift
//  MyFunTranslations
//
//  Created by admin on 2020/08/27.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

struct TranslationRequest {
    let url: URL
    
    init(translationType: String, translationText: String) {
        let requestString = "https://api.funtranslations.com/translate/\(translationType).json?text=\(translationText)"
        guard let requestURL = URL(string: requestString) else {fatalError()}
        
        self.url = requestURL
    }
    
    func getTranslation(completion: @escaping(Result<String, TranslationError>) -> Void) {
        let dataTask = URLSession.shared.dataTask(with: url) {data, _, error in
            if error == nil {
                guard let jsonContent = data else {
                    completion(.failure(.noDataAvailable))
                    return
                }
                
                do {
                    let contentData = try JSONDecoder().decode(ContentData.self, from: jsonContent)
                    let translatedData = contentData.translated
                    completion(.success(translatedData))
                } catch{
                    completion(.failure(.cannotProcessData))
                }
            }
        }
        dataTask.resume()
    }
}
