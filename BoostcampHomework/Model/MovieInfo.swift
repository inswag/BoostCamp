//
//  MovieInfo.swift
//  BoostcampHomework
//
//  Created by 박인수 on 15/12/2018.
//  Copyright © 2018 inswag. All rights reserved.
//

import Foundation

struct MovieInfo: Decodable {
    
    var orderType: Int
    var movies: [Movies]

    enum CodingKeys: String, CodingKey {
        case movies
        case orderType = "order_type"
    }
}

struct Movies: Decodable {
    
    var reservationGrade: Int
    var thumb: String
    var grade: Int
    var userRating: Double
    var title: String
    var date: String
    var reservationRate: Double
    var id: String
    
    enum CodingKeys: String, CodingKey {
        case thumb, grade, title, date, id
        case reservationGrade = "reservation_grade"
        case userRating = "user_rating"
        case reservationRate = "reservation_rate"
    }
}
