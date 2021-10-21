//
//  Entrance.swift
//  TafeWay
//
//  Created by Bastian Ugalde  on 21/10/21.
//

import Foundation
public class Entrance{
    public var entranceID: Int
    public var entranceName: String
    
    public init(){
        self.entranceID = 0
        self.entranceName = ""
    }
    
    public init(entranceID: Int, entranceName: String){
        self.entranceID = entranceID
        self.entranceName = entranceName
    }
    
    func toString() -> String{
        return "Entrance ID: " + String(self.entranceID) + "Entrance name: " + self.entranceName
    }
}
