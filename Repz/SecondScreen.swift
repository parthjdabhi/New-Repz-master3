//
//  SecondScreen.swift
//  Repz
//
//  Created by Dustin Allen on 8/14/16.
//  Copyright © 2016 Harloch. All rights reserved.
//

import Foundation
import UIKit
import BTNavigationDropdownMenu

class SecondScreen: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UINavigationControllerDelegate {
    
    let manager = IconManager.sharedManager()
    let kBaseTag = 1001
    // Below Half
    let CY:CGFloat = 650 //+ 64 //683
    
    var startPos:CGPoint = CGPointZero
    var endPos:CGPoint = CGPointZero
    var iconName:String = ""
    var iconCount:Int = 0
    var pickerDataSource:[String] = [];
    
    var isWantToShowSquarePlayer = true
    var squarePlayerIndex:Int = 0
    
    enum LayoutType {
        case LayoutType_1
        case LayoutType_2
    }
    
    var deltaBoolFirst:Bool = true
    var deltaBoolSecond:Bool = true
    var iconPosArr:[CGPoint]!
    
    var leftHashDefense: [CGPoint]!
    var rightHashDefense: [CGPoint]!
    var leftHashOffense: [CGPoint]!
    var rightHashOffense: [CGPoint]!
    var passOffense: [CGPoint]!
    var runOffense: [CGPoint]!
    var threeFourDefense: [CGPoint]!
    var fourThreeDefense: [CGPoint]!
    
    var leftHashOffenseSquare: [CGPoint]!
    var rightHashOffenseSquare: [CGPoint]!
    var passOffenseSquare: [CGPoint]!
    var runOffenseSquare: [CGPoint]!
    
    var leftHashRun: [CGPoint]!
    var rightHashRun: [CGPoint]!
    var leftHashPass: [CGPoint]!
    var rightHashPass: [CGPoint]!
    var leftHashThreeFour: [CGPoint]!
    var rightHashThreeFour: [CGPoint]!
    var leftHashFourThree: [CGPoint]!
    var rightHashFourThree: [CGPoint]!
    
    var leftHashRunSquare: [CGPoint]!
    var leftHashPassSquare: [CGPoint]!
    var rightHashRunSquare: [CGPoint]!
    var rightHashPassSquare: [CGPoint]!
    
    var isLayoutSaving:Bool = false
    var shapeLayer:CAShapeLayer = CAShapeLayer()
    
    var iconType:IconType!
    var iconTypeSquare:IconType!
    
    var iconCrossInitalPosArr:NSMutableArray = NSMutableArray()
    var iconCircleInitalPosArr:NSMutableArray = NSMutableArray()
    
    var leftHashBool = false
    var rightHashBool = false
    var runBool = false
    var passBool = false
    var threeFourBool = false
    var fourThreeBool = false
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet var nameField: UITextField!
    @IBOutlet weak var layoutName: UITextField!
    
    @IBOutlet var cover2: UIButton!
    @IBOutlet var cover3: UIButton!
    
    @IBOutlet var btnDefencePass: UIButton!
    @IBOutlet var btnDefenceRun: UIButton!
    @IBOutlet var btnOffence3x4: UIButton!
    @IBOutlet var btnOffence4x3: UIButton!
    
    @IBOutlet var downNumber: UILabel!
    @IBOutlet var slider: UISlider!
    @IBOutlet var btnCornerback: UIButton!
    @IBOutlet var btnBlitzer: UIButton!
    @IBOutlet var comingOut: UISlider!
    @IBOutlet var comingOutLabel: UILabel!
    
    var menuView: BTNavigationDropdownMenu!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        IconManager.isWantToSaveThisMode = true
        
        iconType = IconType.Cross
        iconTypeSquare = IconType.Square
        //nameField.text = iconName
        let screenSize = UIScreen.mainScreen().bounds.size
        print(screenSize)
        
        //For Set Default Value Generating Cover3 Mode
        iconPosArr = [CGPointMake(240,575),//0
            CGPointMake(770,575),//1
            CGPointMake(900,575),//2
            CGPointMake(1020,575),//3
            CGPointMake(640,420),//4
            CGPointMake(700,500),//5
            CGPointMake(820,500),//6
            CGPointMake(940,500),//7
            CGPointMake(1150,420),//8
            CGPointMake(1580,575),//9
            //CGPointMake(48,506),
            CGPointMake(1080,500),//10
            CGPointMake(900,600),//11
            CGPointMake(750,600),//12
            CGPointMake(800,600),//13
            CGPointMake(850,600),//14
            CGPointMake(950,600),//15
            CGPointMake(1000,600),//16
            CGPointMake(1050,600),//17
            CGPointMake(240,600),//18
            CGPointMake(1580,615),//19
            CGPointMake(850,655),//20
            CGPointMake(900,655),//21
        ]
        iconPosArr = iconPosArr.convertPoints()
        
