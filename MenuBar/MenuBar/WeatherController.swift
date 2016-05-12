//
//  WeatherController.swift
//  MenuBar
//
//  Created by AlphaTest on 16/5/12.
//  Copyright © 2016年 AlphaTest. All rights reserved.
//

import Cocoa

class WeatherController: NSViewController {
    
    
    class func loadFromNib() -> WeatherController{
        let storyBoard = NSStoryboard(name: "Main", bundle: nil)
        return storyBoard.instantiateControllerWithIdentifier("WeatherController") as! WeatherController
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
