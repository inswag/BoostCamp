//
//  MovieDetailCell.swift
//  BoostcampHomework
//
//  Created by 박인수 on 16/12/2018.
//  Copyright © 2018 inswag. All rights reserved.
//

import Foundation
import UIKit


class MovieDetailCell: UICollectionViewCell {
    
    static func defineMovieDetailCellSize(_ cellWidth: CGFloat) -> CGSize {
        let cellHeight = (Constant.margin * 2) + (Constant.movieFivethFontSize.lineHeight) + (Constant.movieFourthFontSize.lineHeight * 7)
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    struct Constant {
        static let movieFirstFontSize = UIFont.systemFont(ofSize: 22)
        static let movieSecondFontSize = UIFont.systemFont(ofSize: 20)
        static let movieThirdFontSize = UIFont.systemFont(ofSize: 18)
        static let movieFourthFontSize = UIFont.systemFont(ofSize: 16)
        static let movieFourthBoldFontSize = UIFont.boldSystemFont(ofSize: 16)
        static let movieFivethFontSize = UIFont.systemFont(ofSize: 14)
        static let margin: CGFloat = 10.0
    }
    
    let userProfileImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.backgroundColor = .lightGray
        iv.layer.cornerRadius = 40
        iv.layer.masksToBounds = true
        return iv
    }()
    
    let userIDLabel: UILabel = {
        let label = UILabel()
        label.text = "userID"
        label.font = Constant.movieFivethFontSize
        label.textAlignment = .left
        return label
    }()
    
//    let userRating: UILabel = {
//        let label = UILabel()
//        label.text = "별별별별별"
//        label.font = Constant.movieFourthFontSize
//        label.textAlignment = .left
//        return label
//    }()
    
    let userRatingImage: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "oneStarRating")
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = false
        return iv
    }()
    
    let timeStampLabel: UILabel = {
        let label = UILabel()
        label.text = "2017-12-17 00:00:00"
        label.font = Constant.movieFourthFontSize
        label.textAlignment = .left
        return label
    }()
    
    let contentLabel: UILabel = {
        let label = UILabel()
        label.text = "염라대왕에게 천년 동안 49명의 망자를 환생시키면 자신들 역시 인간으로 환생시켜 주겠다는 약속을 받은 삼차사들, 그들은 자신들이 변호하고 호위해야 하는 48번째 망자이자 19년 만에 나타난 의로운 귀인 자홍의 환생을 확신하지만"
        label.font = Constant.movieFourthFontSize
        label.textAlignment = .left
        label.numberOfLines = 5
        return label
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupContents()
    }
    
    func setupContents() {
        [userProfileImageView, userIDLabel, userRatingImage, timeStampLabel, contentLabel].forEach {
            self.contentView.addSubview($0)
        }
        
        userProfileImageView.anchor(top: self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 20, paddingBottom: 0, paddingRight: 0, width: 80, height: 80)
        
        userIDLabel.anchor(top: self.userProfileImageView.topAnchor, left: self.userProfileImageView.rightAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 20, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        userRatingImage.anchor(top: nil, left: self.userIDLabel.rightAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 20, paddingBottom: 0, paddingRight: 0, width: 60, height: 40)
        userRatingImage.centerYAnchor.constraint(equalTo: userIDLabel.centerYAnchor).isActive = true
        
        timeStampLabel.anchor(top: self.userIDLabel.bottomAnchor, left: self.userProfileImageView.rightAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 20, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        contentLabel.anchor(top: self.timeStampLabel.bottomAnchor, left: self.userProfileImageView.rightAnchor, bottom: nil, right: self.rightAnchor, paddingTop: 10, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 0)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
