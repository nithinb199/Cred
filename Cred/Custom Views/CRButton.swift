//
//  CRButton.swift
//  Cred
//
//  Created by Nithin B on 28/01/22.
//

import UIKit

class CRButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(title: String){
        super.init(frame: .zero)
        self.setTitle(title, for: .normal)
        configure()
    }
    
    private func configure(){
        layer.cornerRadius          = 10
        layer.borderWidth           = 0.75
        titleLabel?.font            = UIFont.preferredFont(forTextStyle: .headline)
        setTitleColor(.black, for: .normal)
        translatesAutoresizingMaskIntoConstraints = false
    }

}
