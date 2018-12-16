//
//  TableviewController.swift
//  BoostcampHomework
//
//  Created by 박인수 on 15/12/2018.
//  Copyright © 2018 inswag. All rights reserved.
//

import UIKit
import Foundation

class TableViewController: UITableViewController {
    
    let cellID = "cellID"
    
    var movieInfos: [Movies] = []
    
    var selectedID: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.backgroundColor = .white
        self.tableView.register(TableViewCell.self, forCellReuseIdentifier: cellID)
    
        setupNavigationItem()
        
        // Basic
        fetchInfo(type: 0)
    }
    
    @objc func refreshData() {
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.rowHeight = 100
    }
    
    func setupNavigationItem() {
        let gear = UIImage(named: "gear")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: gear,
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(handleArrangement))
        navigationItem.rightBarButtonItem?.tintColor = .white
        navigationItem.title = "예매율순"
    }
    
    func fetchInfo(type: Int) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        let url = "\(API.MovieList.getMovieListBySort)" + "\(type)"
        
        guard let apiURL = URL(string: url) else { return }
        
        let dataTask = URLSession.shared.dataTask(with: apiURL) { (data, response, error) in
            guard let response = response as? HTTPURLResponse, let data = data else {
                let alertController = UIAlertController(title: "데이터 수신 실패", message: "인터넷 연결 상태를 확인해주세요", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "확인", style: .destructive, handler: nil))
                self.present(alertController, animated: true, completion: nil)
                return
            }
            
            guard 200..<400 ~= response.statusCode else { return }
            do {
                let decodedContent = try JSONDecoder().decode(MovieInfo.self, from: data)
//                print(decodedContent)
                let movies = decodedContent.movies
                self.movieInfos = movies
                
                DispatchQueue.main.async {
                    
                    self.tableView.reloadData()
                }
            
            } catch {
                print(error.localizedDescription)
               
                
            }
            
        }
        dataTask.resume()
        
        
    }
    
    @objc func handleArrangement() {
        let alertController = UIAlertController(title: "정렬방식 선택",
                                                message: "영화를 어떤 순서로 정렬할까요?",
                                                preferredStyle: .actionSheet)
        
        alertController.addAction(UIAlertAction(title: "예매율",
                                                style: .default,
                                                handler: { (_) in
                                                    self.fetchInfo(type: 0)
                                                    self.navigationItem.title = "예매율순"
                                                    
                                                    
        }
        ))
        
        alertController.addAction(UIAlertAction(title: "큐레이션",
                                                style: .default,
                                                handler: { (_) in
                                                    self.fetchInfo(type: 1)
                                                    self.navigationItem.title = "큐레이션순"
        }
        ))
        
        alertController.addAction(UIAlertAction(title: "개봉일",
                                                style: .default,
                                                handler: { (_) in
                                                    self.fetchInfo(type: 2)
                                                    self.navigationItem.title = "개봉일순"
                                                    
        }
        ))
        
        
        alertController.addAction(UIAlertAction(title: "취소", style: .cancel, handler: nil))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
}

extension TableViewController {

    override func tableView(_ tablView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.selectedID = self.movieInfos[indexPath.row].id
        let movieDetailViewController = MovieDetailViewController()
        movieDetailViewController.receivedValue = self.selectedID
        self.navigationController?.pushViewController(movieDetailViewController, animated: true)
        
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movieInfos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! TableViewCell
        
        DispatchQueue.main.async {
            
            // Insert Movie Detail Infomation
            cell.movieTitleLabel.text = self.movieInfos[indexPath.row].title
            cell.reservationGrade = self.movieInfos[indexPath.row].grade
            cell.reservationRate = self.movieInfos[indexPath.row].reservationRate
            cell.userRating = self.movieInfos[indexPath.row].userRating
            cell.dateLabel.text = "개봉일 : " + self.movieInfos[indexPath.row].date
            
            cell.movieDetailLabel.text = "평점: \(self.movieInfos[indexPath.row].userRating) 예매순위 : \(self.movieInfos[indexPath.row].reservationGrade) 예매율 : \(self.movieInfos[indexPath.row].reservationRate)%"
            
            
            // Caching Movie Poster Image
            let url = self.movieInfos[indexPath.row].thumb
            guard let apiURL = URL(string: url) else { return }
            let data = try! Data(contentsOf: apiURL)
            cell.moviePosterImage.image = UIImage(data: data)
            
            // Insert Movie Grade
            switch self.movieInfos[indexPath.row].grade {
            case 12:
                cell.gradeTextView.text = "12"
                cell.gradeTextView.backgroundColor = UIColor.rgb(red: 38, green: 166, blue: 243)
            case 15:
                cell.gradeTextView.text = "15"
                cell.gradeTextView.backgroundColor = UIColor.rgb(red: 253, green: 150, blue: 30)
            case 19:
                cell.gradeTextView.text = "19"
                cell.gradeTextView.backgroundColor = UIColor.rgb(red: 255, green: 0, blue: 0)
            default:
                cell.gradeTextView.text = "전체"
                cell.gradeTextView.font = UIFont.systemFont(ofSize: 8)
                cell.gradeTextView.backgroundColor = UIColor.rgb(red: 10, green: 230, blue: 10)
            }
            
        }
        
        return cell
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }

}
