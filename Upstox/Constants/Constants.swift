//
//  Constants.swift
//  Upstox
//
//  Created by Sachin Sabat on 23/02/23.
//

import Foundation

// MARK:- TableViewCellsId's
internal enum TableViewCellsIds: String {
    case homeScreenTableViewCell = "HomeScreenTableViewCell"
}

// MARK:- Navigation Title's
internal enum NavigationHeaderTitle: String {
    case homeScreenTitle = "Upstox Holding"
}

// MARK:- Navigation Title's
internal enum Strings: String {
    case ltpRupees = "LTP: ₹"
    case plRupees = "P/L: ₹"
    case currentValue = "Current Value:"
    case totalInvestment = "Total Investment:"
    case todaysPnL = "Today's Profit & Loss:"
    case profitNLoss = "Profit & Loss:"
    case alert = "Alert"
    case retry = "Retry"
    case noValue = "-"
    case rupeeSymbol = "₹"
}

//MARK:- Constraint Constants
internal enum ConstraintConstants: CGFloat {
    case number40 = 40.0
    case number25 = 25.0
    case number20 = 20.0
    case number15 = 15.0
    case number10 = 10.0
    case number5 = 5.0
    case number0 = 0.0
}

// MARK:- Enum Font name
enum FontName: String {
    case helveticaBold = "HelveticaNeue-Bold"
    case helvetica = "HelveticaNeue"
}
