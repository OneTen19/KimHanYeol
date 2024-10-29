//
//  PopularChartView.swift
//  35-Seminar
//
//  Created by OneTen on 10/29/24.
//

import UIKit

import SnapKit

class PopularChartView: UIViewController {
    
    private let apps = App.freeApps
    
    private let tableView = UITableView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setStyle()
        setLayout()
    }
    
    private func setStyle() {
        
        tableView.do {
            $0.register(PopularChartCell.self, forCellReuseIdentifier: PopularChartCell.cellIdentifier)
            $0.dataSource = self
            $0.delegate = self
        }
        
    }
    
    private func setUI() {
        
        view.addSubview(tableView)
        
    }
    
    private func setLayout() {
        
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
    }
    
}

extension PopularChartView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return apps.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PopularChartCell.cellIdentifier, for: indexPath) as? PopularChartCell else {
            return UITableViewCell()
        }
        let app = apps[indexPath.row]
        cell.configure(with: app)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let app = apps[indexPath.row]
        
        if app.title == "토스" {
            let nextViewController = TossViewController()
            self.navigationController?.pushViewController(nextViewController, animated: true)
        }
        
    }
}