        leftHashOffense = [
            CGPointMake(625,600),//12
            CGPointMake(675,600),//13
            CGPointMake(725,600),//14
            CGPointMake(825,600),//15
            CGPointMake(875,600),//16
            CGPointMake(925,600),//17
            CGPointMake(240,600),//18
            CGPointMake(1580,615),//19
            CGPointMake(725,655),//20
            CGPointMake(775,655),//21
        ]
        leftHashOffense = leftHashOffense.convertPoints()
        
        leftHashOffenseSquare = [
            CGPointMake(775,600),//11
        ]
        leftHashOffenseSquare = leftHashOffenseSquare.convertPoints()
        
        rightHashOffense = [
            CGPointMake(870,600),//12
            CGPointMake(920,600),//13
            CGPointMake(970,600),//14
            CGPointMake(1070,600),//15
            CGPointMake(1120,600),//16
            CGPointMake(1170,600),//17
            CGPointMake(240,600),//18
            CGPointMake(1580,615),//19
            CGPointMake(970,655),//20
            CGPointMake(1020,655),//21
        ]
        rightHashOffense = rightHashOffense.convertPoints()
        
        rightHashOffenseSquare = [
            CGPointMake(1020,600),//11
        ]
        rightHashOffenseSquare = rightHashOffenseSquare.convertPoints()
        
        leftHashDefense = [
            CGPointMake(240,575),//0
            CGPointMake(650,575),//1
            CGPointMake(775,575),//2
            CGPointMake(895,575),//3
            CGPointMake(540,420),//4
            CGPointMake(575,500),//5
            CGPointMake(695,500),//6
            CGPointMake(815,500),//7
            CGPointMake(1050,420),//8
            CGPointMake(1580,575),//9
            CGPointMake(955,500),//10
        ]
        leftHashDefense = leftHashDefense.convertPoints()
        
        rightHashDefense = [
            CGPointMake(240,575),//0
            CGPointMake(900,575),//1
            CGPointMake(1025,575),//2
            CGPointMake(1145,575),//3
            CGPointMake(740,420),//4
            CGPointMake(825,500),//5
            CGPointMake(945,500),//6
            CGPointMake(1065,500),//7
            CGPointMake(1250,420),//8
            CGPointMake(1580,575),//9
            CGPointMake(1205,500),//10
        ]
        rightHashDefense = rightHashDefense.convertPoints()
        
        passOffense = [
            CGPointMake(320,600),//12
            CGPointMake(800,600),//13
            CGPointMake(850,600),//14
            CGPointMake(950,600),//15
            CGPointMake(1000,600),//16
            CGPointMake(1500,600),//17
            CGPointMake(240,600),//18
            CGPointMake(1580,615),//19
            CGPointMake(850,655),//20
            CGPointMake(900,655),//21
        ]
        passOffense = passOffense.convertPoints()
        
        passOffenseSquare = [
            CGPointMake(900, 600)
        ]
        passOffenseSquare = passOffenseSquare.convertPoints()
        
        leftHashPass = [
            CGPointMake(320,600),//12
            CGPointMake(675,600),//13
            CGPointMake(725,600),//14
            CGPointMake(825,600),//15
            CGPointMake(875,600),//16
            CGPointMake(1500,600),//17
            CGPointMake(240,600),//18
            CGPointMake(1580,615),//19
            CGPointMake(725,655),//20
            CGPointMake(775,655),//21
        ]
        leftHashPass = leftHashPass.convertPoints()
        
        leftHashPassSquare = [
            CGPointMake(775, 600)
        ]
        leftHashPassSquare = leftHashPassSquare.convertPoints()
        
        rightHashPass = [
            CGPointMake(320,600),//12
            CGPointMake(925,600),//13
            CGPointMake(975,600),//14
            CGPointMake(1075,600),//15
            CGPointMake(1125,600),//16
            CGPointMake(1500,600),//17
            CGPointMake(240,600),//18
            CGPointMake(1580,615),//19
            CGPointMake(975,655),//20
            CGPointMake(1025,655),//21
        ]
        rightHashPass = rightHashPass.convertPoints()
        
        rightHashPassSquare = [
            CGPointMake(1025, 600)
        ]
        rightHashPassSquare = rightHashPassSquare.convertPoints()
        
        runOffense = [
            CGPointMake(750,600),//12
            CGPointMake(800,600),//13
            CGPointMake(850,600),//14
            CGPointMake(950,600),//15
            CGPointMake(1000,600),//16
            CGPointMake(1050,600),//17
            CGPointMake(240,600),//18
            CGPointMake(1580,615),//19
            CGPointMake(900,660),//20
            CGPointMake(900,630),//21
        ]
        runOffense = runOffense.convertPoints()
        
        runOffenseSquare = [
            CGPointMake(900, 600)
        ]
        runOffenseSquare = runOffenseSquare.convertPoints()
        
        leftHashRun = [
            CGPointMake(625,600),//12
            CGPointMake(675,600),//13
            CGPointMake(725,600),//14
            CGPointMake(825,600),//15
            CGPointMake(875,600),//16
            CGPointMake(925,600),//17
            CGPointMake(240,600),//18
            CGPointMake(1580,615),//19
            CGPointMake(775,660),//20
            CGPointMake(775,630),//21
        ]
        leftHashRun = leftHashRun.convertPoints()
        
