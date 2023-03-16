//
//  FooterView.swift
//  Upstox
//
//  Created by Sachin Sabat on 24/02/23.
//

import UIKit

final class FooterView: UIView {
    
    //MARK:- Properties
    private lazy var lblCurrentValueText: UILabel = {
        let lblCurrentValueText = UILabel()
        lblCurrentValueText.font = UIFont(name: FontName.helveticaBold.rawValue, size: 18.0)
        lblCurrentValueText.text = Strings.currentValue.rawValue
        return lblCurrentValueText
    }()
    
    lazy var lblCurrentValue: UILabel = {
        let lblCurrentValue = UILabel()
        lblCurrentValue.font = UIFont(name: FontName.helvetica.rawValue, size: 16.0)
        lblCurrentValue.textAlignment = .right
        return lblCurrentValue
    }()
    
    private lazy var lblTotalInvestmentText: UILabel = {
        let lblTotalInvestmentText = UILabel()
        lblTotalInvestmentText.font = UIFont(name: FontName.helveticaBold.rawValue, size: 18.0)
        lblTotalInvestmentText.text = Strings.totalInvestment.rawValue
        return lblTotalInvestmentText
    }()
    
    lazy var lblTotalInvestmentValue: UILabel = {
        let lblTotalInvestmentValue = UILabel()
        lblTotalInvestmentValue.font = UIFont(name: FontName.helvetica.rawValue, size: 16.0)
        lblTotalInvestmentValue.textAlignment = .right
        return lblTotalInvestmentValue
    }()
    
    private lazy var lblTodaysProfitnLossText: UILabel = {
        let lblTodaysProfitnLossText = UILabel()
        lblTodaysProfitnLossText.font = UIFont(name: FontName.helveticaBold.rawValue, size: 18.0)
        lblTodaysProfitnLossText.text = Strings.todaysPnL.rawValue
        return lblTodaysProfitnLossText
    }()
    
    lazy var lblTodaysProfitnLossValue: UILabel = {
        let lblTodaysProfitnLossValue = UILabel()
        lblTodaysProfitnLossValue.font = UIFont(name: FontName.helvetica.rawValue, size: 16.0)
        lblTodaysProfitnLossValue.textAlignment = .right
        return lblTodaysProfitnLossValue
    }()


    private lazy var lblProfitNLossText: UILabel = {
        let lblProfitNLossText = UILabel()
        lblProfitNLossText.font = UIFont(name: FontName.helveticaBold.rawValue, size: 18.0)
        lblProfitNLossText.text = Strings.profitNLoss.rawValue
        return lblProfitNLossText
    }()
    
    lazy var lblProfitNLossValue: UILabel = {
        let lblProfitNLossValue = UILabel()
        lblProfitNLossValue.font = UIFont(name: FontName.helvetica.rawValue, size: 16.0)
        lblProfitNLossValue.textAlignment = .right
        return lblProfitNLossValue
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    private func setupUI() {
        addAllSubViews()
        applyTranslatesAutoresizingMaskIntoConstraints()
        applyConstraintToAddedSubViews()
    }

    private func addAllSubViews() {
        self.addSubview(lblCurrentValueText)
        self.addSubview(lblCurrentValue)
        self.addSubview(lblTotalInvestmentText)
        self.addSubview(lblTotalInvestmentValue)
        self.addSubview(lblTodaysProfitnLossText)
        self.addSubview(lblTodaysProfitnLossValue)
        self.addSubview(lblProfitNLossText)
        self.addSubview(lblProfitNLossValue)
    }
    
    private func applyTranslatesAutoresizingMaskIntoConstraints() {
        lblProfitNLossValue.translatesAutoresizingMaskIntoConstraints = false
        lblProfitNLossText.translatesAutoresizingMaskIntoConstraints = false
        lblTodaysProfitnLossValue.translatesAutoresizingMaskIntoConstraints = false
        lblTodaysProfitnLossText.translatesAutoresizingMaskIntoConstraints = false
        lblTotalInvestmentText.translatesAutoresizingMaskIntoConstraints = false
        lblTotalInvestmentValue.translatesAutoresizingMaskIntoConstraints = false
        lblCurrentValueText.translatesAutoresizingMaskIntoConstraints = false
        lblCurrentValue.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func applyConstraintToAddedSubViews() {
        // Current Value Static label
        lblCurrentValueText.topAnchor.constraint(equalTo: self.topAnchor, constant: ConstraintConstants.number20.rawValue).isActive = true
        lblCurrentValueText.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: ConstraintConstants.number20.rawValue).isActive = true
        lblCurrentValueText.trailingAnchor.constraint(equalTo: self.lblCurrentValue.leadingAnchor, constant: ConstraintConstants.number5.rawValue).isActive = true
        
        // Current Value label
        lblCurrentValue.topAnchor.constraint(equalTo: self.topAnchor, constant: ConstraintConstants.number20.rawValue).isActive = true
        lblCurrentValue.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -ConstraintConstants.number20.rawValue).isActive = true
        
        // Total Investment Static label
        lblTotalInvestmentText.topAnchor.constraint(equalTo: self.lblCurrentValueText.bottomAnchor, constant: ConstraintConstants.number5.rawValue).isActive = true
        lblTotalInvestmentText.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: ConstraintConstants.number20.rawValue).isActive = true
        lblTotalInvestmentText.trailingAnchor.constraint(equalTo: self.lblTotalInvestmentValue.leadingAnchor, constant: ConstraintConstants.number5.rawValue).isActive = true
        
        // Total Investment Value label
        lblTotalInvestmentValue.topAnchor.constraint(equalTo: self.lblCurrentValue.bottomAnchor, constant: ConstraintConstants.number10.rawValue).isActive = true
        lblTotalInvestmentValue.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -ConstraintConstants.number20.rawValue).isActive = true
        
        // Todays Profit and Loss Static label
        lblTodaysProfitnLossText.topAnchor.constraint(equalTo: self.lblTotalInvestmentText.bottomAnchor, constant: ConstraintConstants.number10.rawValue).isActive = true
        lblTodaysProfitnLossText.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: ConstraintConstants.number20.rawValue).isActive = true
        lblTodaysProfitnLossText.trailingAnchor.constraint(equalTo: self.lblTodaysProfitnLossValue.leadingAnchor, constant: ConstraintConstants.number5.rawValue).isActive = true
        
        // Todays Profit and Loss Value label
        lblTodaysProfitnLossValue.topAnchor.constraint(equalTo: self.lblTotalInvestmentValue.bottomAnchor, constant: ConstraintConstants.number10.rawValue).isActive = true
        lblTodaysProfitnLossValue.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -ConstraintConstants.number20.rawValue).isActive = true
        
        // Profit and Loss Static label
        lblProfitNLossText.topAnchor.constraint(equalTo: self.lblTodaysProfitnLossText.bottomAnchor, constant: ConstraintConstants.number25.rawValue).isActive = true
        lblProfitNLossText.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: ConstraintConstants.number20.rawValue).isActive = true
        lblProfitNLossText.trailingAnchor.constraint(equalTo: self.lblProfitNLossValue.leadingAnchor, constant: ConstraintConstants.number5.rawValue).isActive = true
        
        // Profit and Loss Value label
        lblProfitNLossValue.topAnchor.constraint(equalTo: self.lblTodaysProfitnLossValue.bottomAnchor, constant: ConstraintConstants.number25.rawValue).isActive = true
        lblProfitNLossValue.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -ConstraintConstants.number20.rawValue).isActive = true

        lblProfitNLossText.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -ConstraintConstants.number40.rawValue).isActive = true
    }

}
