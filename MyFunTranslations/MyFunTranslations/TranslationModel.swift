//
//  Translation.swift
//  MyFunTranslations
//
//  Created by admin on 2020/08/26.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

struct ContentData:Decodable {
    var translated:String
}

enum TranslationError:Error {
    case noDataAvailable
    case cannotProcessData
}
