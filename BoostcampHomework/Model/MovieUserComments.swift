//
//  MovieUserComments.swift
//  BoostcampHomework
//
//  Created by 박인수 on 17/12/2018.
//  Copyright © 2018 inswag. All rights reserved.
//

import Foundation

struct MovieUserComments: Decodable {
    
    var movieID: String
    var comments: [Comments]
    
    enum CodingKeys: String, CodingKey {
        case comments
        case movieID = "movie_id"
    }
}

struct Comments: Decodable {
    var rating: Double
    var timestamp: Double
    var writer: String
    var movieID: String
    var contents: String
    
    enum CodingKeys: String, CodingKey {
        case rating, timestamp, writer, contents
        case movieID = "movie_id"
    }
}
