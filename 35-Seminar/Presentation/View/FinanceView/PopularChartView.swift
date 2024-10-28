//
//  PopularChartView.swift
//  35-Seminar
//
//  Created by OneTen on 10/29/24.
//

import UIKit

import SnapKit

class PopularChartView: UIViewController {
    
    private let tableView = UITableView()
    
    private let apps = App.freeApps
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setStyle()
        setLayout()
    }
    
    private func setStyle() {
        
        tableView.do {
            $0.register(ChartCell.self, forCellReuseIdentifier: ChartCell.cellIdentifier)
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ChartCell.cellIdentifier, for: indexPath) as? ChartCell else {
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
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}

#Preview {
    PopularChartView()
}
