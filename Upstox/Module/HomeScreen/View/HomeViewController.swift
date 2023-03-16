//
//  ViewController.swift
//  Upstox
//
//  Created by Sachin Sabat on 23/02/23.
//

import UIKit

final class ViewController: UIViewController {
    
    //MARK: Properties
    var viewModel: HomeScreenViewModelInput = DashboardViewModel()

    private var activityLoader: UIActivityIndicatorView = {
        let activityLoader = UIActivityIndicatorView()
        return activityLoader
    }()
    
    private lazy var activityLoaderView: UIView = {
        let activityLoaderView = UIView(frame: UIScreen.main.bounds)
        activityLoaderView.addSubview(activityLoader)
        activityLoaderView.backgroundColor = .lightGray.withAlphaComponent(0.8)
        activityLoader.translatesAutoresizingMaskIntoConstraints = false
        activityLoader.centerXAnchor.constraint(equalTo: activityLoaderView.centerXAnchor).isActive = true
        activityLoader.centerYAnchor.constraint(equalTo: activityLoaderView.centerYAnchor).isActive = true
        activityLoader.heightAnchor.constraint(equalToConstant: ConstraintConstants.number40.rawValue).isActive = true
        activityLoader.widthAnchor.constraint(equalToConstant: ConstraintConstants.number40.rawValue).isActive = true
        return activityLoaderView
    }()
    
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.register(HomeScreenTableViewCell.self, forCellReuseIdentifier: TableViewCellsIds.homeScreenTableViewCell.rawValue)
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = .lightGray
        return tableView
    }()
    
    private lazy var uiFooterView: FooterView = {
        let uiView = FooterView()
        return uiView
    }()
    
    //MARK: Lifecycle Methods
    override func loadView() {
        super.loadView()
        let view = UIView()
        view.backgroundColor = .white
        self.view = view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationTitle()
        setUpTableView()
        setupFooterView()
        setupViewModel()
    }
    
    //MARK: Methods
    private func setUpNavigationTitle() {
        self.navigationItem.title = NavigationHeaderTitle.homeScreenTitle.rawValue
    }
    
    //MARK: Setup TableView
    private func setUpTableView() {
        self.view.addSubview(tableView)
        self.view.addSubview(uiFooterView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        uiFooterView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: ConstraintConstants.number0.rawValue).isActive = true
        tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: ConstraintConstants.number0.rawValue).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: ConstraintConstants.number0.rawValue).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.uiFooterView.topAnchor, constant: ConstraintConstants.number0.rawValue).isActive = true
    }
    
    private func setupFooterView() {
        uiFooterView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: ConstraintConstants.number0.rawValue).isActive = true
        uiFooterView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: ConstraintConstants.number0.rawValue).isActive = true
        uiFooterView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: ConstraintConstants.number0.rawValue).isActive = true
    }
    
    //MARK: Setup ViewModel
    private func setupViewModel() {
        loader(startAnimating: true)
        viewModel.view = self
        viewModel.getHomeScreenData()
    }
}

//MARK: Table DataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getNumberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellsIds.homeScreenTableViewCell.rawValue, for: indexPath) as? HomeScreenTableViewCell else {
            return tableView.dequeueReusableCell(withIdentifier: TableViewCellsIds.homeScreenTableViewCell.rawValue, for: indexPath)
        }
        let data = self.viewModel.getDataForParticularRow(indexPathforRow: indexPath.row)
        cell.setData(data: data)
        return cell
    }
    
}

//MARK: Delegates of the API - HomeScreenViewModelOutput
extension ViewController: HomeScreenViewModelOutput {
    func updateData() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {return}
            self.updateFooterViewData()
            self.loader(startAnimating: false)
            self.tableView.reloadData()
        }
    }
    
    func showAlert(alert: String) {
        self.showAlertWith(message: alert)
    }
    
}

//MARK: Assign data to the foorter view labels
private extension ViewController {
    private func updateFooterViewData() {
        uiFooterView.lblCurrentValue.text = Strings.rupeeSymbol.rawValue + "\(viewModel.getAllCurrentValue())"
        uiFooterView.lblTotalInvestmentValue.text = Strings.rupeeSymbol.rawValue + "\(viewModel.getAllInvestentValue())"
        uiFooterView.lblProfitNLossValue.text = Strings.rupeeSymbol.rawValue + "\(viewModel.getTotalPnL())"
        uiFooterView.lblTodaysProfitnLossValue.text = Strings.rupeeSymbol.rawValue + "\(viewModel.getTodaysPnL())"
    }
}

private extension ViewController {
    private func showAlertWith(message: String) {
        DispatchQueue.main.async { [weak self] in
            self?.loader(startAnimating: false)
            let alert = UIAlertController(title: Strings.alert.rawValue, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: Strings.retry.rawValue, style: .destructive, handler: {_ in
                self?.viewModel.getHomeScreenData()
            }))
            self?.present(alert, animated: true, completion: nil)
        }
    }
    
    private func loader(startAnimating: Bool) {
        if startAnimating {
            self.view.addSubview(activityLoaderView)
            activityLoader.startAnimating()
        } else {
            activityLoader.stopAnimating()
            activityLoaderView.removeFromSuperview()
        }
    }
}
