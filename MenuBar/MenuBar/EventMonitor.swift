//
//  EventMonitor.swift
//  MenuBar
//
//  Created by AlphaTest on 16/5/22.
//  Copyright © 2016年 AlphaTest. All rights reserved.
//

import Cocoa


class EventMonitor {
    
    private var monitor: AnyObject?
    private var mask: NSEventMask
    private var handler : NSEvent? -> ()

    
    init(mask: NSEventMask, handler: NSEvent? ->()) {
        self.mask = mask
        self.handler = handler
    }


    deinit{
        stop()
    }
    
    func start()  {
        monitor = NSEvent.addGlobalMonitorForEventsMatchingMask(mask, handler: handler)
    }
    
    func stop()  {
        if monitor != nil {
            NSEvent.removeMonitor(monitor!)
            monitor = nil
        }
        
    }
}
