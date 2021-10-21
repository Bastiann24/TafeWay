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
    // DB
    var db: OpaquePointer? = nil
    //Area names array for picker view display
    var areaNames = [String]()
    
    
    //Functions for database
    func getDBPath()->String{
        
        let paths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        let documentsDir = paths[0]
        let databasePath = (documentsDir as NSString).appendingPathComponent("TafeWayDB.db")
        return databasePath;
    }
    
    func selectQuery() {
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
        sqlite3_close(db)
    }

    
    //Functions for picker view
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return areaArray.count;
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return areaNames[row] as String
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)  {
        print(areaArray[row])
    }
    
    //Function viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        //Opening database to select query
        if sqlite3_open(getDBPath(), &db) == SQLITE_OK {
            print("Successfully opened connection to database")
            selectQuery()
        }
        else {
            print("Unable to open database")
        }
        //Populate areaNames array to display in pickerview
        for area in areaArray{
            areaNames.append(area.areaName)
        }
    }
}
