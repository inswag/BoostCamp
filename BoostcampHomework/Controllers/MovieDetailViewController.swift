//
//  MovieDetailViewController.swift
//  BoostcampHomework
//
//  Created by 박인수 on 16/12/2018.
//  Copyright © 2018 inswag. All rights reserved.
//

import Foundation
import UIKit

class MovieDetailViewController: UIViewController {
    
    var receivedValue: String = ""
    
    let collectionView = UICollectionView(frame: CGRect.zero,
                                          collectionViewLayout: UICollectionViewFlowLayout())
    let layout = UICollectionViewFlowLayout()
    
    let cellID = "cellID"
    let headerID = "headerID"
    
    var moviesDetailInfos: MovieDetailInfo!
    var movieUserComments: [Comments] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        self.view.addSubview(collectionView)
        setupCollectionView()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        self.collectionView.register(MovieDetailCell.self, forCellWithReuseIdentifier: cellID)
        self.collectionView.register(MovieDetailHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerID)
        
        
        // Basic
        fetchMovieDetailInfo(id: receivedValue)
        fetchMovieUserComments(id: receivedValue)
    }
    
    // Fetch Movie Detail Info JSON Data
    func fetchMovieDetailInfo(id: String) {
        let url = "\(API.MovieList.getMovieDetailList)" + "\(id)"
        guard let apiURL = URL(string: url) else { return }
        
        let dataTask = URLSession.shared.dataTask(with: apiURL) { (data, response, error) in
            guard let response = response as? HTTPURLResponse, let data = data else {
                let alertController = UIAlertController(title: "상세정보 수신 실패", message: "", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "확인", style: .destructive, handler: nil))
                self.present(alertController, animated: true, completion: nil)
                return
            }
            guard 200..<400 ~= response.statusCode else { return }
            do {
                let decodedContent = try JSONDecoder().decode(MovieDetailInfo.self, from: data)
//                print(decodedContent)
                
                self.moviesDetailInfos = decodedContent
                
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
                
            } catch {
                print(error.localizedDescription)
            }
        }
        dataTask.resume()
        
    }
    
    // Fetch Movie User Comments Info JSON Data
    func fetchMovieUserComments(id: String) {
        let url = "\(API.MovieComments.getMovieUserComments)" + "\(id)"
        guard let apiURL = URL(string: url) else { return }
        
        let dataTask = URLSession.shared.dataTask(with: apiURL) { (data, response, error) in
            guard let response = response as? HTTPURLResponse, let data = data else {
                let alertController = UIAlertController(title: "한줄평 수신 실패", message: "", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "확인", style: .destructive, handler: nil))
                self.present(alertController, animated: true, completion: nil)
                return
            }
            guard 200..<400 ~= response.statusCode else { return }
            do {
                let decodedContent = try JSONDecoder().decode(MovieUserComments.self, from: data)
//                print(decodedContent)
                
                self.movieUserComments = decodedContent.comments
                
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
                
            } catch {
                print(error.localizedDescription)
            }
        }
        dataTask.resume()
    }
    
    
    func setupCollectionView() {
        layout.scrollDirection = .vertical
        collectionView.setCollectionViewLayout(layout, animated: true)
        collectionView.backgroundColor = .white
        collectionView.anchor(top: self.view.topAnchor, left: self.view.leftAnchor, bottom: self.view.bottomAnchor, right: self.view.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
    
    
    
}

extension MovieDetailViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! MovieDetailCell
        
        cell.backgroundColor = .white
        
        cell.userIDLabel.text = self.movieUserComments[indexPath.row].writer
        cell.contentLabel.text = self.movieUserComments[indexPath.row].contents
        
        // Convert User Rating To Image
        switch self.movieUserComments[indexPath.row].rating {
        case 0.0..<2.0:
            cell.userRatingImage.image = UIImage(named: "oneStarRating")
        case 2.0..<4.0:
            cell.userRatingImage.image = UIImage(named: "twoStarRating")
        case 4.0..<6.0:
            cell.userRatingImage.image = UIImage(named: "threeStarRating")
        case 6.0..<8.0:
            cell.userRatingImage.image = UIImage(named: "fourStarRating")
        case 8.0...10.0:
            cell.userRatingImage.image = UIImage(named: "fiveStarRating")
        default:
            print("Out of range")
        }
        
        // Converting timestamp to Date
        let unixTimestamp = self.movieUserComments[indexPath.row].timestamp
        let date = Date(timeIntervalSince1970: unixTimestamp)
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let nowDate = formatter.string(from: date)
        
        cell.timeStampLabel.text = nowDate
 
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return MovieDetailCell.defineMovieDetailCellSize(self.view.frame.width)
    }

    
    
    // Handle Header View
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerID, for: indexPath) as! MovieDetailHeader
        
        DispatchQueue.main.async {
            
            if let detailInfos = self.moviesDetailInfos {
                // Movie Info
                header.movieTitleLabel.text = detailInfos.title
                header.dateLabel.text = "\(String(describing: detailInfos.date)) 개봉"
                header.genreLabel.text = "\(String(describing: detailInfos.genre)) / "
                header.durationLabel.text = "\(String(describing: detailInfos.duration))분"
                
                // Caching Movie Poster Image
                let url = detailInfos.image
                guard let apiURL = URL(string: url) else { return }
                let data = try! Data(contentsOf: apiURL)
                header.moviePosterImage.image = UIImage(data: data)
                
                // Insert Movie Grade
                switch detailInfos.grade {
                case 12:
                    header.gradeTextView.text = "12"
                    header.gradeTextView.backgroundColor = UIColor.rgb(red: 38, green: 166, blue: 243)
                case 15:
                    header.gradeTextView.text = "15"
                    header.gradeTextView.backgroundColor = UIColor.rgb(red: 253, green: 150, blue: 30)
                case 19:
                    header.gradeTextView.text = "19"
                    header.gradeTextView.backgroundColor = UIColor.rgb(red: 255, green: 0, blue: 0)
                default:
                    // 전체이용가
                    header.gradeTextView.text = "전체"
                    header.gradeTextView.font = UIFont.systemFont(ofSize: 8)
                    header.gradeTextView.backgroundColor = UIColor.rgb(red: 10, green: 230, blue: 10)
                }
                
                // Handle stackView
                
                
                // Handle synopsis
                header.synopsisDetailLabel.text = detailInfos.synopsis
                
                // Handle Staff
                header.directorLabel.text = "감독: \(detailInfos.director)"
                header.actorLabel.text = "출연: \(detailInfos.actor)"
                
                // Handle Detail
                let reservationRateAttributedText = NSMutableAttributedString(string: "예매율\n\n", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16)])
                reservationRateAttributedText.append(NSAttributedString(string: "\(detailInfos.reservationGrade)위 \(detailInfos.reservationRate)%", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)]))
                
                let userRatingAttributedText = NSMutableAttributedString(string: "평점\n\n", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16)])
                userRatingAttributedText.append(NSAttributedString(string: "\(detailInfos.userRating)", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)]))
                
                
                let audienceAttributedText = NSMutableAttributedString(string: "누적관객수\n\n", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16)])
                audienceAttributedText.append(NSAttributedString(string: "\(detailInfos.audience)", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14)]))
                
                header.reservationRateLabel.attributedText = reservationRateAttributedText
                header.userRatingLabel.attributedText = userRatingAttributedText
                header.audienceLabel.attributedText = audienceAttributedText
            }
        }
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: self.view.frame.width, height: 1150)
    }

    
    
}
