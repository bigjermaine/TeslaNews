//
//  NewsTableViewCell.swift
//  newsapp
//
//  Created by Apple on 30/01/2023.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    static let identifier = "NewsTableViewCell"

    private let titlelabel: UILabel = {
        let label = UILabel()
      
        label.font = .systemFont(ofSize: 12, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    private let newsimageview:UIImageView = {
        let imageview = UIImageView()
        imageview.translatesAutoresizingMaskIntoConstraints = false
        imageview.backgroundColor  = .systemBlue
        imageview.clipsToBounds =  true
        imageview.contentMode = .scaleAspectFill
        return imageview
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
      
        contentView.addSubview(titlelabel)
        contentView.addSubview(newsimageview)
        applycinstraints()
    
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func applycinstraints() {
        
        let labelbuttonviewconstriants = [

            titlelabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            titlelabel.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 10),
            titlelabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -15),
            titlelabel.widthAnchor.constraint(equalToConstant: 200)



        ]
        let newsimageviewviewconstriants = [
           
            newsimageview.leadingAnchor.constraint(equalTo: titlelabel.leadingAnchor,constant: 250),
            newsimageview.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 5),
            newsimageview.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -5),
            newsimageview.widthAnchor.constraint(equalToConstant: 250)
           
           
           
           
        
        
        ]
       
       
        NSLayoutConstraint.activate(labelbuttonviewconstriants)
        NSLayoutConstraint.activate(newsimageviewviewconstriants)
    }
    
    override func prepareForReuse() {
        newsimageview.image = nil
        titlelabel.text = nil
    }
    public func configure(with  model: Results2) {
        
        
        
        
        titlelabel.text = model.description
        print(model.urlToImage ?? " ")
        guard let url = URL(string: model.urlToImage ?? "" ) else {return}
            URLSession.shared.dataTask(with: url) { [weak self] Data, _ ,error in
                guard let  Data = Data  , error == nil else {
                    return
                }
            
                DispatchQueue.main.async {
                  
                    self?.newsimageview.image = UIImage(data:Data)
                }
            }.resume()
        
    }
}
