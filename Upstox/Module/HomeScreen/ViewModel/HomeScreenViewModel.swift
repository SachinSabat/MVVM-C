//
//  HomeScreenViewModel.swift
//  Upstox
//
//  Created by Sachin Sabat on 24/02/23.
//

import Foundation

final class DashboardViewModel: HomeScreenViewModelInput {
        
    //MARK: Properties
    weak var view: HomeScreenViewModelOutput?

    private let network: NetworkClient
    private(set) var data = [DataVM]()
    
    //MARK: Initializer
    init(network: NetworkClient = NetworkClient()) {
        self.network = network
    }
    
    //MARK: Methods
    func getHomeScreenData() {
        let model = APIRequestModel(api: UpstoxAPIs.getHomeScreen)
        _ = network.dataRequest(model, objectType: HomescreenModel.self) { [weak self] (result: Result<HomescreenModel, NetworkError>) in
            guard let self = self else {return}
            switch result {
            case let .success(response):
                self.updateDataArray(response)
            case let .failure(error):
                self.view?.showAlert(alert: error.localizedDescription)
            }
        }
    }
    
    private func updateDataArray(_ homeScreenModel: HomescreenModel) {
        guard let data = homeScreenModel.data else {return}
        self.data = data
        self.view?.updateData()
    }
    
    //MARK: TableView Protocol methods
    func getNumberOfRows() -> Int {
        return data.count
    }
    
    func getDataForParticularRow(indexPathforRow: Int) -> DataVM {
        return data[indexPathforRow]
    }
    
    //MARK: FooterView Calculations Func
    func getAllCurrentValue() -> Double {
        let allCurrentValue = data.lazy.compactMap({
            $0.currentIndValue
        }).reduce(0, +)
        return allCurrentValue.roundToDecimal(2)
    }
    
    func getAllInvestentValue() -> Double {
        let allInvestmentValue = data.lazy.compactMap({
            $0.investmentIndValue
        }).reduce(0, +)
        return allInvestmentValue.roundToDecimal(2)
    }
    
    func getTotalPnL() -> Double {
        let currentValue = getAllCurrentValue()
        let investmentValue = getAllInvestentValue()
        let totalPnL = currentValue - investmentValue
        return totalPnL.roundToDecimal(2)
    }
    
    func getTodaysPnL() -> Double {
        let sumOfClose = self.getSumOfClose()
        let sumOfLTP = self.getSumOfLTP()
        let sumOfQuantity = self.getSumOfQuantity()
        
        let todaysPnL = (sumOfClose - sumOfLTP) * sumOfQuantity
        return todaysPnL.roundToDecimal(2)
    }
    
    //MARK: Todays PnL Calculations Func
    private func getSumOfClose() -> Double {
        let sumOfClose = data.lazy.compactMap({
            $0.close
        }).reduce(0, +)
        return sumOfClose
    }
    
    private func getSumOfLTP() -> Double {
        let sumOfLTP = data.lazy.compactMap({
            $0.ltp
        }).reduce(0, +)
        return sumOfLTP
    }
    
    private func getSumOfQuantity() -> Double {
        let sumOfQuantity = data.lazy.compactMap({
            $0.quantity
        }).reduce(0, +)
        return sumOfQuantity
    }
}
