//
//  CollectionViewCell.swift
//  Instagram UIKit
//
//  Created by Sergey Kykhov on 20.03.2023.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    static let identifier = "CollectionViewCell" //создал идентификатор ячейки

    var imageView: UIImageView = {  //создал контейнер для изображения в ячейку
        let image = UIImageView()
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        return image
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        imageView.frame = contentView.bounds
        runUpload()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }



    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = contentView.bounds
    }

    //MARK: - Network (добавление картинки в ячейку по API)
    func runUpload() {
        let api = "https://picsum.photos/400"
        guard let apiURL = URL(string: api) else {
            fatalError("ERROR")
        }
        let session = URLSession(configuration: .default)
        let taskRequest = session.dataTask(with: apiURL) { (data, response, error) in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async {
                self.imageView.image = UIImage(data: data)
            }
        }
        taskRequest.resume()
    }

}

