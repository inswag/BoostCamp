//
//  CollectionViewCell.swift
//  BoostcampHomework
//
//  Created by 박인수 on 15/12/2018.
//  Copyright © 2018 inswag. All rights reserved.
//

import Foundation
import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    // 250 : 영화 포스터 Height
    static func defineCellSize(_ cellWidth: CGFloat) -> CGSize {
        let cellHeight = 250 + (Constant.margin * 4) + (Constant.movieTitleFont.lineHeight) + (Constant.movieDetailFont.lineHeight) + (Constant.movieDateFont.lineHeight)
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    struct Constant {
        static let movieTitleFont = UIFont.systemFont(ofSize: 22)
        static let movieDetailFont = UIFont.systemFont(ofSize: 18)
        static let movieDateFont = UIFont.systemFont(ofSize: 16)
        static let margin: CGFloat = 10.0
    }
    
    let moviePosterImage: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleToFill
        imgView.clipsToBounds = true
        imgView.backgroundColor = .white
        return imgView
    }()
    
    let movieTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "MOVIE TITLE"
        label.textAlignment = .center
        label.numberOfLines = 1
        label.font = Constant.movieTitleFont
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    // 예매 순위, 평점, 예매율 보여주는 Label
    let movieDetailLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.text = "0위(0.08) / 00.0%"
        return label
    }()
    
    var reservationGrade: Int = 0
    var reservationRate: Double = 0.0
    var userRating: Double = 0.0
    
    // 개봉일
    let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "(개봉일)"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = Constant.movieDateFont
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    // 나이 제한
    let gradeTextView: UITextView = {
        let tv = UITextView()
        tv.text = "12"
        tv.textColor = .white
        tv.backgroundColor = UIColor.rgb(red: 38, green: 166, blue: 243)
        tv.textAlignment = .center
        tv.frame = CGRect(x: 0, y: 0, width: 28, height: 28)
        tv.layer.cornerRadius = tv.frame.width / 2
        tv.layer.masksToBounds = true
        return tv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupContents()
    }
    
    func setupContents() {
        [moviePosterImage, movieTitleLabel, movieDetailLabel, dateLabel].forEach {
            self.contentView.addSubview($0)
        }
        
        moviePosterImage.anchor(top: self.topAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 250)
        
        movieTitleLabel.anchor(top: self.moviePosterImage.bottomAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        movieDetailLabel.anchor(top: self.movieTitleLabel.bottomAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        dateLabel.anchor(top: self.movieDetailLabel.bottomAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 10, paddingRight: 0, width: 0, height: 0)
    
        // Insert Grade Text View On Movie Poster Image
        self.moviePosterImage.addSubview(gradeTextView)
        
        gradeTextView.anchor(top: self.topAnchor , left: nil, bottom: nil, right: self.rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 10, width: 28, height: 28)
    
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
