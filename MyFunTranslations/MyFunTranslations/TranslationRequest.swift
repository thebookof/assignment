//
//  TranslationRequest.swift
//  MyFunTranslations
//
//  Created by admin on 2020/08/27.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

struct TranslationRequest {
    let resourceURL:URL
    
    init(translationType:String,translationText:String) {
        let requestString = "https://api.funtranslation.com/translate/\(translationType).json?text=\(translationText)"
        guard let resourceURL = URL(string: requestString) else {fatalError()}
        
        self.resourceURL = resourceURL
    }
    
    func getTranslation(completion: @escaping(Result<String, TranslationError>) -> Void) {
        let dataTask = URLSession.shared.dataTask(with: resourceURL) {data, _, _ in
            guard let jsonContent = data else {
                completion(.failure(.noDataAvailable))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let contentData = try decoder.decode(ContentData.self, from: jsonContent)
                let translatedData = contentData.translated
                completion(.success(translatedData))
            } catch{
                completion(.failure(.cannotProcessData))
            }
        }
        dataTask.resume()
    }
}
