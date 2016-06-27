//
//  ViewController.swift
//  Alert
//
//  Created by AlphaTest on 16/6/25.
//  Copyright © 2016年 AlphaTest. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var label: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    override func viewWillAppear() {
    }
    
    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    @IBAction func showAlert(sender: NSButton) {
        alert()
    }

    
    func alert() {
        let alert = NSAlert()
        alert.messageText = "Aerte message"
        alert.informativeText = "测试消息"
        alert.addButtonWithTitle("Defult")
        alert.addButtonWithTitle("知道了")
        alert.addButtonWithTitle("好吧")
        
        alert.beginSheetModalForWindow(view.window!) { (response) in
                    switch response {
                    case NSAlertFirstButtonReturn:
                        self.label.stringValue = String(NSAlertFirstButtonReturn)
                        print("好吧")
                    case NSAlertSecondButtonReturn:
                        self.label.stringValue = String(NSAlertSecondButtonReturn)
                    case NSAlertThirdButtonReturn:
                        self.label.stringValue = String(NSAlertThirdButtonReturn)
                    default:
                        break
                    }
        }
        
//        let result = alert.runModal()
//        

        
    }
    

}

