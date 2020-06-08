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
            print("\(Date().toString()) \(LogEvent.error.rawValue)[\(MLogger.sourceFileName(filePath: filename))]:\(line) \(column) \(funcName) -> \(object)")
        }
    }
    /// Logs info messages on console with prefix [ℹ️]
   public class func info( _ object: Any, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
    if MLogger.isLoggingEnabled {
        print("\(Date().toString()) \(LogEvent.i.rawValue)[\(MLogger.sourceFileName(filePath: filename))]:\(line) \(column) \(funcName) -> \(object)")
        }
    }
    
    /// Logs debug messages on console with prefix [💬]
   public class func debug( _ object: Any, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
    if MLogger.isLoggingEnabled {
        print("\(Date().toString()) \(LogEvent.d.rawValue)[\(MLogger.sourceFileName(filePath: filename))]:\(line) \(column) \(funcName) -> \(object)")
        }
    }
    
    /// Logs messages verbosely on console with prefix [🔬]
   public class func verbose( _ object: Any, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
    if MLogger.isLoggingEnabled {
            print("\(Date().toString()) \(LogEvent.v.rawValue)[\(MLogger.sourceFileName(filePath: filename))]:\(line) \(column) \(funcName) -> \(object)")
        }
    }
    
    /// Logs warnings verbosely on console with prefix [⚠️]
   public class func warning( _ object: Any, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
    if MLogger.isLoggingEnabled {
            print("\(Date().toString()) \(LogEvent.w.rawValue)[\(MLogger.sourceFileName(filePath: filename))]:\(line) \(column) \(funcName) -> \(object)")
        }
    }
    
    /// Logs severe events on console with prefix [🔥]
   public class func severe( _ object: Any, filename: String = #file, line: Int = #line, column: Int = #column, funcName: String = #function) {
    if MLogger.isLoggingEnabled {
            print("\(Date().toString()) \(LogEvent.s.rawValue)[\(MLogger.sourceFileName(filePath: filename))]:\(line) \(column) \(funcName) -> \(object)")
        }
    }
    
    
    
    ///extract the file name from the file path.
    class func sourceFileName(filePath: String) -> String {
        let components = filePath.components(separatedBy: "/")
        return components.isEmpty ? "" : components.last!
    }
}

//Date to String extension
extension Date {
    func toString() -> String {
        return MLogger.dateFormatter.string(from: self as Date)
    }
}
