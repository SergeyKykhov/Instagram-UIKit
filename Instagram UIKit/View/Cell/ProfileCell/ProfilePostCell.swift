//
//  ProfilePostCell.swift
//  Instagram UIKit
//
//  Created by Sergey Kykhov on 24.03.2023.
//
//
import UIKit

// Создание ячейки для Profile
class ProfilePostCell: UICollectionViewCell {
    static let identifier = "ProfilePostCell"

    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        imageView.frame = contentView.bounds

        // Установка изображения
        if let image = UIImage(named: "MBDvina") {
            imageView.image = image
        }

        // Установка констрейнтов для imageView
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

