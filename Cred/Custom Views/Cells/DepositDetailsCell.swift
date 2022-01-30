//
//  DepositDetailsCell.swift
//  Cred
//
//  Created by Nithin B on 28/01/22.
//

import UIKit

class DepositDetailsCell: UITableViewCell {
    
    static let reuseID = "DepositDetailsCell"
    let blackLabel = CRBodyLabel(titleColor: .secondaryLabel, font: nil)
    let pinkLabel = CRBodyLabel(titleColor: UIColor(red: 234/255, green: 0, blue: 1, alpha: 1), font: nil)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        addSubview(blackLabel)
        addSubview(pinkLabel)
        NSLayoutConstraint.activate([
            blackLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            blackLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor,constant: 22),
            pinkLabel.leadingAnchor.constraint(equalTo: blackLabel.trailingAnchor),
            pinkLabel.centerYAnchor.constraint(equalTo: blackLabel.centerYAnchor)
        ])
    }
    
    func set(cellData: CellData){
        self.blackLabel.text = cellData.blackLabel
        self.pinkLabel.text = cellData.pinkLabel
    }

}
