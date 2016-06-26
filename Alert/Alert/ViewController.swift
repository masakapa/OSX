//
//  ViewController.swift
//  Alert
//
//  Created by AlphaTest on 16/6/25.
//  Copyright © 2016年 AlphaTest. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func viewWillAppear() {
        alert()
    }
    
    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    
    func alert() {
        let alert = NSAlert()
        alert.messageText = "Aerte message"
        alert.informativeText = "测试消息"
        alert.addButtonWithTitle("Defult")
        alert.addButtonWithTitle("知道了")
        alert.addButtonWithTitle("好吧")
        
        alert.beginSheetModalForWindow(view.window!) { (response) in
            print(response)
        }
        
//        let result = alert.runModal()
//        
//        switch result {
//        case NSAlertFirstButtonReturn:
//            print(String(NSAlertFirstButtonReturn))
//        case NSAlertSecondButtonReturn:
//            print(String(NSAlertSecondButtonReturn))
//        case NSAlertThirdButtonReturn:
//            print(String(NSAlertThirdButtonReturn))
//        default:
//            break
//        }
        
    }
    

}

