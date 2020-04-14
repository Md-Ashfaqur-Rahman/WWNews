//
//  Articles.swift
//  WWNews
//
//  Created by Md Ashfaqur Rahman on 20/3/20.
//  Copyright © 2020 Md Ashfaqur Rahma. All rights reserved.
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
