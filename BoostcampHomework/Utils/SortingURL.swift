//
//  SortingURL.swift
//  BoostcampHomework
//
//  Created by 박인수 on 15/12/2018.
//  Copyright © 2018 inswag. All rights reserved.
//

import Foundation

enum API {
    static let baseURL = "http://connect-boxoffice.run.goorm.io/"
    
    enum MovieList {
        static let getMovieListBySort = API.baseURL + "movies?order_type="
        static let getMovieDetailList = API.baseURL + "movie?id="
    }
    
    enum MovieComments {
        static let getMovieUserComments = API.baseURL + "comments?movie_id="
    }
    
}
