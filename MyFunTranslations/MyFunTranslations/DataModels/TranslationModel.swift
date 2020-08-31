//
//  Translation.swift
//  MyFunTranslations
//
//  Created by admin on 2020/08/26.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation

struct ContentData: Decodable {
    var contents: TranslatedData
}

struct TranslatedData: Decodable {
    var translated: String
}

