//
//  View.swift
//  RxTestable
//
//  Created by Alperen Duran on 23.12.2019.
//  Copyright © 2019 Alperen Duran. All rights reserved.
//

import UIKit
import Cartography

final class View: UIView {
    
    lazy var button = with(UIButton(type: .custom)) {
        $0.setTitle("Button", for: .normal)
        $0.setTitleColor(.black, for: .normal)
    }
    
    lazy var label = with(UILabel()) {
        $0.font = .boldSystemFont(ofSize: 20)
        $0.textColor = .black
    }
    
    lazy var stackView: UIStackView = {
        let arrangedSubViews = [button, label]
        let stackView: UIStackView = .create(
            arrangedSubViews: arrangedSubViews
        )
        
        return stackView
    }()
    
    
    init() {
        super.init(frame: .zero)
        
        backgroundColor = .white
       
        addSubview(stackView)
        
        constrain(stackView) {
            $0.edges == $0.superview!.edges.inseted(by: 50.0)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
