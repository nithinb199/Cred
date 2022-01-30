//
//  AddMoneyVC.swift
//  Cred
//
//  Created by Nithin B on 27/01/22.
//

import UIKit

class AddMoneyVC: UIViewController {
    
    let panGestureView              = UIView()
    let addAmountButton             = CRButton(title: "deposit amount shown")
    let amountLabel                 = CRTitleLabel(textAlignment: .center, fontSize: 150, titleColor: .white)
    let depositDetaiilsTableView    = UITableView()
    
    var counter                     = 0
    var tableViewData: [CRTableViewModel] = getDummyData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configurePanGestureView()
        configureAddAmountButton()
        configureAmountLabel()
        configureTableView()
        createPanGestureRecognizer()
    }
    
    @objc func addAmount(){
        print("Amount deposited")
    }
    
    func createPanGestureRecognizer(){
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(self.handleGesture(_:)))
        panGestureView.addGestureRecognizer(panGesture)
    }
    
    @objc func handleGesture(_ sender: UIPanGestureRecognizer){
        switch sender.state{
            case .changed:
                if sender.velocity(in: panGestureView).x > 0 {
                    counter += 5
                    DispatchQueue.main.async {
                        self.amountLabel.text                           = "$\(self.counter)"
                        self.addAmountButton.isUserInteractionEnabled   = true
                        self.addAmountButton.layer.opacity              = 1
                    }
                } else if counter > 0{
                    counter -= 5
                    DispatchQueue.main.async {
                        self.amountLabel.text                           = "$\(self.counter)"
                        self.addAmountButton.isUserInteractionEnabled   = true
                        self.addAmountButton.layer.opacity              = 1
                    }
                }
            default:
                break
        }
        if counter == 0 {
            DispatchQueue.main.async {
                self.addAmountButton.isUserInteractionEnabled   = false
                self.addAmountButton.layer.opacity              = 0.5
            }
        }
    }
    
    func configurePanGestureView(){
        view.addSubview(panGestureView)
        panGestureView.backgroundColor                              = .systemBlue
        panGestureView.isUserInteractionEnabled                     = true
        panGestureView.translatesAutoresizingMaskIntoConstraints    = false
        let panGestureHeight                                        = self.view.frame.size.height/2
        NSLayoutConstraint.activate([
            panGestureView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            panGestureView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            panGestureView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            panGestureView.heightAnchor.constraint(equalToConstant: panGestureHeight)
        ])
    }
    
    func configureAddAmountButton(){
        view.addSubview(addAmountButton)
        addAmountButton.isUserInteractionEnabled    = false
        addAmountButton.layer.opacity               = 0.5
        addAmountButton.addTarget(self, action: #selector(addAmount), for: .touchUpInside)
        NSLayoutConstraint.activate([
            addAmountButton.topAnchor.constraint(equalTo: panGestureView.bottomAnchor, constant: 20),
            addAmountButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            addAmountButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            addAmountButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    
    func configureAmountLabel(){
        panGestureView.addSubview(amountLabel)
        amountLabel.text = "$\(counter)"
        NSLayoutConstraint.activate([
            amountLabel.leadingAnchor.constraint(equalTo: panGestureView.leadingAnchor, constant: 20),
            amountLabel.trailingAnchor.constraint(equalTo: panGestureView.trailingAnchor, constant: -20),
            amountLabel.centerYAnchor.constraint(equalTo: panGestureView.centerYAnchor)
        ])
    }
    
    func configureTableView(){
        self.view.addSubview(depositDetaiilsTableView)
        depositDetaiilsTableView.showsVerticalScrollIndicator   = false
        depositDetaiilsTableView.delegate                       = self
        depositDetaiilsTableView.dataSource                     = self
        depositDetaiilsTableView.rowHeight                      = 50
        depositDetaiilsTableView.translatesAutoresizingMaskIntoConstraints = false
        depositDetaiilsTableView.register(DepositDetailsCell.self, forCellReuseIdentifier: DepositDetailsCell.reuseID)
        NSLayoutConstraint.activate([
            depositDetaiilsTableView.topAnchor.constraint(equalTo: addAmountButton.bottomAnchor, constant: 10),
            depositDetaiilsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            depositDetaiilsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            depositDetaiilsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            
        ])
    }
}
extension AddMoneyVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
            case 0:
                return 2
            case 1:
                return 1
            default: return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DepositDetailsCell.reuseID, for: indexPath as IndexPath) as! DepositDetailsCell
        let cellToDisplay = cell.displayText(cell: cell, row: indexPath.row, section: indexPath.section)
        return cellToDisplay
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
            case 0:
                return "deposit speed"
            case 1:
                return "deposit from"
            default:
                return ""
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        header.textLabel?.textColor = .black
    }
}
