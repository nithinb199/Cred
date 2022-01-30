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
    let fundingLabel                = CRTitleLabel(textAlignment: .left, fontSize: 24, titleColor: .white)
    let linkLabel                   = CRBodyLabel(titleColor: .white, font: UIFont.systemFont(ofSize: 24))
    
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
        configureTitleLabels()
    }
    
    @objc func addAmount(){
        print("Amount deposited")
    }
    
    func createPanGestureRecognizer(){
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(self.handleGesture(_:)))
        panGestureView.addGestureRecognizer(panGesture)
    }
    
    func setButtonAndCounter(updateCounter: Bool, enableButton: Bool,buttonOpacity:Float){
        DispatchQueue.main.async {
            if updateCounter {self.amountLabel.text = "$\(self.counter)"}
            self.addAmountButton.isUserInteractionEnabled   = enableButton
            self.addAmountButton.layer.opacity              = buttonOpacity
        }
    }
    
    @objc func handleGesture(_ sender: UIPanGestureRecognizer){
        switch sender.state{
            case .changed:
                if sender.velocity(in: panGestureView).x > 0 {
                    counter += 5
                    setButtonAndCounter(updateCounter: true, enableButton: true, buttonOpacity: 1)
                } else if counter > 0{
                    counter -= 5
                    setButtonAndCounter(updateCounter: true, enableButton: true, buttonOpacity: 1)
                }
            default:
                break
        }
        if counter == 0 {
            setButtonAndCounter(updateCounter: false, enableButton: false, buttonOpacity: 0.5)
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
    
    func configureTitleLabels(){
        view.addSubview(fundingLabel)
        view.addSubview(linkLabel)
        fundingLabel.text = "funding"
        linkLabel.text = "link"
        NSLayoutConstraint.activate([
            fundingLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 40),
            fundingLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            linkLabel.leadingAnchor.constraint(equalTo: fundingLabel.trailingAnchor),
            linkLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 40)
        ])
    }
}
extension AddMoneyVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewData[section].celldata.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DepositDetailsCell.reuseID, for: indexPath as IndexPath) as! DepositDetailsCell
        cell.set(cellData: tableViewData[indexPath.section].celldata[indexPath.row])
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewData.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return tableViewData[section].header
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        header.textLabel?.textColor = .black
    }
}
