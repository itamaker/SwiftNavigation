//
//  FishNaviItem.swift
//  Pods
//
//  Created by amaker on 16/4/15.
//
//

import Foundation
import UIKit

public enum ItemType {
    case left,center,right
}

let Default_Offset:CGFloat =  10.0

let TitleViewSize = CGSizeMake(70, 30)//用NSString设置item时 item的尺寸

public class SwfitNaviItem: NSObject {
    
    public var fixBarItem:UIBarButtonItem?
    public var contentBarItem:UIButton?
    public var items:NSMutableArray?
    public var itemType:ItemType!
    public var customView:UIView?
    public var isCustomView:Bool?
    
      func initCustomItemWithType(type:ItemType,size:CGSize) {
        self.isCustomView = false
        self.itemType = type
        self.items = NSMutableArray()
        self.contentBarItem = UIButton(type: .Custom)
        self.contentBarItem?.frame = CGRectMake(0, 0, size.width, size.height)
        self.items?.addObject(self.contentBarItem!)
    }
    
    
      public static func itemWithTitle(title:String,textColor:UIColor,fontSize:CGFloat,itemType:ItemType) -> SwfitNaviItem{
        let item = SwfitNaviItem()
        item.initCustomItemWithType(itemType, size: TitleViewSize)
        item.setItemContetnWithType(itemType)
        item.contentBarItem?.setTitle(title, forState: .Normal)
        item.contentBarItem?.setTitleColor(textColor, forState: .Normal)
        item.contentBarItem?.titleLabel?.font = UIFont.systemFontOfSize(fontSize)
        return item
    }
    
    public static func itemWithImage(itemWithImage:String,size:CGSize,type:ItemType) -> SwfitNaviItem{
        let  item = SwfitNaviItem()
        item.initCustomItemWithType(type, size: size)
        item.setItemContetnWithType(type)
        item.contentBarItem?.setImage(UIImage(named: itemWithImage) , forState: .Normal)
        return item
    }
    
    
    public static func itemWithCustomeView(customView:UIView,type:ItemType) -> SwfitNaviItem{
        let item = SwfitNaviItem()
        item.initCustomItemWithType(type, size: customView.frame.size)
        item.isCustomView = true
        item.customView = customView
        customView.frame = (item.contentBarItem?.bounds)!
        item.contentBarItem?.addSubview(customView)
        item.setItemContetnWithType(type)
        return item
    }
    
    
    public func addTarget(target:AnyObject,selector:Selector,event:UIControlEvents){
        self.contentBarItem?.addTarget(target, action: selector, forControlEvents: event)
    }
    
    /**
     *设置item偏移量
     *@param offSet 正值向左偏，负值向右偏
     */
   public  func setOffset(offSet:CGFloat)  {
        if (self.isCustomView != nil) {
            var customViewFrame = self.customView?.frame
            customViewFrame?.origin.x = offSet
            self.customView?.frame = customViewFrame!
        }
        else{
            self.contentBarItem?.contentEdgeInsets = UIEdgeInsetsMake(0, offSet, 0, -offSet)
        }
        
        
    }
    
   public func setItemContetnWithType(type:ItemType){
        if type == .right {
            self.contentBarItem?.contentHorizontalAlignment = .Right
            self.setOffset(Default_Offset)
        }else if type == .left{
            self.contentBarItem?.contentHorizontalAlignment = .Left
            self.setOffset(Default_Offset)
        }
    }
    
    public func setItemWithNavigationItem(navigationItem:UINavigationItem,type:ItemType){
        if type == .center {
            navigationItem.titleView = self.contentBarItem
        }
        else if type == .left{
            navigationItem.setLeftBarButtonItem(UIBarButtonItem(customView: self.contentBarItem! ), animated: false)
            
        }
        else if type == .right{
            navigationItem.setRightBarButtonItem(UIBarButtonItem(customView: self.contentBarItem! ), animated: false)
        }
        
        
    }
    
    
    
    
    
    
}