//
//  CRBodyLabel.swift
//  Cred
//
//  Created by Nithin B on 28/01/22.
//

import UIKit

class CRBodyLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(titleColor: UIColor, font: UIFont?){
        super.init(frame: .zero)
        self.textColor      = titleColor
        self.font           = font ?? UIFont.systemFont(ofSize: 16)
        configure()
    }
    
    private func configure(){
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor        = 0.9
        lineBreakMode             = .byTruncatingTail
        textAlignment             = .left
        translatesAutoresizingMaskIntoConstraints = false
    }

}
