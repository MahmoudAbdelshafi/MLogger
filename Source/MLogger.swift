//
//  MLogger.swift
//  MLogger
//
//  Created by Mahmoud on 6/8/20.
//  Copyright © 2020 Mahmoud. All rights reserved.
//

import Foundation

//Log types
enum LogEvent: String {
    case error = "[‼️]" // error
    case i = "[ℹ️]" // info
    case d = "[💬]" // debug
    case v = "[🔬]" // verbose
    case w = "[⚠️]" // warning
    case s = "[🔥]" // severe
}

/// Wrapping Swift.print() within DEBUG flag
func print(_ object: Any) {
    // Only allowing in DEBUG mode
    #if DEBUG
    Swift.print(object)
    #endif
}

public final class MLogger{
    //Date formatter
    static var dateFormat = "yyyy-MM-dd hh:mm:ssSSS"
    static var dateFormatter:DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat
        formatter.locale = Locale.current
        formatter.timeZone = TimeZone.current
        return formatter
    }
    
    #if DEBUG
    private static var LogsToSave = [String](){
        didSet{
        var logs = ""
        for log in LogsToSave{
        logs.append("\(log)" + "\n")
        }
        saveToLogTextFile(logs)
        }
    }
    #endif
    
    private static var isLoggingEnabled: Bool {
        #if DEBUG
        return true
        #else
        return false
        #endif
    }
    
    /// Logs error messages on console with prefix [‼️]
    public class func error( _ object: Any, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        if MLogger.isLoggingEnabled {
            let logCase = "\(Date().toString()) \(LogEvent.error.rawValue)[\(MLogger.sourceFileName(filePath: filename))]:\(line) \(column) \(funcName) -> \(object)"
            print(logCase)
            LogsToSave.append(logCase)
        }
    }
    /// Logs info messages on console with prefix [ℹ️]
    public class func info( _ object: Any, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        if MLogger.isLoggingEnabled {
            let logCase = "\(Date().toString()) \(LogEvent.i.rawValue)[\(MLogger.sourceFileName(filePath: filename))]:\(line) \(column) \(funcName) -> \(object)"
            print(logCase)
            LogsToSave.append(logCase)
        }
    }
    
    /// Logs debug messages on console with prefix [💬]
    public class func debug( _ object: Any, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        if MLogger.isLoggingEnabled {
            let logCase = "\(Date().toString()) \(LogEvent.d.rawValue)[\(MLogger.sourceFileName(filePath: filename))]:\(line) \(column) \(funcName) -> \(object)"
            print(logCase)
            LogsToSave.append(logCase)
        }
    }
    
    /// Logs messages verbosely on console with prefix [🔬]
    public class func verbose( _ object: Any, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        if MLogger.isLoggingEnabled {
            let logCase = "\(Date().toString()) \(LogEvent.v.rawValue)[\(MLogger.sourceFileName(filePath: filename))]:\(line) \(column) \(funcName) -> \(object)"
            print(logCase)
            LogsToSave.append(logCase)
        }
    }
    
    /// Logs warnings verbosely on console with prefix [⚠️]
    public class func warning( _ object: Any, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        if MLogger.isLoggingEnabled {
            let logCase = "\(Date().toString()) \(LogEvent.w.rawValue)[\(MLogger.sourceFileName(filePath: filename))]:\(line) \(column) \(funcName) -> \(object)"
            print(logCase)
            LogsToSave.append(logCase)
        }
    }
    
    /// Logs severe events on console with prefix [🔥]
    public class func severe( _ object: Any, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
        if MLogger.isLoggingEnabled {
            let logCase = "\(Date().toString()) \(LogEvent.s.rawValue)[\(MLogger.sourceFileName(filePath: filename))]:\(line) \(column) \(funcName) -> \(object)"
            print(logCase)
            LogsToSave.append(logCase)
        }
    }
    
    ///extract the file name from the file path.
    class func sourceFileName(filePath: String) -> String {
        let components = filePath.components(separatedBy: "/")
        return components.isEmpty ? "" : components.last!
    }
    
    
    /// Getting the MLogger.text path folder and print it into the console
    class func printMloggerFilePath(){
        var filePath: String{
            let manger = FileManager.default
            let url = manger.urls(for: .documentDirectory, in: .allDomainsMask).first! as NSURL
            let path = url.appendingPathComponent("MLogger")?.path
            return path ?? "path not found"
        }
        print(filePath)
    }
    
    ///Saving the printed logs into MLogger.text file
    static func saveToLogTextFile(_ text: String, to fileNamed: String = "MLogger", folder: String = "SavedFiles") {
        guard let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first else { return }
        guard let writePath = NSURL(fileURLWithPath: path).appendingPathComponent(folder) else { return }
        try? FileManager.default.createDirectory(atPath: writePath.path, withIntermediateDirectories: true)
        let file = writePath.appendingPathComponent(fileNamed + ".txt")
        try? text.write(to: file, atomically: false, encoding: String.Encoding.utf8)
    }
}

//Date to String extension
extension Date {
    func toString() -> String {
        return MLogger.dateFormatter.string(from: self as Date)
    }
}

