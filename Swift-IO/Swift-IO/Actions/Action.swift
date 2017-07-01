//
//  Action.swift
//  TestArchi4
//
//  Created by mathieu lecoupeur on 24/06/2017.
//  Copyright © 2017 mathieu lecoupeur. All rights reserved.
//

import Foundation

typealias ActionResult = [String:Any]
typealias ActionCallback = (ActionResult, Error?) -> ()

protocol Action {
    
    func process(callback:ActionCallback)
    func cancel()
}
