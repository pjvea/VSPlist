//
//  VSPlist.swift
//  Test
//
//  Created by PJ Vea on 8/13/17.
//  Copyright © 2017 Vea Software. All rights reserved.
//

import Foundation
import UIKit

class VSPlist {
    /// Read the plist file as a dictionary.
    ///
    /// - Parameter fileName: Plist file name with or without extension.
    /// - Returns: NSMutableDictionary with contents of plist file.
    static func loadPlistFile(fileName: String) -> NSMutableDictionary {
        var plistName = fileName
        
        if let dotRange = plistName.range(of: ".") {
            plistName.removeSubrange(dotRange.lowerBound..<plistName.endIndex)
        }
        
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true) as NSArray
        let documentsDirectory = paths.object(at: 0) as! NSString
        let path = documentsDirectory.appendingPathComponent("\(plistName).plist")
        
        let fileManager = FileManager.default
        
        if(!fileManager.fileExists(atPath: path)) {
            if let bundlePath = Bundle.main.path(forResource: plistName, ofType: "plist") {
                do {
                    try fileManager.copyItem(atPath: bundlePath, toPath: path)
                } catch {
                    print("\(plistName).plist not copied. Please, make sure it is part of the bundle.")
                }
            } else {
                print("\(plistName).plist not found. Please, make sure it is part of the bundle.")
            }
        }
        
        if let dictionary = NSMutableDictionary(contentsOfFile: path) {
            return dictionary
        }
        
        return NSMutableDictionary()
    }
    
    /// Write to the plist file
    ///
    /// - Parameters:
    ///   - fileName: Plist file name with or without extension.
    ///   - dictionary: NSMutableDictionary with contents to write to plist file.
    static func savePlistFile(fileName: String, dictionary: NSMutableDictionary) {
        var plistName = fileName
        
        if let dotRange = plistName.range(of: ".") {
            plistName.removeSubrange(dotRange.lowerBound..<plistName.endIndex)
        }
        
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true) as NSArray
        let documentsDirectory = paths.object(at: 0) as! NSString
        let path = documentsDirectory.appendingPathComponent("\(plistName).plist")
        
        dictionary.write(toFile: path, atomically: true)
    }
}
