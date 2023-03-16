//
//  HomeScreenProtocol.swift
//  Upstox
//
//  Created by Sachin Sabat on 24/02/23.
//

//Blueprint of whole home screen module
protocol HomeScreenViewModelOutput: AnyObject {
    func updateData()
    func showAlert(alert: String)
}

protocol HomeScreenViewModelInput: AnyObject {
    var view: HomeScreenViewModelOutput? {get set}
    func getHomeScreenData()
    func getNumberOfRows() -> Int
    func getDataForParticularRow(indexPathforRow: Int) -> DataVM
    func getAllCurrentValue() -> Double
    func getAllInvestentValue() -> Double
    func getTotalPnL() -> Double
    func getTodaysPnL() -> Double 
}