        leftHashRunSquare = [
            CGPointMake(775, 600)
        ]
        leftHashRunSquare = leftHashRunSquare.convertPoints()
        
        rightHashRun = [
            CGPointMake(875,600),//12
            CGPointMake(925,600),//13
            CGPointMake(975,600),//14
            CGPointMake(1075,600),//15
            CGPointMake(1125,600),//16
            CGPointMake(1175,600),//17
            CGPointMake(240,600),//18
            CGPointMake(1580,615),//19
            CGPointMake(1025,660),//20
            CGPointMake(1025,630),//21
        ]
        rightHashRun = rightHashRun.convertPoints()
        
        rightHashRunSquare = [
            CGPointMake(1025, 600)
        ]
        rightHashRunSquare = rightHashRunSquare.convertPoints()
        
        threeFourDefense = [
            CGPointMake(240,575),//0
            CGPointMake(770,575),//1
            CGPointMake(900,575),//2
            CGPointMake(1020,575),//3
            CGPointMake(640,420),//4
            CGPointMake(700,500),//5
            CGPointMake(820,500),//6
            CGPointMake(940,500),//7
            CGPointMake(1150,420),//8
            CGPointMake(1580,575),//9
            CGPointMake(1080,500),//10
        ]
        threeFourDefense = threeFourDefense.convertPoints()
        
        leftHashThreeFour = [
            CGPointMake(240,575),//0
            CGPointMake(650,575),//1
            CGPointMake(775,575),//2
            CGPointMake(895,575),//3
            CGPointMake(540,420),//4
            CGPointMake(575,500),//5
            CGPointMake(695,500),//6
            CGPointMake(815,500),//7
            CGPointMake(1050,420),//8
            CGPointMake(1580,575),//9
            CGPointMake(955,500),//10
        ]
        leftHashThreeFour = leftHashThreeFour.convertPoints()
        
        rightHashThreeFour = [
            CGPointMake(240,575),//0
            CGPointMake(900,575),//1
            CGPointMake(1025,575),//2
            CGPointMake(1145,575),//3
            CGPointMake(740,420),//4
            CGPointMake(825,500),//5
            CGPointMake(945,500),//6
            CGPointMake(1065,500),//7
            CGPointMake(1250,420),//8
            CGPointMake(1580,575),//9
            CGPointMake(1205,500),//10
        ]
        rightHashThreeFour = rightHashThreeFour.convertPoints()
        
        fourThreeDefense = [
            CGPointMake(240,575),//0
            CGPointMake(770,500),//1
            CGPointMake(900,500),//2
            CGPointMake(1020,500),//3
            CGPointMake(640,420),//4
            CGPointMake(700,575),//5
            CGPointMake(820,575),//6
            CGPointMake(940,575),//7
            CGPointMake(1150,420),//8
            CGPointMake(1580,575),//9
            CGPointMake(1080,575),//10
        ]
        fourThreeDefense = fourThreeDefense.convertPoints()
        
        leftHashFourThree = [
            CGPointMake(240,575),//0
            CGPointMake(645,500),//1
            CGPointMake(775,500),//2
            CGPointMake(895,500),//3
            CGPointMake(540,420),//4
            CGPointMake(575,575),//5
            CGPointMake(695,575),//6
            CGPointMake(815,575),//7
            CGPointMake(1050,420),//8
            CGPointMake(1580,575),//9
            CGPointMake(955,575),//10
        ]
        leftHashFourThree = leftHashFourThree.convertPoints()
        
        rightHashFourThree = [
            CGPointMake(240,575),//0
            CGPointMake(895,500),//1
            CGPointMake(1025,500),//2
            CGPointMake(1145,500),//3
            CGPointMake(740,420),//4
            CGPointMake(825,575),//5
            CGPointMake(945,575),//6
            CGPointMake(1065,575),//7
            CGPointMake(1250,420),//8
            CGPointMake(1580,575),//9
            CGPointMake(1205,575),//10
        ]
        rightHashFourThree = rightHashFourThree.convertPoints()
        
        //First time we set all default values as a CGPoint
        let keyCount = getKeyCount()
        if keyCount == 0 {
            //Save end user name
            
            
            //  NSUserDefaults.standardUserDefaults().setValue("Icon Set 2", forKey: String(format: "%@%d", K.KeyValue.LayoutName, getKeyCount()))
            for iconPos in iconPosArr {
                iconCrossInitalPosArr.addObject(NSStringFromCGPoint(iconPos))
            }
            for iconPos in iconPosArr {
                iconCircleInitalPosArr.addObject(NSStringFromCGPoint(iconPos))
            }
            
            //Saving all cgpoints of the layout
            NSUserDefaults.standardUserDefaults().setValue("Cross Icon Set", forKey: String(format: "%@%d", K.KeyValue.LayoutName, getKeyCount()))
            NSUserDefaults.standardUserDefaults().setObject(iconCrossInitalPosArr, forKey: String(format: "KEY_%d", incrementKeyCount()))
            NSUserDefaults.standardUserDefaults().setInteger(IconType.Cross.hashValue, forKey: String(format: "ICON_TYPE_%d", getKeyCount()))
            
            NSUserDefaults.standardUserDefaults().setValue("Circle Icon Set", forKey: String(format: "%@%d", K.KeyValue.LayoutName, getKeyCount()))
            NSUserDefaults.standardUserDefaults().setObject(iconCircleInitalPosArr, forKey: String(format: "KEY_%d", incrementKeyCount()))
            NSUserDefaults.standardUserDefaults().setInteger(IconType.Circle.hashValue, forKey: String(format: "ICON_TYPE_%d", getKeyCount()))
            
            NSUserDefaults.standardUserDefaults().synchronize()
        }
        //Opening default LAyout
        openLayoutWithIndex(1)
        //Reload picker view with different layout
        for index in 0...(getKeyCount()-1) {
            let name = NSUserDefaults.standardUserDefaults().stringForKey(String(format: "%@%d", K.KeyValue.LayoutName, index))
            pickerDataSource.append(name!)
        }
        //pickerView.reloadAllComponents()
        
