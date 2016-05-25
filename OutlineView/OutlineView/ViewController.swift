//
//  ViewController.swift
//  OutlineView
//
//  Created by AlphaTest on 16/5/22.
//  Copyright © 2016年 AlphaTest. All rights reserved.
//

import Cocoa

class ViewController: NSViewController, NSOutlineViewDelegate, NSOutlineViewDataSource {
    
    @IBOutlet weak var outlineView: NSOutlineView!
    @IBOutlet var treeController: NSTreeController!

    override func viewDidLoad() {
        super.viewDidLoad()

        addData()
        outlineView.expandItem(nil, expandChildren: true)
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    func addData()  {
        let root = [
            "name" : "Library",
            "isLeaf" : false
        ]
        
        let dict : NSMutableDictionary = NSMutableDictionary(dictionary: root)
        dict.setObject([Playlist(),Playlist()], forKey: "children")
        treeController.addObject(dict)
        
    }
    
    func isHeader(item: AnyObject) -> Bool {
        if let item = item as? NSTreeNode {
            return !(item.representedObject is Playlist)
        }
        return !(item is Playlist)
    }
    
    
    // MARK: - delegate
    
    func outlineView(outlineView: NSOutlineView, viewForTableColumn tableColumn: NSTableColumn?, item: AnyObject) -> NSView? {
        if isHeader(item) {
            return outlineView.makeViewWithIdentifier("HeaderCell", owner: self)
        }else {
            return outlineView.makeViewWithIdentifier("DataCell", owner: self)
        }
    }
    
    

}


