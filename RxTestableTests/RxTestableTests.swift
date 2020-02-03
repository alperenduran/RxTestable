//
//  RxTestableTests.swift
//  RxTestableTests
//
//  Created by Alperen Duran on 23.12.2019.
//  Copyright © 2019 Alperen Duran. All rights reserved.
//

import XCTest
import RxTest
import RxSwift
import RxCocoa

@testable import RxTestable

class RxTestableTests: XCTestCase {
    var input: Input!
    let viewModel = viewModel(input:)
    var scheduler: TestScheduler!
    
    override func setUp() {
        super.setUp()
        
        scheduler = TestScheduler(
            initialClock: 0,
            resolution: 0.1,
            simulateProcessingDelay: false
        )
        
        input = .never()
    }
    
    override func tearDown() {
        super.tearDown()
        
        input = nil
        scheduler = nil
        
    }
    
    func test__it_shows_hello_world_when_button_tapped() {
        input = with(input) {
            $0 = scheduler.createHotObservable([.next(5, ())]).asObservable()
        }
        
        let output = viewModel(input)
        let text = scheduler.record(source: output)
        
        scheduler.start()
        
        XCTAssertEqual(text.events, [.next(5, "Hello World!")])
    }
}
