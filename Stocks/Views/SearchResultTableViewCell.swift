//
//  SearchResultTableViewCell.swift
//  Stocks
//
//  Created by VenD on 7/31/21.
//

import UIKit

class SearchResultTableViewCell: UITableViewCell {

    static let identifier = "SearchResultTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
}
