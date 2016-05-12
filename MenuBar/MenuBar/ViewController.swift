//
//  ViewController.swift
//  MenuBar
//
//  Created by AlphaTest on 16/5/10.
//  Copyright © 2016年 AlphaTest. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    
    class func loadFromNib() -> WeatherController {
        let storyBoard = NSStoryboard(name: "MenuBar", bundle: nil)
        return storyBoard.instantiateControllerWithIdentifier("WeatherController") as! WeatherController
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

