//
//  TestHelpers.swift
//  RxTestableTests
//
//  Created by Alperen Duran on 3.02.2020.
//  Copyright © 2020 Alperen Duran. All rights reserved.
//

import RxTest
import RxSwift

extension TestScheduler {
    /// Builds testable observer for s specific observable sequence, binds it's results and sets up disposal.
    /// parameter source: Observable sequence to observe.
    /// returns: Observer that records all events for observable sequence.
    func record<Source: ObservableConvertibleType>(source: Source) -> TestableObserver<Source.Element> {
        let observer = self.createObserver(Source.Element.self)
        let disposable = source.asObservable().bind(to: observer)
        self.scheduleAt(100000) {
            disposable.dispose()
        }
        return observer
    }
}
