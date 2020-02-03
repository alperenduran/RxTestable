//
//  ViewController.swift
//  RxTestable
//
//  Created by Alperen Duran on 23.12.2019.
//  Copyright © 2019 Alperen Duran. All rights reserved.
//

import UIKit
import RxSwift

class ViewController: UIViewController {

    private lazy var viewSource = View()
    let bag = DisposeBag()
    let viewModel: ViewModel
    
    init(with viewModel: @escaping ViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = viewSource
        view.backgroundColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindViewModelOutputs()
    }
    
    private func bindViewModelOutputs() {
        let output = viewModel(input)
        
        bag.insert(
            output.drive(viewSource.label.rx.text)
        )
    }
    
    private var input: Input {
        viewSource.button.rx.tap
            .asObservable()
    }
}

