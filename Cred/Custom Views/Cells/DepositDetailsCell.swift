//
//  DepositDetailsCell.swift
//  Cred
//
//  Created by Nithin B on 28/01/22.
//

import UIKit

class DepositDetailsCell: UITableViewCell {
    
    static let reuseID = "DepositDetailsCell"
    let blackLabel = CRBodyLabel(titleColor: .secondaryLabel)
    let pinkLabel = CRBodyLabel(titleColor: UIColor(red: 234/255, green: 0, blue: 1, alpha: 1))

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
    
    func displayText(cell:DepositDetailsCell, row: Int, section: Int) -> DepositDetailsCell{
        if section == 0{
            switch row {
                case 0:
                    cell.blackLabel.text = "standard (1-3 days) max $2000 - "
                    cell.pinkLabel.text = "enable"
                case 1:
                    cell.blackLabel.text = "convenience (instant) max $250"
                default:
                    return cell
            }
        }else {
            cell.pinkLabel.text = "click to enable standard deposits"
        }
        return cell
    }

}
