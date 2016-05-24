//
//  Playlist.swift
//  OutlineView
//
//  Created by AlphaTest on 16/5/22.
//  Copyright © 2016年 AlphaTest. All rights reserved.
//

import Cocoa

class Playlist: NSObject {
    
    
    dynamic var name : String = "New Playlist"
    dynamic var creator : String = "User"

    func isLeaf() -> Bool {
        return true
    }
}
