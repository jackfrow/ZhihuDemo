//
//  DemoCell.swift
//  ZhihuDemo
//
//  Created by jackfrow on 2022/4/18.
//

import UIKit
import Kingfisher
import SwiftUI

class DemoCell: UITableViewCell {

    
    var model:zhihuModel?{
        didSet{
            if let m = model {
                self.titleLabel.text = m.title
                if let url = model?.lodaUrl {
                    self.img.kf.setImage(with:URL(string: url))
                }
            }
        }
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        CommonUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func CommonUI()  {
        
        self.contentView.addSubview(self.titleLabel)
        self.contentView.addSubview(self.img)
        
        self.titleLabel.snp.makeConstraints { make in
            make.top.equalTo(20)
            make.leading.equalTo(16)
            make.trailing.equalTo(self.contentView.snp.trailing).offset(-20)
        }
        
        self.img.snp.makeConstraints { make in
            make.top.equalTo(self.titleLabel.snp.bottom).offset(10)
            make.leading.equalTo(10)
            make.trailing.equalTo(self.contentView.snp.trailing).offset(-10)
            make.bottom.equalTo(self.contentView.snp.bottom).offset(-10)
        }
        
    }
    
    // MARK: - lazy
    lazy var titleLabel: UILabel = {
        
        let l = UILabel()
        l.text = "title"
        l.numberOfLines = 3
        return l
    }()
    
    
    lazy var img: UIImageView = {
        let imgV = UIImageView()
        return imgV
    }()

    
}
