//
//  With.swift
//  RxTestable
//
//  Created by Alperen Duran on 3.02.2020.
//  Copyright © 2020 Alperen Duran. All rights reserved.
//

import Foundation

@inlinable
func with<T>(_ subject: T, _ transform: (_ subject: inout T) throws -> Void) rethrows -> T {
    var subject = subject
    try transform(&subject)
    return subject
}
