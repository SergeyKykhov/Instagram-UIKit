//
//  StoriesItemCell.swift
//  Instagram UIKit
//
//  Created by Sergey Kykhov on 20.03.2023.
//

import SnapKit
import UIKit

class StoriesItemCell: UICollectionViewCell {

    //инициализатор для класса StoriesItemCell
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: - Public methods
    func configure(with info: FeedStoriesItemCellInfo) {
        imageView.image = info.image
        usernameLabel.text = info.username
        plusButton.isHidden = !info.isAddButtonVisible //кнопка видна только для первой картинки
        circle.isHidden = !info.isNewStory //кнопка видна только у тех у кого есть стори
    }

    //MARK: - Private properties

    //свойство для картники
    private let imageView: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = UIConstants.imageSize / 2 //закругдение для картинки
        view.clipsToBounds = true
        return view
    }()

    //свойства для label
    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: UIConstants.usernameFontSiz) //размер шрифта для label
        label.textAlignment = .center //расположение шрифта по центру
        return label
    }()

    //кнопка плюс на картинке
    private let plusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "Plus"), for: .normal)//закрепить изображение
        return button
    }()

    //обводка у картинки
    private let circle: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "CircleInsta")
        return view
    }()

    //Константы для размера
    private enum UIConstants {
        static let imageSize: CGFloat = 60
        static let imagetoCellInset: CGFloat = 6
        static let labelToCell: CGFloat = 6
        static let imageToLabeOffset: CGFloat = 6 //расстояние между картникой и лейблом
        static let usernameFontSiz: CGFloat = 12 //размер шрифта для label
        static let plusButtonSiza: CGFloat = 20 //разсер plusButton
        static let circleSize: CGFloat = 72 //разсер circle
    }
} //конец класса

//MARK: - Extension
private extension StoriesItemCell {
    func initialize() {
        contentView.addSubview(imageView)
        contentView.addSubview(usernameLabel)
        contentView.addSubview(plusButton)
        contentView.addSubview(circle)
        setupLayout()
    }

    //MARK: - Constraints
    private func setupLayout() {
        //Установил констрейнты для imageView
        imageView.snp.makeConstraints { make in
            make.size.equalTo(UIConstants.imageSize)
            make.leading.top.trailing.equalToSuperview().inset(UIConstants.imagetoCellInset)
        }
        //Установил констрейнты для usernameLabel
        usernameLabel.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview().inset(UIConstants.labelToCell)
            make.top.equalTo(imageView.snp.bottom).offset(UIConstants.imageToLabeOffset)
        }
        //Установил констрейнты для plusButton
        plusButton.snp.makeConstraints { make in
            make.trailing.bottom.equalTo(imageView) //расположить внизу справа отностиельно imageView
            make.size.equalTo(UIConstants.plusButtonSiza)
        }
        //Установил констрейнты для circle
        circle.snp.makeConstraints { make in
            make.center.equalTo(imageView)
            make.size.equalTo(UIConstants.circleSize)
        }
    }


}
