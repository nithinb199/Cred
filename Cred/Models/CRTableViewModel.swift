//
//  CRTableViewModel.swift
//  Cred
//
//  Created by Nithin B on 30/01/22.
//

import Foundation

struct CRTableViewModel{
    let header: String
    let celldata: [CellData]
}

struct CellData{
    let blackLabel : String
    let pinkLabel : String
}
func getDummyData () -> [CRTableViewModel]{
    let data: [CRTableViewModel] = [
        CRTableViewModel(header: "deposit speed", celldata: [
            CellData(blackLabel: "standard (1-3 days) max $2000 - ", pinkLabel: "enable"),
            CellData(blackLabel: "convenience (instant) max $250", pinkLabel: "")
        ]),
        CRTableViewModel(header: "deposit from", celldata: [
            CellData(blackLabel: "", pinkLabel: "click to enable standard deposits")
        ])
    ]
    return data
}
