//
//  TableViewCell.swift
//  BoostcampHomework
//
//  Created by 박인수 on 15/12/2018.
//  Copyright © 2018 inswag. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    let cellID = "cellID"

    struct Constant {
        static let movieTitleFont = UIFont.systemFont(ofSize: 22)
        static let movieDetailFont = UIFont.systemFont(ofSize: 16)
        static let movieDateFont = UIFont.systemFont(ofSize: 14)
        static let margin: CGFloat = 10.0
    }
    
    let moviePosterImage: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleToFill
        imgView.clipsToBounds = true
        imgView.backgroundColor = .white
        return imgView
    }()
    
    // 영화 타이틀
    let movieTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "MOVIE TITLE"
        label.textAlignment = .left
        label.font = Constant.movieTitleFont
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    // 예매 순위, 평점, 예매율 보여주는 Label
    let movieDetailLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 1
        label.adjustsFontSizeToFitWidth = true
        label.text = "평점: 0.0 예매순위: 0 예매율: 0.0%"
        return label
    }()
    
    var reservationGrade: Int = 0
    var reservationRate: Double = 0.0
    var userRating: Double = 0.0
    
    // 개봉일
    let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "개봉일 : (날짜)"
        label.textAlignment = .left
        label.font = Constant.movieDateFont
        label.numberOfLines = 1
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
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: cellID)
        
        setupContents()
    }
    
    func setupContents() {
        [moviePosterImage, movieTitleLabel, movieDetailLabel, dateLabel, gradeTextView].forEach {
            self.contentView.addSubview($0)
        }
        
        self.moviePosterImage.anchor(top: self.topAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: nil, paddingTop: 5, paddingLeft: 20, paddingBottom: 5, paddingRight: 0, width: 80, height: 90)

        self.movieTitleLabel.anchor(top: self.topAnchor, left: self.moviePosterImage.rightAnchor, bottom: nil, right: self.gradeTextView.leftAnchor, paddingTop: 15, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: 0, height: 0)

        self.movieDetailLabel.anchor(top: self.movieTitleLabel.bottomAnchor, left: self.moviePosterImage.rightAnchor, bottom: nil, right: self.rightAnchor, paddingTop: 5, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: 0, height: 0)

        self.dateLabel.anchor(top: self.movieDetailLabel.bottomAnchor, left: self.moviePosterImage.rightAnchor, bottom: nil, right: self.rightAnchor, paddingTop: 5, paddingLeft: 10, paddingBottom: 0, paddingRight: 10, width: 0, height: 0)
        
        self.gradeTextView.anchor(top: self.movieTitleLabel.topAnchor, left: self.movieTitleLabel.rightAnchor, bottom: self.movieTitleLabel.bottomAnchor, right:  nil, paddingTop: 0, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: 28, height: 28)
        
        self.gradeTextView.centerXAnchor.constraint(equalTo: self.movieTitleLabel.centerXAnchor)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
