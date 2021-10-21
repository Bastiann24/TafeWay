//
//  AppDelegate.swift
//  TafeWay
//
//  Created by Bastian Ugalde  on 12/8/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        copyDatabase()
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    func getDBPath()->String {
        let paths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        let documentsDir = paths[0]
        let databasePath = (documentsDir as NSString).appendingPathComponent("TafeWayDB.db")
        return databasePath
    }
    
    func copyDatabase(){
        
        let fileManager = FileManager.default
        
        let dbPath = getDBPath()
        var success = fileManager.fileExists(atPath: dbPath)
        
        if(!success) {
            if let defaultDBPath = Bundle.main.path(forResource: "TafeWayDB", ofType: "db"){
                
                var error:NSError?
                do {
                    try fileManager.copyItem(atPath: defaultDBPath, toPath: dbPath)
                    success = true
                }catch let error1 as NSError {
                    error = error1
                    success = false
                }
                print(defaultDBPath)
                if (!success){
                    print("Failed to create database with file message\(error!.localizedDescription))")
                }
            }else{
                print("Cannot find file in NSBundle")
            }
        }else{
            print("File already exists at:\(dbPath)")
        }
    }



}

