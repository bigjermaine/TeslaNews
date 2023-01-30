//
//  PrevIewNewsTableViewCell.swift
//  DogeCoin
//
//  Created by Apple on 30/01/2023.
//

import UIKit
import SafariServices

class PrevIewNewsTableViewCell: UIViewController {
    
    private let titlelabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = ""
        return label
    }()
    private let link2: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        return label
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        view.addSubview(titlelabel)
        view.addSubview(link2)
        configureconstraints()
    }
    func configureconstraints() {
        let descriptionconstraints = [
            titlelabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            titlelabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            titlelabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            titlelabel.heightAnchor.constraint(equalToConstant: 250)
        ]
        let linkconstraints = [
            titlelabel.topAnchor.constraint(equalTo: titlelabel.topAnchor, constant: 50),
            titlelabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            titlelabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
  
        ]
        NSLayoutConstraint.activate(descriptionconstraints
        )
        NSLayoutConstraint.activate(linkconstraints
        )
    }
    
    public func configure(with  model:  Article) {
        titlelabel.text = model.title
        link2.text = model.url
       
        
    }
}
