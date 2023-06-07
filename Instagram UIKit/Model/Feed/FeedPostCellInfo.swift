//
//  FeedPostCellInfo.swift
//  Instagram UIKit
//
//  Created by Sergey Kykhov on 20.03.2023.
//

import UIKit

//Cтруктура данных которая будет в ячейке Post в таблице
struct FeedPostCellInfo {
    let userImage: UIImage
    let username: String
    let postSubtitle: String
    let postImage: UIImage
    let numberOfLikes: Int
    let comment: CommentsShortInfo?
}

struct CommentsShortInfo {
    let username: String
    let commentText: String
}
