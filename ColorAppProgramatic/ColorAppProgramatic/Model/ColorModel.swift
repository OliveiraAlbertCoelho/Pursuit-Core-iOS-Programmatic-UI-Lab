//
//  ColorModel.swift
//  ColorAppProgramatic
//
//  Created by albert coelho oliveira on 10/10/19.
//  Copyright © 2019 albert coelho oliveira. All rights reserved.
//
import Foundation
import UIKit

struct RGBColors {
    var red: Double
    var blue: Double
    var green: Double
    
    init (){
        self.red = Double.random(in: 0...1)
        self.blue = Double.random(in: 0...1)
        self.green = Double.random(in: 0...1)
    }
    func giveRandomUIColor() -> UIColor {
        return UIColor(red: CGFloat(self.red), green: CGFloat(self.green), blue: CGFloat(self.blue), alpha: 1.0)
    }
    func getBiggest()-> String{
        if red > blue && red > green{
            return "red"
        }else if blue > red && blue > green{
                return "blue"
        }else {
            return "green"
        }
    }
    
   
}
