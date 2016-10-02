//
//  Constant.swift
//  Repz
//
//  Created by Dustin Allen on 8/22/16.
//  Copyright © 2016 Harloch. All rights reserved.
//

import Foundation
import UIKit

enum IconType {
    case Cross
    case Circle
    case Square
}
struct K {
    struct KeyValue {
        static let LayoutName = "LAYOUT_NAME_"
        static let shapeLayerName = "shapeLayer"
    }
}

//That Will maintain ratio proportion for diffrent devices

let baseWidth:CGFloat  = 1024.0
let baseHeight:CGFloat = 1366.0

var YR:CGFloat = {
    let Ratio = UIScreen.mainScreen().bounds.width/baseWidth
    return CGFloat(Ratio)
}()
var XR:CGFloat = {
    let Ratio = UIScreen.mainScreen().bounds.height/baseHeight
    return CGFloat(Ratio)
}()


//extension _ArrayType where Generator.Element == CGPoint {
//    var convertPoints: [CGPoint] {
//        return flatMap{ Double($0) }
//    }
////    var floatArray: [Float] {
////        return flatMap{ Float($0) }
////    }
//}

//convert points
extension CGPoint {
    func ConvertCGPoint() -> CGPoint {
        var newPoint = CGPointZero
        newPoint.x = (self.x != 0) ? self.x * XR : 0
        newPoint.y = (self.y != 0) ? self.y * YR : 0
        return newPoint
    }
}
extension CollectionType where Generator.Element == CGPoint {
    /// Return a copy of `self` with its elements shuffled
    func convertPoints() -> [CGPoint] {
        if var list1 = self as? Array<CGPoint>
        {
            var index = 0
            //var list:Array<CGPoint> = []
            
            for point in list1 {
                print(point)
                var newPoint = CGPointZero
                newPoint = point.ConvertCGPoint()
                print(newPoint)
                list1[index] = newPoint
                index += 1
            }
            return list1
        }
        //list.shuffleInPlace()
        return self as! Array<CGPoint>
    }
}

extension MutableCollectionType where Index == Int {
    /// Shuffle the elements of `self` in-place.
    mutating func shuffleInPlace() {
        // empty and single-element collections don't shuffle
        if count < 2 { return }
        
        for i in 0..<count - 1 {
            let j = Int(arc4random_uniform(UInt32(count - i))) + i
            guard i != j else { continue }
            swap(&self[i], &self[j])
        }
    }
    
    mutating func convertPointsMutable() -> [Generator.Element] {
        if let list1 = self as? Array<CGPoint> {
            var index = 0
            for point in list1 {
                print(point)
                var newPoint = CGPointZero
                newPoint = point.ConvertCGPoint()
                print(newPoint)
                //self[1] = newPoint
                index += 1
            }
        }
        let list = Array(self)
        //list.shuffleInPlace()
        return list
    }
}