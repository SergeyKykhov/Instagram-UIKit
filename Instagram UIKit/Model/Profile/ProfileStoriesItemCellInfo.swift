//
//  ProfileStoriesCellInfo.swift
//  Instagram UIKit
//
//  Created by Sergey Kykhov on 24.03.2023.
//

import UIKit

//Cтруктура данных которая будет в ячейке Stories в таблице
struct ProfileStoriesItemCellInfo {
    let image: UIImage
    let storiesName: String
    let isAddButtonVisible: Bool
    let isNewStory: Bool
}

typealias ProfileStoriesCellInfo = [ProfileStoriesItemCellInfo]

