//
//  Area.swift
//  TafeWat
//
//  Created by Bastian Ugalde  on 8/9/21.
//

import Foundation
public class Area{
    public var areaID: Int
    public var areaName: String
    
    public init(){
        self.areaID = 0
        self.areaName = ""
    }
    
    public init(areaID: Int, areaName: String){
        self.areaID = areaID
        self.areaName = areaName
    }
    
    func toString() -> String{
        return "Area ID: " + String(self.areaID) + "Area name: " + self.areaName
    }
}
