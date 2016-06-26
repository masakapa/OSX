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
        outlineView.deselectRow(0)
        
        outlineView.registerForDraggedTypes([NSPasteboardTypeString])
        
    
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
        let p1 = Playlist()
        p1.name = "P1"
        let p2 = Playlist()
        p2.name = "P2"
        let p3 = Playlist()
        p3.name = "p3"
        dict.setObject([p1,p2,p3], forKey: "children")
        treeController.addObject(dict)
        
    }
    
    func isHeader(item: AnyObject) -> Bool {
        if let item = item as? NSTreeNode {
            return !(item.representedObject is Playlist)
        }
        return !(item is Playlist)
    }
    
    func outlineView(outlineView: NSOutlineView, shouldSelectItem item: AnyObject) -> Bool {
        return !isHeader(item)
    }
    
    func outlineView(outlineView: NSOutlineView, shouldShowOutlineCellForItem item: AnyObject) -> Bool {
        return !isHeader(item)
    }
    
    
    
    // MARK: - delegate
    
    func outlineView(outlineView: NSOutlineView, viewForTableColumn tableColumn: NSTableColumn?, item: AnyObject) -> NSView? {
        if isHeader(item) {
            return outlineView.makeViewWithIdentifier("HeaderCell", owner: self)
        }else {
            return outlineView.makeViewWithIdentifier("DataCell", owner: self)
        }
    }
    
    
    func outlineView(outlineView: NSOutlineView, isGroupItem item: AnyObject) -> Bool {
        return isHeader(true)
    }
    
    // MARK: - Datasource
    
    func outlineView(outlineView: NSOutlineView, pasteboardWriterForItem item: AnyObject) -> NSPasteboardWriting? {
        let pbItem = NSPasteboardItem()
        
        if let playList = ((item as? NSTreeNode)?.representedObject) as? Playlist {
            pbItem.setString(playList.name, forType: NSPasteboardTypeString)
            return pbItem
        }
        
        return nil
    }
    
    func outlineView(outlineView: NSOutlineView, validateDrop info: NSDraggingInfo, proposedItem item: AnyObject?, proposedChildIndex index: Int) -> NSDragOperation {
        let canDrag = index>=0 && item != nil
        if canDrag {
            return.Move
        }else{
            return .None
        }
        
    }
    
    
    func outlineView(outlineView: NSOutlineView, acceptDrop info: NSDraggingInfo, item: AnyObject?, childIndex index: Int) -> Bool {
        let pb = info.draggingPasteboard()
        let name = pb.stringForType(NSPasteboardTypeString)
        
        var sourcenode : NSTreeNode?
        
        if let item = item as? NSTreeNode where item.childNodes != nil {
            for node in item.childNodes! {
                if let playlist = node.representedObject as? Playlist {
                    if playlist.name == name {
                        sourcenode = node
                    }
                }
            }
        }
        if sourcenode == nil {
            return false
        }
        
        let fromIndexPath = treeController.selectionIndexPath
        
        let indexArr : [Int] = [0, index]
        let toIndexPath  = NSIndexPath(indexes: indexArr, length: 2)
        treeController.moveNode(sourcenode!, toIndexPath: toIndexPath)
        
        undoManager?.prepareWithInvocationTarget(self).reverse(sourcenode, fromIndexPath: fromIndexPath)
        undoManager?.setActionName("Mov")
        
        return true
    }
    
    
    func reverse(sourceNode : NSTreeNode?, fromIndexPath: NSIndexPath?) {
        treeController.moveNode(sourceNode!, toIndexPath: fromIndexPath!)
    }
    

}


