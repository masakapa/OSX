//
//  SiderBarVC.swift
//  OSXCoding
//
//  Created by AlphaTest on 16/6/27.
//  Copyright © 2016年 miguo. All rights reserved.
//

import Cocoa

class SiderBarVC: NSViewController {

    @IBOutlet weak var button: NSButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    @IBAction func buttonTap(sender: NSButton) {
        
        let vc = NSStoryboard(name: "Main", bundle: nil).instantiateControllerWithIdentifier("Popover") as! NSViewController
        
        let popover = NSPopover()
        popover.contentViewController = vc
        popover.behavior = .Transient
        popover.showRelativeToRect(button.bounds, ofView: button, preferredEdge: .MaxX)
        
    }
}
