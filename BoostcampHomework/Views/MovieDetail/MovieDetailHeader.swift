//
//  MovieDetailHeader.swift
//  BoostcampHomework
//
//  Created by 박인수 on 16/12/2018.
//  Copyright © 2018 inswag. All rights reserved.
//

import Foundation
import UIKit

class MovieDetailHeader: UICollectionViewCell {
    
    struct Constant {
        static let moviePosterImageHeight: CGFloat = 180
        static let dividerViewHeight: CGFloat = 10 // * 4
        static let movieFirstFontSize = UIFont.systemFont(ofSize: 22)
        static let movieSecondFontSize = UIFont.systemFont(ofSize: 20)
        static let movieThirdFontSize = UIFont.systemFont(ofSize: 18)
        static let movieFourthFontSize = UIFont.systemFont(ofSize: 16)
        static let movieFourthBoldFontSize = UIFont.boldSystemFont(ofSize: 16)
        static let movieFivethFontSize = UIFont.systemFont(ofSize: 14)
        static let margin: CGFloat = 10.0
    }
    
    let moviePosterImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleToFill
        iv.clipsToBounds = true
        iv.backgroundColor = .red
        return iv
    }()
    
    
    let movieTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "MOVIE TITLE"
        label.textAlignment = .left
        label.numberOfLines = 1
        label.font = Constant.movieFirstFontSize
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    // 개봉일
    let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "(날짜)개봉"
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = Constant.movieThirdFontSize
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    // 장르
    let genreLabel: UILabel = {
        let label = UILabel()
        label.text = "(개봉일)"
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = Constant.movieFourthFontSize
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    //러닝타임
    let durationLabel: UILabel = {
        let label = UILabel()
        label.text = "(시간)분"
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = Constant.movieFourthFontSize
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    // 연령별 시청 가능 표시
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

    // 구분선 2
    let firstDividerView: UIView = {
        let view = UIView()
        //        view.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 10)
        view.backgroundColor = .white
        return view
    }()
    
    let secondDividerView: UIView = {
        let view = UIView()
        //        view.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 10)
        view.backgroundColor = .lightGray
        return view
    }()
    
    // 예매율
    let reservationRateLabel: UILabel = {
        let label = UILabel()
        let attributedText = NSMutableAttributedString(string: "예매율\n\n", attributes: [NSAttributedString.Key.font: Constant.movieFourthBoldFontSize])
        attributedText.append(NSAttributedString(string: "(0)위 (00.0)%", attributes: [NSAttributedString.Key.font: Constant.movieFivethFontSize]))
        label.attributedText = attributedText
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    // 평점
    let userRatingLabel: UILabel = {
        let label = UILabel()
        
        let attributedText = NSMutableAttributedString(string: "평점\n\n", attributes: [NSAttributedString.Key.font: Constant.movieFourthBoldFontSize])
        attributedText.append(NSAttributedString(string: "(0.00)\n", attributes: [NSAttributedString.Key.font: Constant.movieFivethFontSize]))
        attributedText.append(NSAttributedString(string: "(별별별별별)", attributes: [NSAttributedString.Key.font: Constant.movieFivethFontSize]))
        label.attributedText = attributedText
        
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    // 누적관객수
    let audienceLabel: UILabel = {
        let label = UILabel()
        
        let attributedText = NSMutableAttributedString(string: "누적관객수\n\n", attributes: [NSAttributedString.Key.font: Constant.movieFourthBoldFontSize])
        attributedText.append(NSAttributedString(string: "(0.00)", attributes: [NSAttributedString.Key.font: Constant.movieFivethFontSize]))
        
        label.attributedText = attributedText
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    // 줄거리(타이틀)
    let synopsisTitleLabel: UILabel = {
       let label = UILabel()
        label.text = "줄거리"
        label.font = UIFont.systemFont(ofSize: 20)
        return label
    }()

//    let synopsisDetailTextView: UITextView = {
//        let tv = UITextView()
//        tv.text = "줄거리.."
//        tv.textAlignment = .left
//        tv.font = UIFont.systemFont(ofSize: 18)
//        return tv
//    }()
    
    let synopsisDetailLabel: UILabel = {
        let label = UILabel()
        label.text = "줄거리.."
        label.textAlignment = .left
        label.numberOfLines = 28
        label.font = Constant.movieThirdFontSize
        return label
    }()
    
    // 구분선 3
    let thirdDividerView: UIView = {
        let view = UIView()
        //        view.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 10)
        view.backgroundColor = .lightGray
        return view
    }()
    
    // 감독/출연
    let directorAndActorTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "감독 / 출연"
        label.font = Constant.movieSecondFontSize
        return label
    }()
    
    // 감독
    let directorLabel: UILabel = {
        let label = UILabel()
        label.text = "감독: 나"
        label.font = Constant.movieThirdFontSize
        return label
    }()
    
    // 출연
    let actorLabel: UILabel = {
        let label = UILabel()
        label.text = "출연: 나1. 나2"
        label.numberOfLines = 0
        label.font = Constant.movieThirdFontSize
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHeaderContents()
        setupMovieSimpleInfo()
    }
    
    // 구분선 4
    let fourthDividerView: UIView = {
        let view = UIView()
        //        view.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: 10)
        view.backgroundColor = .lightGray
        return view
    }()
    
    let userContentsTitle: UILabel = {
        let label = UILabel()
        label.text = "한줄평"
        label.font = Constant.movieSecondFontSize
        label.textAlignment = .left
        return label
    }()
    
    // 예매율, 평점, 누적관객수
    func setupMovieSimpleInfo() {
        let stackView = UIStackView(arrangedSubviews: [reservationRateLabel, userRatingLabel, audienceLabel])
        
        stackView.distribution = .fillEqually
//        stackView.axis = .horizontal
        
        self.addSubview(stackView)
        stackView.anchor(top: self.firstDividerView.bottomAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 90)
    }
    
    func setupHeaderContents() {
        [moviePosterImage, movieTitleLabel, dateLabel, genreLabel, durationLabel, gradeTextView, firstDividerView, secondDividerView, synopsisTitleLabel, synopsisDetailLabel, thirdDividerView, fourthDividerView, directorAndActorTitleLabel, directorLabel, actorLabel, userContentsTitle].forEach {
            self.contentView.addSubview($0)
        }
        
        // Margin * 2 + moviePosterImageHeight
        moviePosterImage.anchor(top: self.topAnchor, left: self.leftAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 10, paddingBottom: 10, paddingRight: 0, width: 120, height: Constant.moviePosterImageHeight)
        
        movieTitleLabel.anchor(top: nil, left: self.moviePosterImage.rightAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        movieTitleLabel.centerYAnchor.constraint(equalTo: moviePosterImage.centerYAnchor).isActive = true
        
        gradeTextView.anchor(top: nil, left: self.movieTitleLabel.rightAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: 28, height: 28)
        gradeTextView.centerYAnchor.constraint(equalTo: movieTitleLabel.centerYAnchor).isActive = true
        
        dateLabel.anchor(top: self.movieTitleLabel.bottomAnchor, left: self.moviePosterImage.rightAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        genreLabel.anchor(top: self.dateLabel.bottomAnchor, left: self.moviePosterImage.rightAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        durationLabel.anchor(top: self.dateLabel.bottomAnchor, left: self.genreLabel.rightAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        
        // Margin * 1 + dividerViewHeight
        firstDividerView.anchor(top: self.moviePosterImage.bottomAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: Constant.dividerViewHeight)
        
        // dividerViewHeight
        secondDividerView.anchor(top: self.firstDividerView.bottomAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, paddingTop: 90, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: Constant.dividerViewHeight)
        
        // Margin * 1
        synopsisTitleLabel.anchor(top: self.secondDividerView.bottomAnchor, left: self.leftAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 20, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        // Margin * 1
        synopsisDetailLabel.anchor(top: self.synopsisTitleLabel.bottomAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, paddingTop: 10, paddingLeft: 25, paddingBottom: 0, paddingRight: 20, width: 0, height: 0)
        
        // Margin * 1 + dividerViewHeight
        thirdDividerView.anchor(top: self.synopsisDetailLabel.bottomAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: Constant.dividerViewHeight)
        
        // Margin * 1
        directorAndActorTitleLabel.anchor(top: self.thirdDividerView.bottomAnchor, left: self.leftAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 20, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        // Margin * 1
        directorLabel.anchor(top: self.directorAndActorTitleLabel.bottomAnchor, left: self.leftAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 25, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        
        // Margin * 1
        actorLabel.anchor(top: self.directorLabel.bottomAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, paddingTop: 10, paddingLeft: 25, paddingBottom: 0, paddingRight: 25, width: 0, height: 0)
        
        // Margin * 1 + dividerViewHeight =
        fourthDividerView.anchor(top: self.actorLabel.bottomAnchor, left: self.leftAnchor, bottom: nil, right: self.rightAnchor, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: Constant.dividerViewHeight)
        
        userContentsTitle.anchor(top: self.fourthDividerView.bottomAnchor, left: self.leftAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 20, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
