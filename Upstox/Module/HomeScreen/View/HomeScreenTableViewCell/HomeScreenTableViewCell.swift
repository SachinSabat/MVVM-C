//
//  HomeScreenTableViewCell.swift
//  Upstox
//
//  Created by Sachin Sabat on 23/02/23.
//

import UIKit

final class HomeScreenTableViewCell: UITableViewCell {
    
    //MARK:- Properties
    private lazy var lblSymbol: UILabel = {
        let lblSymbol = UILabel()
        lblSymbol.font = UIFont(name: FontName.helveticaBold.rawValue, size: 18.0)
        lblSymbol.translatesAutoresizingMaskIntoConstraints = false
        return lblSymbol
    }()
    
    private lazy var lblQuantity: UILabel = {
        let lblQuantity = UILabel()
        lblQuantity.font = UIFont(name: FontName.helvetica.rawValue, size: 16.0)
        lblQuantity.translatesAutoresizingMaskIntoConstraints = false
        return lblQuantity
    }()
    
    private lazy var lblLTPStaticText: UILabel = {
        let lblLTPStaticText = UILabel()
        lblLTPStaticText.font = UIFont(name: FontName.helvetica.rawValue, size: 16.0)
        lblLTPStaticText.text = Strings.ltpRupees.rawValue
        lblLTPStaticText.translatesAutoresizingMaskIntoConstraints = false
        return lblLTPStaticText
    }()
    
    private lazy var lblLTPValue: UILabel = {
        let lblLTPValue = UILabel()
        lblLTPValue.font = UIFont(name: FontName.helvetica.rawValue, size: 16.0)
        lblLTPValue.translatesAutoresizingMaskIntoConstraints = false
        return lblLTPValue
    }()
    
    private lazy var lblPLStaticText: UILabel = {
        let lblPLStaticText = UILabel()
        lblPLStaticText.font = UIFont(name: FontName.helvetica.rawValue, size: 16.0)
        lblPLStaticText.text = Strings.plRupees.rawValue
        lblPLStaticText.translatesAutoresizingMaskIntoConstraints = false
        return lblPLStaticText
    }()
    
    private lazy var lblPLValue: UILabel = {
        let lblPLValue = UILabel()
        lblPLValue.font = UIFont(name: FontName.helvetica.rawValue, size: 16.0)
        lblPLValue.translatesAutoresizingMaskIntoConstraints = false
        lblPLValue.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return lblPLValue
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.contentView.backgroundColor = .white
        self.setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init? coder not implemented")
    }
    
    private func setupUI() {
        addAllSubViews()
        applyConstraintToAddedSubViews()
    }
    
    private func addAllSubViews() {
        self.contentView.addSubview(lblSymbol)
        self.contentView.addSubview(lblQuantity)
        self.contentView.addSubview(lblLTPStaticText)
        self.contentView.addSubview(lblLTPValue)
        self.contentView.addSubview(lblPLStaticText)
        self.contentView.addSubview(lblPLValue)
    }
    
    private func applyConstraintToAddedSubViews() {
        // Symbol value text label
        lblSymbol.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: ConstraintConstants.number15.rawValue).isActive = true
        lblSymbol.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: ConstraintConstants.number20.rawValue).isActive = true
        lblSymbol.trailingAnchor.constraint(equalTo: self.lblLTPStaticText.leadingAnchor, constant: -ConstraintConstants.number5.rawValue).isActive = true
        
        // LTP static text label
        lblLTPStaticText.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: ConstraintConstants.number15.rawValue).isActive = true
        lblLTPStaticText.trailingAnchor.constraint(equalTo: self.lblLTPValue.leadingAnchor, constant: ConstraintConstants.number0.rawValue).isActive = true
        
        // LTP value text label
        lblLTPValue.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: ConstraintConstants.number15.rawValue).isActive = true
        lblLTPValue.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -ConstraintConstants.number20.rawValue).isActive = true
        
        // Quantity value text label
        lblQuantity.topAnchor.constraint(equalTo: self.lblSymbol.bottomAnchor, constant: ConstraintConstants.number5.rawValue).isActive = true
        lblQuantity.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: ConstraintConstants.number20.rawValue).isActive = true
        lblQuantity.trailingAnchor.constraint(equalTo: self.lblPLStaticText.leadingAnchor, constant: -ConstraintConstants.number5.rawValue).isActive = true
        lblQuantity.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -ConstraintConstants.number15.rawValue).isActive = true
        
        // PL static text label
        lblPLStaticText.topAnchor.constraint(equalTo: self.lblLTPStaticText.bottomAnchor, constant: ConstraintConstants.number10.rawValue).isActive = true
        lblPLStaticText.trailingAnchor.constraint(equalTo: self.lblPLValue.leadingAnchor, constant: ConstraintConstants.number0.rawValue).isActive = true
       
        // PL static text label
        lblPLValue.topAnchor.constraint(equalTo: self.lblLTPValue.bottomAnchor, constant: ConstraintConstants.number10.rawValue).isActive = true
        lblPLValue.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -ConstraintConstants.number20.rawValue).isActive = true
    }
    
    //MARK:- SetData for text
    func setData(data: DataVM) {
        lblSymbol.text = data.symbol
        if let quantity = data.quantity {
            lblQuantity.text = "\(Int(quantity))"
        } else {
            lblQuantity.text = Strings.noValue.rawValue
        }
        if let ltp = data.ltp {
            lblLTPValue.text = "\(ltp.roundToDecimal(2))"
        } else {
            lblLTPValue.text = Strings.noValue.rawValue
        }
        lblPLValue.text = "\(data.profitNLoss.roundToDecimal(2))"
    }
}
