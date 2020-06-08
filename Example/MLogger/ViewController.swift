//
//  ViewController.swift
//  MLogger
//
//  Created by mahmoudabdelshafi4@gmail.com on 06/08/2020.
//  Copyright (c) 2020 mahmoudabdelshafi4@gmail.com. All rights reserved.
//

import UIKit
import MLogger

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Basic Usages
        MLogger.debug("This is a DEBUG message") // DEBUG log
        MLogger.error("This is an ERROR message") // ERROR log
        MLogger.info("This is a INFO message") // INFO log
        MLogger.verbose("This is a VERBOSE message") // VERBOSE log
        MLogger.warning("This is a WARNING message") // WARNING log
        MLogger.severe("This is a SEVERE message") // SEVERE Error log
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

