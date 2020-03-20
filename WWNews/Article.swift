//
//  Article.swift
//  News Reader
//
//  Created by macOS Mojave on 18/5/19.
//  Copyright © 2019 macOS Mojave. All rights reserved.
//

import Foundation

struct Articles: Decodable {
    var articles: [Article]
}

struct Article: Decodable {
    var title: String?
    var description: String?
    var author: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?
    var content: String?
}
