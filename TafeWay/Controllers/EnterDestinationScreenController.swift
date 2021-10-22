//
//  EnterDestinationScreenController.swift
//  TafeWay
//
//  Created by Bastian Ugalde  on 13/8/21.
//

import UIKit
import SQLite3

class EnterDestinationScreenController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    //Outlet for picker view
    @IBOutlet weak var areaPickerView: UIPickerView!
    
    // Area array
    var areaArray: [Area] = []
    // Entrance array
    var entranceArray: [Entrance] = []
    // DB
    var db: OpaquePointer? = nil
    //Area names array for picker view display
    var areaNames = [String]()
    // Entrance names array for picker view display
    var entranceNames = [String] ()
    
    
    //Functions for database get path for DB
    func getDBPath()->String{
        
        let paths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        let documentsDir = paths[0]
        let databasePath = (documentsDir as NSString).appendingPathComponent("TafeWayDB.db")
        return databasePath;
    }
    
    //Select query for Area Data
    func selectQueryArea() {
        let selectQueryStatement = "SELECT * FROM Area"
        var queryStatement: OpaquePointer? = nil
        if (sqlite3_prepare(db, selectQueryStatement, -1, &queryStatement, nil) == SQLITE_OK) {
            print("Query result:")
            while (sqlite3_step(queryStatement) == SQLITE_ROW){
                let areaId = sqlite3_column_int(queryStatement, 0)
                let nameField = sqlite3_column_text(queryStatement, 1)
                let areaName = String (cString: nameField!)

                
                print("\(areaId) | \(areaName)")
                let a = Area(areaID: Int(areaId), areaName: areaName)
                areaArray.append(a)
            }
        }
        else{
            print("SELECT statement could not be prepared", terminator: "")
        }
        sqlite3_finalize(queryStatement)
        //sqlite3_close(db) DONT CLOSE THE DB otherwise the selctQueryEntrance wont be able to run
    }
    
    //Select query for Entrance data
    func selectQueryEntrance() {
        let selectQueryStatement = "SELECT * FROM Entrance"
        var queryStatement: OpaquePointer? = nil
        if (sqlite3_prepare(db, selectQueryStatement, -1, &queryStatement, nil) == SQLITE_OK) {
            print("Query result:")
            while (sqlite3_step(queryStatement) == SQLITE_ROW){
                let entranceId = sqlite3_column_int(queryStatement, 0)
                let nameField = sqlite3_column_text(queryStatement, 1)
                let entranceName = String (cString: nameField!)

                
                print("\(entranceId) | \(entranceName)")
                let a = Entrance(entranceID: Int(entranceId), entranceName: entranceName)
                entranceArray.append(a)
            }
        }
        else{
            print("SELECT statement could not be prepared", terminator: "")
        }
        sqlite3_finalize(queryStatement)
        sqlite3_close(db)
    }

    
    //Functions for picker view
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        if (component==0) {
        return areaArray.count
        }
        else
        {
        return entranceArray.count
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (component==0){
        return areaNames[row] as String
        }
        else{
            return entranceNames[row] as String
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)  {
        if (component == 0){
        print(areaArray[row])
        }
        else{
            print(entranceArray[row])
        }
    }
    //Function for pickerview to modify the size of the text
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var label = UILabel()
        if let v = view as? UILabel { label = v }
        label.font = UIFont (name: "Lato", size: 12)
        if component == 0 {
        label.text =  areaNames[row]
        label.textAlignment = .center
        }
        else {
            label.text = entranceNames[row]
            label.textAlignment = .center
        }
        return label
    }
    
    
    //Function viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        //Opening database to select query
        if sqlite3_open(getDBPath(), &db) == SQLITE_OK {
            print("Successfully opened connection to database")
            selectQueryArea()
            selectQueryEntrance()
        }
        else {
            print("Unable to open database")
        }
        //Populate areaNames array to display in pickerview
        for area in areaArray{
            areaNames.append(area.areaName)
        }
        //Populate entranceNames array to display in pickerview
        for entrance in entranceArray{
            entranceNames.append(entrance.entranceName)
        }
    }
}
