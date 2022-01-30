//
//  AmountLabel.swift
//  Cred
//
//  Created by Nithin B on 28/01/22.
//

import UIKit

class CRTitleLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(textAlignment: NSTextAlignment, fontSize: CGFloat, titleColor: UIColor){
        super.init(frame: .zero)
        self.textAlignment  = textAlignment
        self.font           = UIFont.systemFont(ofSize: fontSize, weight: .bold)
        self.textColor      = titleColor
        configure()
    }
    
    private func configure(){
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor        = 0.5
        lineBreakMode             = .byTruncatingTail
        translatesAutoresizingMaskIntoConstraints = false
    }

}
