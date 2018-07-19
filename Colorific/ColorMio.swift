//
//  ColorMio.swift
//  Colorific
//
//  Created by alex on 24/10/17.
//  Copyright © 2017 Alex. All rights reserved.
//

import UIKit



class ColorMio: NSObject {

    
    //      C A M P I
    
    // Generate Random Numbers
    let r = CGFloat(arc4random() % 255)
    let g = CGFloat(arc4random() % 255)
    let b = CGFloat(arc4random() % 255)
    
    // RGB Complementary
    var rC = Int()
    var gC = Int()
    var bC = Int()
    
    var color : UIColor?
    var colorComp : UIColor?
    
    override 
    public var description:  String { return
        "Color: RGB [ R: \(Int(r)) / " +
                     "G: \(Int(g)) / " +
                     "B: \(Int(b)) ]"
    }
    
    public var description2: String { return
        "ColorComp: RGB [ R: \(Int(rC)) / " +
                         "G: \(Int(gC)) / " +
                         "B: \(Int(bC)) ]" }
    
    
    
    //      M E T O D I
    
    //___________________________________________________________________________________
    //-----------------------------------------------------------------------------------
    func createRandomColor() -> UIColor{
        // Create Color
        let color = UIColor(red: (r/255.0), green: (g/255.0), blue: (b/255.0), alpha: 1.0)
        self.color = color
        return color
    }
    
    //-----------------------------------------------------------------------------------
    
    func printRGB() -> String {
        // Create String
        let rgbString = "[R " + String(Int(r)) + "] " +
                        "[G " + String(Int(g)) + "] " +
                        "[B " + String(Int(b)) + "] "
        return rgbString
    }
    //___________________________________________________________________________________
    //-----------------------------------------------------------------------------------
    
    
    //___________________________________________________________________________________
    //-----------------------------------------------------------------------------------
    func createCompColor(c : UIColor) -> UIColor {
 
        let r1 = CGFloat(255 - r)
        let g1 = CGFloat(255 - g)
        let b1 = CGFloat(255 - b)
        
        let colorC = UIColor(red: (r1/255.0), green: (g1/255.0), blue: (b1/255.0), alpha: 1.0)
        self.colorComp = colorC 
        
        rC = Int(r1)
        gC = Int(g1)
        bC = Int(b1)
        
        return colorC
    }
    
    //-----------------------------------------------------------------------------------
    
    func printRGB_C() -> String {
        // Create String
        let rgbStringC = "[R " + String(Int(rC)) + "] " +
                         "[G " + String(Int(gC)) + "] " +
                         "[B " + String(Int(bC)) + "] "
        return rgbStringC
    }
    //___________________________________________________________________________________

    
    //-----------------------------------------------------------------------------------
    
    func salvaColor() {
        if(DataManager.shared.contenitoreDiColor.contains(self)){
            return
        } else {
            DataManager.shared.contenitoreDiColor.append(self)
            print(DataManager.shared.contenitoreDiColor)
        }
    }
    //___________________________________________________________________________________
    
    func toUIColor() -> UIColor {
        return color!
    }
    
    func toUIColorC() -> UIColor {
        return colorComp!
    }

}