        self.title = "Pick Your Options"
        
        let items = ["Left Hash", "Right Hash", "Pass", "Run", "3x4", "4x3", "Left Blitzer", "Right Blitzer"]
        //self.selectedCellLabel.text = items.first
        self.navigationController?.navigationBar.translucent = false
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 0.0/255.0, green:180/255.0, blue:220/255.0, alpha: 1.0)
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        menuView = BTNavigationDropdownMenu(navigationController: self.navigationController, containerView: self.navigationController!.view, title: "Pick Your Options", items: items)
        menuView.cellHeight = 50
        menuView.cellBackgroundColor = self.navigationController?.navigationBar.barTintColor
        menuView.cellSelectionColor = UIColor(red: 0.0/255.0, green:160.0/255.0, blue:195.0/255.0, alpha: 1.0)
        menuView.shouldKeepSelectedCellColor = true
        menuView.cellTextLabelColor = UIColor.whiteColor()
        menuView.cellTextLabelFont = UIFont(name: "Avenir-Heavy", size: 17)
        menuView.cellTextLabelAlignment = .Left // .Center // .Right // .Left
        menuView.arrowPadding = 15
        menuView.animationDuration = 0.5
        menuView.maskBackgroundColor = UIColor.whiteColor()
        menuView.maskBackgroundOpacity = 0.3
        menuView.didSelectItemAtIndexHandler = {(indexPath: Int) -> () in
            print("Did select item at index: \(indexPath)")
            //self.selectedCellLabel.text = items[indexPath]
            
            if indexPath == 0 {
                if self.runBool == true {
                    self.leftHashRunOption()
                }
                if self.passBool == true {
                    self.leftHashPassOption()
                }
                if self.threeFourBool == true {
                    self.leftThreeFourOption()
                }
                if self.fourThreeBool == true {
                    self.leftFourThreeOption()
                }
                if self.runBool == true && self.threeFourBool == true {
                    self.leftHashRunOption()
                    self.leftThreeFourOption()
                }
                if self.runBool == true && self.fourThreeBool == true {
                    self.leftHashRunOption()
                    self.leftFourThreeOption()
                }
                if self.passBool == true && self.threeFourBool == true {
                    self.leftHashPassOption()
                    self.leftThreeFourOption()
                }
                if self.passBool == true && self.fourThreeBool == true {
                    self.leftHashPassOption()
                    self.leftFourThreeOption()
                }
                if self.runBool == false && self.passBool == false && self.threeFourBool == false && self.fourThreeBool == false {
                    self.leftHashOption()
                }
                
                self.leftHashBool = true
                self.rightHashBool = false
            }
            if indexPath == 1 {
                if self.runBool == true {
                    self.rightHashRunOption()
                }
                if self.passBool == true {
                    self.rightHashPassOption()
                }
                if self.threeFourBool == true {
                    self.rightThreeFourOption()
                }
                if self.fourThreeBool == true {
                    self.rightFourThreeOption()
                }
                if self.runBool == true && self.threeFourBool == true {
                    self.rightHashRunOption()
                    self.rightThreeFourOption()
                }
                if self.runBool == true && self.fourThreeBool == true {
                    self.rightHashRunOption()
                    self.rightFourThreeOption()
                }
                if self.passBool == true && self.threeFourBool == true {
                    self.rightHashPassOption()
                    self.rightThreeFourOption()
                }
                if self.passBool == true && self.fourThreeBool == true {
                    self.rightHashPassOption()
                    self.rightFourThreeOption()
                }
                if self.runBool == false && self.passBool == false && self.threeFourBool == false && self.fourThreeBool == false {
                    self.rightHashOption()
                }
                
                self.rightHashBool = true
                self.leftHashBool = false
            }
            if indexPath == 2 {
                if self.leftHashBool == true {
                    self.leftHashPassOption()
                }
                if self.rightHashBool == true {
                    self.rightHashPassOption()
                }
                if self.leftHashBool == false && self.rightHashBool == false {
                    self.passOption()
                }
                
                self.passBool = true
                self.runBool = false
            }
            if indexPath == 3 {
                if self.leftHashBool == true {
                    self.leftHashRunOption()
                }
                if self.rightHashBool == true {
                    self.rightHashRunOption()
                }
                if self.leftHashBool == false && self.rightHashBool == false {
                    self.runOption()
                }
                
                self.runBool = true
                self.passBool = false
            }
            if indexPath == 4 {
                if self.leftHashBool == true {
                    self.leftThreeFourOption()
                }
                if self.rightHashBool == true {
                    self.rightThreeFourOption()
                }
                if self.leftHashBool == false && self.rightHashBool == false {
                    self.threeFourOption()
                }
                
                self.threeFourBool = true
                self.fourThreeBool = false
            }
            if indexPath == 5 {
                if self.leftHashBool == true {
                    self.leftFourThreeOption()
                }
                if self.rightHashBool == true {
                    self.rightFourThreeOption()
                }
                if self.leftHashBool == false && self.rightHashBool == false {
                    self.fourThreeOption()
                }
                
                self.fourThreeBool = true
                self.threeFourBool = false
            }
        }
        
        self.navigationItem.titleView = menuView
        self.navigationController?.navigationBar.tintColor = UIColor.whiteColor()
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    func setNewPosArr() -> Void {
        let newArray:NSMutableArray = NSMutableArray()
        for icon in manager.iconArrary {
            let cgValue = NSStringFromCGPoint( icon.path.count == 0 ? icon.startPos : icon.path[icon.path.count - 1])
            newArray.addObject(cgValue)
        }
        
        NSUserDefaults.standardUserDefaults().setObject(newArray, forKey: String(format: "KEY_%d", incrementKeyCount()))
        NSUserDefaults.standardUserDefaults().setInteger(iconType.hashValue, forKey: String(format: "ICON_TYPE_%d", getKeyCount()))
        //saveLayoutNames()

        //pickerDataSource.append(layoutName.text!)
        //pickerView.reloadAllComponents()
        
        layoutName.text = "Play"
    }
    func incrementKeyCount() -> Int {
        let keyCount = NSUserDefaults.standardUserDefaults().integerForKey("KEY_COUNT")
        NSUserDefaults.standardUserDefaults().setInteger(keyCount+1, forKey: "KEY_COUNT")
        return NSUserDefaults.standardUserDefaults().integerForKey("KEY_COUNT")
    }
    func getKeyCount() -> Int {
        return NSUserDefaults.standardUserDefaults().integerForKey("KEY_COUNT")
    }
    func saveLayoutNames() -> Void {
        
        NSUserDefaults.standardUserDefaults().setValue(layoutName.text, forKey:String(format: "%@%d", K.KeyValue.LayoutName, getKeyCount()-1))
        NSUserDefaults.standardUserDefaults().synchronize()
    }
    
    //Common method to initialize icons with type
    func initIconWithType(iconType:IconType, position:CGPoint) -> Void {
        
        if iconType == IconType.Circle {
            let circle:Icon = Icon()
            circle.image = UIImage(named: "Circle.png")
            circle.fileName = "Circle.png"
            circle.startPos = position  //getPosAt(index, layoutType: layoutType)
            circle.name = iconName
            circle.type = IconType.Circle
            manager.addIcon(circle)
            return
        }
        
        if iconType == IconType.Square {
            let square:Icon = Icon()
            square.image = UIImage(named: "Square.png")
            square.startPos = position//getPosAt(index, layoutType: layoutType)
            square.fileName = "Square.png"
            square.name = iconName
            square.type = IconType.Square
            manager.addIcon(square)
            return
        }
        
        let cross:Icon = Icon()
        cross.image = UIImage(named: "X.png")
        cross.startPos = position//getPosAt(index, layoutType: layoutType)
        cross.fileName = "X.png"
        cross.name = iconName
        cross.type = IconType.Cross
        manager.addIcon(cross)
    }
    
    func layoutIcons() {
        var tag = 0
        for icon in manager.iconArrary {
            let imageView:UIImageView = UIImageView(image: icon.image)
            self.view.addSubview(imageView)
            imageView.frame = CGRectMake(icon.startPos.x, icon.startPos.y, imageView.frame.size.width, imageView.frame.size.height)
            imageView.tag = kBaseTag + tag
            tag += 1
        }
    }
    
    func removeExistedIcons() -> Void {
        var tag = 0
        for icon in manager.iconArrary {
            let imgView = self.view.viewWithTag(kBaseTag + tag) as? UIImageView
            imgView?.removeFromSuperview()
            tag += 1
            print(icon)
        }
        manager.iconArrary.removeAll(keepCapacity: true)
    }
    
    //    func removeExistedIconsOfType(moveType:IconType, array:[CGPoint]) -> Void {
    //        var tag = 0
    //        var countCross = 0
    //        for icon in manager.iconArrary {
    //            let imgView = self.view.viewWithTag(kBaseTag + tag) as! UIImageView
    //            if icon.type == moveType && countCross < array.count {
    //                let point =  array[countCross]
    //                imgView.frame = CGRectMake(point.x, point.y, imgView.frame.size.width,  imgView.frame.size.width)
    //                countCross += 1
    //            }
    //            tag += 1
    //        }
    //    }
    
    var offset:CGPoint = CGPointZero
    var selectedIndex:Int = -1
    var selectedIcon:UIView? = nil
    
    
    func setSelectedIconFromTouch(touch:UITouch?) {
        
        if touch == nil {
            selectedIcon = nil
            return
        }
        
        let touchLocation = touch?.locationInView(self.view)
        
        for i in 0 ..< manager.iconArrary.count {
            
            let tag = kBaseTag + i
            let imageView = self.view.viewWithTag(tag)
            
            let iconFrame = self.view.convertRect(imageView!.frame, toView: self.view)
            
            if CGRectContainsPoint(iconFrame, touchLocation!) {
                selectedIcon = imageView
                return
            }
        }
    }
    
    func setOffsetFromTouch(touch:UITouch?) {
        
        if touch == nil || selectedIcon == nil {
            offset = CGPointZero
            return
        }
        
        offset = touch!.locationInView(selectedIcon!)
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches.first
        setSelectedIconFromTouch(touch)
        setOffsetFromTouch(touch)

        if selectedIcon == nil {
            return
        }

        //if layoutName.text?.characters.count > 0 {
          //  return
        //}
        startPos = getCenter(selectedIcon!.frame.origin)
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches.first
        
        if selectedIcon == nil {
            return
        }
        
        let touchPos = touch?.locationInView(self.view)
        let pathPos = CGPointMake(touchPos!.x - offset.x, touchPos!.y - offset.y)
        selectedIcon?.frame = CGRectMake(pathPos.x, pathPos.y, selectedIcon!.frame.size.width, selectedIcon!.frame.size.height)
        
        let tag = selectedIcon?.tag
        
        manager.iconArrary[tag! - kBaseTag].path.append(pathPos)
        
        endPos = getCenter(pathPos)
        drawLine(startPos, endPos: endPos, imageView: selectedIcon!)
        startPos = CGPointMake(endPos.x, endPos.y)
    }
    
    func getCenter(pos:CGPoint) -> CGPoint {
        
        let center:CGPoint = CGPointMake(pos.x + selectedIcon!.frame.size.width / 2, pos.y + selectedIcon!.frame.size.height / 2)
        return center
    }
    
    func drawLine(startPos:CGPoint, endPos:CGPoint, imageView:UIView) {
        //if layoutName.text?.characters.count > 0 {
        //    return
        //}
        let path = UIBezierPath()
        path.moveToPoint(CGPointMake(startPos.x, startPos.y))
        path.addLineToPoint(CGPointMake(endPos.x, endPos.y))
        
        shapeLayer = CAShapeLayer()
        shapeLayer.path = path.CGPath
        shapeLayer.strokeColor = UIColor.whiteColor().CGColor
        shapeLayer.lineWidth = 3.0
        shapeLayer.fillColor = UIColor.clearColor().CGColor
        shapeLayer.name = K.KeyValue.shapeLayerName
        
        self.view.layer.insertSublayer(shapeLayer, below: imageView.layer)
    }
    
    func drawRedLine(startPos:CGPoint, endPos:CGPoint, imageView:UIView) {
        let path = UIBezierPath()
        path.moveToPoint(CGPointMake(startPos.x, startPos.y))
        path.addLineToPoint(CGPointMake(endPos.x, endPos.y))
        
        shapeLayer = CAShapeLayer()
        shapeLayer.path = path.CGPath
        shapeLayer.strokeColor = UIColor.redColor().CGColor
        shapeLayer.lineWidth = 3.0
        shapeLayer.fillColor = UIColor.clearColor().CGColor
        shapeLayer.name = K.KeyValue.shapeLayerName
    }
    
    func clearDrawLine() -> Void {
        for layer in self.view.layer.sublayers! {
            if layer.name == K.KeyValue.shapeLayerName {
                layer.removeFromSuperlayer()
            }
        }
    }
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let touch = touches.first
        let touchPos = touch?.locationInView(self.view)
        selectedIcon = nil
        offset = CGPointZero
        print(touchPos)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let identifier = segue.identifier
        if identifier! == "playRecord" {
            manager.saveIcons()
            let thirdController:ThirdScreen = segue.destinationViewController as! ThirdScreen
            thirdController.isBackToListing  = true
            thirdController.iconName = self.iconName
        }
    }
    func openLayoutWithIndex(layoutIndex:Int) -> Void {
        
        removeExistedIcons()
        var iconPosArray = NSUserDefaults.standardUserDefaults().objectForKey(String(format: "KEY_%d", layoutIndex)) as! NSMutableArray
        for index in 0...(iconPosArray.count - 1) {
            if index % 2 != 0 {
                //                 print(String(format: "CGPointMake(screenSize.width * %f, self.view.frame.size.height * %f),", CGPointFromString(iconPosArray.objectAtIndex(index) as! String).x/self.view.frame.size.width, CGPointFromString(iconPosArray.objectAtIndex(index) as! String).y/self.view.frame.size.height))
            }
            iconPosArray = NSUserDefaults.standardUserDefaults().objectForKey(String(format: "KEY_%d", layoutIndex)) as! NSMutableArray
            
            //Remove this comment after made Cover 3 layout
            //initIconWithType(index % 2 == 0 ? IconType.Cross : IconType.Circle /*iconType*/, position: CGPointFromString(iconPosArray.objectAtIndex(index) as! String))
            let point = CGPointFromString(iconPosArray.objectAtIndex(index) as! String)
            //point = point.ConvertCGPoint()
            initIconWithType((index <= 10 ? IconType.Cross : index == 11 ? IconType.Square : IconType.Circle) /*iconType*/, position: point)
        }
        layoutIcons()
    }
    func changeLocationOnly(moveType:IconType, array:[CGPoint]) -> Void {
        var tag = 0
        var countCross = 0
        for icon in manager.iconArrary {
            let imgView = self.view.viewWithTag(kBaseTag + tag) as! UIImageView
            if icon.type == moveType && countCross < array.count {
                let point =  array[countCross]
                imgView.frame = CGRectMake(point.x, point.y, imgView.frame.size.width,  imgView.frame.size.width)
                icon.startPos = point
                icon.path = []
                countCross += 1
            }
            tag += 1
        }
    }
    @IBAction func cover2Button(sender: AnyObject) {
        iconType = IconType.Cross
        openLayoutWithIndex(1)
    }
    
    @IBAction func cover3Button(sender: AnyObject) {
        iconType = IconType.Circle
        openLayoutWithIndex(2)
    }
    
    @IBAction func saveLayout(sender: AnyObject) {
        clearDrawLine()
        for name in pickerDataSource {
            if name == layoutName.text {
                showAlert("Layout is already existed with this name")
                return
            }
        }
        if layoutName.text?.characters.count > 0 {
            setNewPosArr()
        }else {
            showAlert("Please enter layout name")
        }
    }
    
    @IBAction func onSave(sender: AnyObject) {
        /*if layoutName.text?.characters.count > 0 {
            showAlert("Please save the layout first. If you don't want to save layout then clear the layout field")
            return
        }*/
        //iconName = nameField.text!
        self.performSegueWithIdentifier("playRecord", sender: nil)
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerDataSource.count;
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerDataSource[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        clearDrawLine()
        //(format: "ICON_TYPE_%d", getKeyCount())
        let iconIntType = NSUserDefaults.standardUserDefaults().integerForKey(String(format: "ICON_TYPE_%d", row + 1))
        if iconIntType == IconType.Cross.hashValue {
            iconType = IconType.Cross
        }else {
            iconType = IconType.Circle
            
        }
        if (row +  1)  == 1 {
            if deltaBoolFirst == false {
                print("X1 Move X2", "O1 Stopped")
                //changeLocationOnly(IconType.Cross, array: iconRandomCrossArr_2)
                deltaBoolFirst = true
            }else {
                print("X2 Move X1", "O2 Stopped")
                deltaBoolFirst = false
            }
        }
        else if(row +  1)  == 2{
            if deltaBoolSecond == true {
                print("O1 Move O2", "X2 Stopped")
                deltaBoolSecond = false
            }else {
                print("O2 Move O1", "X1 Stopped")
                deltaBoolSecond = true
            }
        }else {
            openLayoutWithIndex(row + 1)
        }
    }
    
    func showAlert(message:String) {
        let alertController:UIAlertController = UIAlertController(title: message, message: nil, preferredStyle: .Alert)
        let alertAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        alertController.addAction(alertAction)
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    @IBAction func blitzerAction(sender: AnyObject) {
        
        //var RMXimgView:UIImageView?
        var leftMostX:Icon?
        
        var tag = 0
        var countCross = 0
        for icon in manager.iconArrary {
            let imgView = self.view.viewWithTag(kBaseTag + tag) as! UIImageView
            print(imgView)
            if icon.type == IconType.Cross {
                if let ic = leftMostX {
                    if ic.startPos.x > icon.startPos.x {
                        leftMostX = icon
                        //RMXimgView = imgView
                    }
                } else {
                    leftMostX = icon
                    //RMXimgView = imgView
                }
                countCross += 1
            }
            tag += 1
        }
        
        //RMXimgView?.backgroundColor = UIColor.redColor()
        if let icon = leftMostX {
            appendPathToIcon(icon)
        }
    }
    @IBAction func actionCornerback(sender: AnyObject)
    {
        //var RMXimgView:UIImageView?
        var rightMostX:Icon?
        
        var tag = 0
        var countCross = 0
        for icon in manager.iconArrary {
            let imgView = self.view.viewWithTag(kBaseTag + tag) as! UIImageView
            print(imgView)
            if icon.type == IconType.Cross {
                if let ic = rightMostX {
                    if ic.startPos.x < icon.startPos.x {
                        rightMostX = icon
                        //RMXimgView = imgView
                    }
                } else {
                    rightMostX = icon
                    //RMXimgView = imgView
                }
                countCross += 1
            }
            tag += 1
        }
        
        //RMXimgView?.backgroundColor = UIColor.redColor()
        if let icon = rightMostX {
            appendPathToIcon(icon)
        }
    }
    
    @IBAction func linebackerButton(sender: AnyObject) {
        //var RMXimgView:UIImageView?
        var centerIconX:Icon?
        
        var tag = 0
        var countCross = 0
        for icon in manager.iconArrary {
            let imgView = self.view.viewWithTag(kBaseTag + tag) as! UIImageView
            print(imgView)
            if icon.type == IconType.Cross {
                if let ic = centerIconX {
                    if ic.startPos.x == icon.startPos.x && ic.startPos.y == icon.startPos.y {
                        centerIconX = icon
                        //RMXimgView = imgView
                    }
                } else {
                    centerIconX = icon
                    //RMXimgView = imgView
                }
                countCross += 1
            }
            tag += 1
        }
        
        //RMXimgView?.backgroundColor = UIColor.redColor()
        if let icon = centerIconX {
            appendPathToIcon(icon)
        }
    }
    
    func appendPathToIcon(icon: Icon) {
        let targetIconPath = manager.iconArrary.last!.path
        var cornerbackPosition = icon.startPos
        
        let count = (targetIconPath.count > 0 ? targetIconPath.count : 75)
        
        for index in 0..<count {
            var distance = CGPointZero
            if icon.path.indices.contains(index) {
                cornerbackPosition = icon.path[index]
            }
            
            let nextPosition = (targetIconPath.count == 0 ? manager.iconArrary.last!.startPos : targetIconPath[index])
            distance = CGPoint(x: cornerbackPosition.x - nextPosition.x, y: cornerbackPosition.y - nextPosition.y)
            let distanceSegment = (x: distance.x / CGFloat(count), y: distance.y / CGFloat(count))
            let nextPoint = CGPointMake(cornerbackPosition.x - distanceSegment.x * CGFloat(index), cornerbackPosition.y - distanceSegment.y * CGFloat(index))
            
            icon.path.append(nextPoint)
        }
    }
    
    @IBAction func downAction(sender: AnyObject) {
        
        sender.setValue(Float(lroundf(slider.value)), animated: true)
        let selectedValue = Float(slider.value);
        let integerNumber:Int = Int(selectedValue)
        downNumber.text = "\(integerNumber)"
        ThirdScreen.playDown = self.downNumber.text!
    }
    
    func redZoneOption() {
    }
    
    @IBAction func resetButton(sender: AnyObject) {
        clearDrawLine()
        //setNewPosArr()
        
        //circle.startPos = position
        //path.count > 0
        
        for var icon in manager.iconArrary {
            print("icon.startPos",icon.startPos,"icon.offset",icon.offset,"icon.path",icon.path)
            if icon.path.count > 0 {
                print(icon.path.last)
                icon.startPos = icon.path.last!
                icon.path = []
            }
        }
    }
    
    func leftHashOption() {
        changeLocationOnly(IconType.Circle, array: leftHashOffense)
        changeLocationOnly(IconType.Square, array: leftHashOffenseSquare)
        changeLocationOnly(IconType.Cross, array: leftHashDefense)
    }
    func rightHashOption() {
        changeLocationOnly(IconType.Circle, array: rightHashOffense)
        changeLocationOnly(IconType.Square, array: rightHashOffenseSquare)
        changeLocationOnly(IconType.Cross, array: rightHashDefense)
    }
    func passOption() {
        changeLocationOnly(IconType.Circle, array: passOffense)
        changeLocationOnly(IconType.Square, array: passOffenseSquare)
    }
    func leftHashPassOption() {
        changeLocationOnly(IconType.Circle, array: leftHashPass)
        changeLocationOnly(IconType.Square, array: leftHashPassSquare)
    }
    func rightHashPassOption() {
        changeLocationOnly(IconType.Circle, array: rightHashPass)
        changeLocationOnly(IconType.Square, array: rightHashPassSquare)
    }
    func runOption() {
        changeLocationOnly(IconType.Circle, array: runOffense)
        changeLocationOnly(IconType.Square, array: runOffenseSquare)
    }
    func leftHashRunOption() {
        changeLocationOnly(IconType.Circle, array: leftHashRun)
        changeLocationOnly(IconType.Square, array: leftHashRunSquare)
    }
    func rightHashRunOption() {
        changeLocationOnly(IconType.Circle, array: rightHashRun)
        changeLocationOnly(IconType.Square, array: rightHashRunSquare)
    }
    func threeFourOption() {
        changeLocationOnly(IconType.Cross, array: threeFourDefense)
    }
    func leftThreeFourOption() {
        changeLocationOnly(IconType.Cross, array: leftHashThreeFour)
    }
    func rightThreeFourOption() {
        changeLocationOnly(IconType.Cross, array: rightHashThreeFour)
    }
    func fourThreeOption() {
        changeLocationOnly(IconType.Cross, array: fourThreeDefense)
    }
    func leftFourThreeOption() {
        changeLocationOnly(IconType.Cross, array: leftHashFourThree)
    }
    func rightFourThreeOption() {
        changeLocationOnly(IconType.Cross, array: rightHashFourThree)
    }
}