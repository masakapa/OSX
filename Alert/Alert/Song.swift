//
//  Song.swift
//  Alert
//
//  Created by AlphaTest on 16/6/27.
//  Copyright © 2016年 AlphaTest. All rights reserved.
//

import Foundation

class Song: NSObject {
    var title : String
    var author : String
    var duration: Double
    
    init(title: String, author: String, duration: Double) {
        self.title = title
        self.author = author
        self.duration = duration
    }
}