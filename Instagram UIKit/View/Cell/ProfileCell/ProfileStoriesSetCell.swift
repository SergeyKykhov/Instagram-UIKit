//
//  ProfileStoriesSetCell.swift
//  Instagram UIKit
//
//  Created by Sergey Kykhov on 24.05.2023.
//

import UIKit
import SnapKit

//Создание ячейки для Stories
class ProfileStoriesSetCell: UITableViewCell {

    //инициализатор для класса ProfileStoriesSetCell
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initialize()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: - Public methods class FeedStoriesSetCell
    func configure(with info: ProfileStoriesCellInfo ) {
        self.items = info
        collectionView.reloadData() //перезапускае коллекцию
    }

    //MARK: - Properties class FeedStoriesSetCell
    private var collectionView: UICollectionView! //создаем колекшен внутри ячейки для Stories
    private var items: ProfileStoriesCellInfo = [] //массив Stories

    private enum UIConstants { //размеры я чейки в коллекции
        static let collectionViewHeight: CGFloat = 106
        static let cellWidth: CGFloat = 72
        static let cellHeight: CGFloat = 98
    }
}//finich class

//MARK: - Extension ProfileStoriesSetCell
private extension ProfileStoriesSetCell {
    func initialize() { //делает все настройки по ячейке
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal //горизонтальный скролин коллекции
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(StoriesItemProfileCell.self, forCellWithReuseIdentifier: String(describing: StoriesItemProfileCell.self)) //регисттируем ячейку в коллекции
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsHorizontalScrollIndicator = false //скрыл индиктор скролинга
        contentView.addSubview(collectionView)
        setupLayout()
    }

    //MARK: - Constraints
    private func setupLayout() {
        //Установил констрейнты для таблицы
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalTo(UIConstants.collectionViewHeight)
        }
    }
}

//MARK: - Extension ProfileStoriesSetCell DataSource, DelegateFlowLayout

extension ProfileStoriesSetCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: StoriesItemProfileCell.self), for: indexPath) as! StoriesItemProfileCell
        cell.configure(with: items[indexPath.item])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIConstants.cellWidth, height: UIConstants.cellHeight)
    }
}


