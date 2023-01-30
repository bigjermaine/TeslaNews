//
//  ViewController.swift
//  newsapp
//
//  Created by Apple on 29/01/2023.
//

import UIKit
import SafariServices
class ViewController: UIViewController {

    var Totalnews:[Article] = [Article]()
    private let tableview: UITableView = {
        
        let table = UITableView(frame: .zero, style: .grouped)
        
        table.register(NewsTableViewCell.self, forCellReuseIdentifier:NewsTableViewCell.identifier)
        return table
        
        
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "News"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        
       
        view.addSubview(tableview)
        tableview.dataSource = self
        tableview.delegate = self
     
        fetchapi()
        view.backgroundColor = .systemBackground
        // Do any additional setup after loading the view.
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        tableview.frame = view.bounds
    }
    func fetchapi() {
        Apifetch.shared.getnews {[ weak self ] results in
            switch results {
            case.success(let welcome):
              self?.Totalnews = welcome
                DispatchQueue.main.async {
                    self?.tableview.reloadData()
                }
            case.failure(let error):
                print(error.localizedDescription)
            }
            
        }
        
        
        
    }
}

extension ViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Totalnews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      guard let cell = tableview.dequeueReusableCell(withIdentifier:  NewsTableViewCell.identifier, for: indexPath) as? NewsTableViewCell else {return UITableViewCell()}
        
    
        
        let model1 = Totalnews[indexPath.row].description ?? "unknown"
        let model2 = Totalnews[indexPath.row].urlToImage ?? "unknown"
        cell.configure(with: Results2(description: model1, title: "", url: model2 , urlToImage: model2))
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let model1 = Totalnews[indexPath.row].url ?? "unknown"
        guard let url = URL(string: model1) else {return}
        let vc = SFSafariViewController(url: url)
       present(vc, animated: true)
        
    }
}
