//
//  MovieDetailInfo.swift
//  BoostcampHomework
//
//  Created by 박인수 on 16/12/2018.
//  Copyright © 2018 inswag. All rights reserved.
//

import Foundation

struct MovieDetailInfo: Decodable {
    
    var date: String
    var duration: Int
    var id: String
    var actor: String
    var reservationGrade: Int
    var director: String
    var reservationRate: Double
    var image: String
    var audience: Int
    var genre: String
    var grade: Int
    var synopsis: String
    var userRating: Double
    var title: String
    
    enum CodingKeys: String, CodingKey {
        case date, duration, id, actor, director, image, audience, genre, grade, synopsis, title
        case reservationGrade = "reservation_grade"
        case reservationRate = "reservation_rate"
        case userRating = "user_rating"
    }
    
}
