//
//  AppDelegate.swift
//  MenuBar
//
//  Created by AlphaTest on 16/5/10.
//  Copyright © 2016年 AlphaTest. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    let statusItem = NSStatusBar.systemStatusBar().statusItemWithLength(NSVariableStatusItemLength)
//    let menu = NSMenu()
    
    let popover = NSPopover()
    
    var eventMonitor : EventMonitor?

    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
        
        if let button = statusItem.button {
            button.image = NSImage(named : "note")
            button.action = #selector(AppDelegate.toggleWeather(_:))
        }
//        menu.addItem(NSMenuItem(title: "Show Weather", action: #selector(AppDelegate.showWeather(_:)), keyEquivalent: "S"))
//        menu.addItem(NSMenuItem.separatorItem())
//        menu.addItem(NSMenuItem(title: "Quit", action: Selector("terminate:"), keyEquivalent: "q"))
//    
//        statusItem.menu = menu
        
        popover.contentViewController = ViewController.loadFromNib()
        
        eventMonitor = EventMonitor(mask: [.LeftMouseUpMask, .RightMouseUpMask], handler: { (event) in
            if self.popover.shown {
                // close
                self.closePopover(event)
            }
        })
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }

    
    func showWeather(sender : NSStatusBarButton) {
        print("menu")
    }
    
    
    func closePopover(sender: AnyObject?) {
        
        popover.performClose(sender)
        eventMonitor?.stop()
    }
    
    func showPopover(sender: AnyObject)  {
        if let button = statusItem.button {
            popover.showRelativeToRect(button.bounds, ofView: button, preferredEdge: .MinY)
        }
        eventMonitor?.start()
    }
    
    func toggleWeather(sender : NSStatusBarButton) {
        if popover.shown {
            closePopover(sender)
        }else{
            showPopover(sender)
        }
    }

}

