//
//  ViewModel.swift
//  RxTestable
//
//  Created by Alperen Duran on 23.12.2019.
//  Copyright © 2019 Alperen Duran. All rights reserved.
//

import RxSwift
import RxCocoa

typealias Input = Observable<Void>

typealias Output = Driver<String>

typealias ViewModel = (Input) -> Output

func viewModel(input: Input) -> Output {
    let output = input
        .map { "Hello World!" }
        .asDriver(onErrorDriveWith: .never())
    
    return output
}
