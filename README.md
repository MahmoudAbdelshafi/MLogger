# MLogger

[![CI Status](https://img.shields.io/travis/mahmoudabdelshafi4@gmail.com/MLogger.svg?style=flat)](https://travis-ci.org/mahmoudabdelshafi4@gmail.com/MLogger)
[![Version](https://img.shields.io/cocoapods/v/MLogger.svg?style=flat)](https://cocoapods.org/pods/MLogger)
[![License](https://img.shields.io/cocoapods/l/MLogger.svg?style=flat)](https://cocoapods.org/pods/MLogger)
[![Platform](https://img.shields.io/cocoapods/p/MLogger.svg?style=flat)](https://cocoapods.org/pods/MLogger)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

MLogger is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'MLogger'
```
## Usage

### Basic
> If you are using CocoaPods to integrate Loggerithm. Import Loggerithm first:
> ```swift
> import MLogger
> ```

```   
 // Basic Usages
  MLogger.debug("This is a DEBUG message") // DEBUG log
  MLogger.error("This is an ERROR message") // ERROR log
  MLogger.info("This is a INFO message") // INFO log
  MLogger.verbose("This is a VERBOSE message") // VERBOSE log
  MLogger.warning("This is a WARNING message") // WARNING log
  MLogger.severe("This is a SEVERE message") // SEVERE Error log
```

```
// Log on Xcode Console
2018-06-09 01:03:37694 [💬][AppDelegate.swift]:20 15 application(_:didFinishLaunchingWithOptions:) -> This is a DEBUG message
2018-06-09 01:03:37722 [‼️][AppDelegate.swift]:21 15 application(_:didFinishLaunchingWithOptions:) -> This is an ERROR message
2018-06-09 01:03:37723 [ℹ️][AppDelegate.swift]:22 15 application(_:didFinishLaunchingWithOptions:) -> This is a INFO message
2018-06-09 01:03:37724 [🔬][AppDelegate.swift]:23 15 application(_:didFinishLaunchingWithOptions:) -> This is a VERBOSE message
2018-06-09 01:03:37724 [⚠️][AppDelegate.swift]:24 15 application(_:didFinishLaunchingWithOptions:) -> This is a WARNING message
2018-06-09 01:03:37725 [🔥][AppDelegate.swift]:25 15 application(_:didFinishLaunchingWithOptions:) -> This is a SEVERE message

```
## Author

Mahmoud Abdelshafi, Email: mahmoudabdelshafi4@gmail.com

## License

MLogger is available under the MIT license. See the LICENSE file for more info.
