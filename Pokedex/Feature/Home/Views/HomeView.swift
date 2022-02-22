//
//  HomeView.swift
//  Pokedex
//
//  Created by M A Russel on 13/9/21.
//

import UIKit

final class HomeView: BoundView<HomeViewModel> {
    
    var onSelectionEvent: ((String) -> Void)?
    
    private(set) lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.estimatedRowHeight = 40
        tableView.register(HomeTableViewCell.self, forCellReuseIdentifier: HomeTableViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func setupViews() {
        super.setupViews()
        
        addSubview(tableView)
    }
    
    override func setupLayouts() {
        super.setupLayouts()
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leftAnchor.constraint(equalTo: leftAnchor),
            tableView.rightAnchor.constraint(equalTo: rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    override func assignLocalizedTexts() {
        super.assignLocalizedTexts()
    }
}

extension HomeView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows(in: section) ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: HomeTableViewCell.identifier,
            for: indexPath
        ) as! HomeTableViewCell
        
        guard let cellViewModel = viewModel.itemAt(section: indexPath.section, index: indexPath.item) else {
            return cell
        }
        
        defer {
            if let numberOfRows = viewModel.numberOfRows(in: indexPath.section),
               indexPath.row == numberOfRows - 1 {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) { // MARK: - added DispatchQueue just to show loagind indicator
                    self.viewModel.getPokeList { [weak self] (result) in
                        switch result {
                        case let .success(value):
                            guard !value.results.isEmpty else { return }
                            self?.tableView.reloadData()
                        case .failure:
                            Logger.log("Cell reload Fail")
                            break
                        }
                    }
                }
                
            }
        }

        cell.configureWith(data: cellViewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
       let lastSectionIndex = tableView.numberOfSections - 1
       let lastRowIndex = tableView.numberOfRows(inSection: lastSectionIndex) - 1
       if indexPath.section ==  lastSectionIndex && indexPath.row == lastRowIndex {
        let spinner = UIActivityIndicatorView(style: .medium)
        spinner.startAnimating()
        spinner.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: tableView.bounds.width, height: CGFloat(40))

        tableView.tableFooterView = spinner
        tableView.tableFooterView?.isHidden = false
       }
   }
}

extension HomeView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let contact = viewModel.itemAt(section: indexPath.section, index: indexPath.item) else { return }
        onSelectionEvent?(contact.data.name)
    }
}
