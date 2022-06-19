//
//  QuoteTableViewCell.swift
//  InspirationQuotes
//
//  Created by Nataliya Lazouskaya on 19.06.22.
//

import UIKit

class QuoteTableViewCell: UITableViewCell {
    
    let quoteLabel: UILabel = {
        let label = UILabel()
        //label.text = "Our greatest glory is not in never falling, but in rising every time we fall. — Confucius"
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 20)
        label.numberOfLines = 0
        // label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        //selectionStyle = .default
       
        addSubview(quoteLabel)
    }
    private func setConstraints() {

        NSLayoutConstraint.activate([
            quoteLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            quoteLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            quoteLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            quoteLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
        ])
    }
    
}
