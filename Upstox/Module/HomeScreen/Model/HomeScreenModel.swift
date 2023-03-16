//
//  HomeScreenModel.swift
//  Upstox
//
//  Created by Sachin Sabat on 24/02/23.
//

import Foundation

struct HomescreenModel: Decodable {
    let data: [DataVM]?
}

struct DataVM : Decodable {
    let quantity: Double?
    let symbol: String?
    let ltp: Double?
    let avg_price: String?
    let close: Double?
    
    private(set) var currentIndValue: Double = 0.0
    private(set) var investmentIndValue: Double = 0.0
    private(set) var profitNLoss: Double = 0.0
    
    enum CodingKeys: String, CodingKey {
        case quantity , symbol, ltp, avg_price, close
    }
    
    //MARK:- init to set value for current, investment and profit and loss
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        quantity = try container.decode(Double.self, forKey: .quantity)
        symbol = try container.decode(String.self, forKey: .symbol)
        ltp = try container.decode(Double.self, forKey: .ltp)
        avg_price = try container.decode(String.self, forKey: .avg_price)
        close = try container.decode(Double.self, forKey: .close)
        
        // Calculations to store Current, Investment & ProfitNLoss value
        if let ltp = self.ltp, let quantity = self.quantity {
            self.currentIndValue = ltp * quantity
        }
        if let avg_price = self.avg_price, let doubleAvgPrice = Double(avg_price), let quantity = self.quantity {
            self.investmentIndValue = doubleAvgPrice - quantity
        }
        self.profitNLoss = self.currentIndValue - self.investmentIndValue
    }
    
}

