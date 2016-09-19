//
//  FishBarItem.swift
//  FishBarItem
//
//  Created by amaker on 16/4/15.
//  Copyright © 2016年 CocoaPods. All rights reserved.
//

import Foundation
import UIKit

public extension UINavigationItem{
    
    public  func setItemWithTitle(title:String,textColor:UIColor,size:CGFloat,type:ItemType) -> SwfitNaviItem {
        let item = SwfitNaviItem.itemWithTitle(title, textColor: textColor, fontSize: size, itemType: type)
        item.setItemWithNavigationItem(self, type: type)
        return item
    }
    
    public func setItemWithImage(imageName:String,size:CGSize,type:ItemType) -> SwfitNaviItem {
        let item = SwfitNaviItem.itemWithImage(imageName, size: size, type: type)
        item.setItemWithNavigationItem(self, type: type)
        return item
    }
    
    public func setItemWithCustomView(customView:UIView,type:ItemType) -> SwfitNaviItem {
        let item = SwfitNaviItem.itemWithCustomeView(customView, type: type)
        item.setItemWithNavigationItem(self, type: type)
        
        return item
    }
    
    
    
    
}