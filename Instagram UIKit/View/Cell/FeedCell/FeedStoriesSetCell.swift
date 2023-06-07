//
//  FeedStoriesSetCell.swift
//  Instagram UIKit
//
//  Created by Sergey Kykhov on 20.03.2023.
//

import SnapKit
import UIKit

//Создание ячейки для Stories
class FeedStoriesSetCell: UITableViewCell {

    //инициализатор для класса FeedStoriesSetCell
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initialize()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: - Public methods class FeedStoriesSetCell
    func configure(with info: FeedStoriesCellInfo ) {
        self.items = info
        collectionView.reloadData() //перезапускае коллекцию
    }

    //MARK: - Properties class FeedStoriesSetCell
    private var collectionView: UICollectionView! //создаем колекшен внутри ячейки для Stories
    private var items: FeedStoriesCellInfo = [] //массив Stories

    private enum UIConstants { //размеры я чейки в коллекции
        static let collectionViewHeight: CGFloat = 106
        static let cellWidth: CGFloat = 72
        static let cellHeight: CGFloat = 98
    }
}

//MARK: - Extension
private extension FeedStoriesSetCell {
    func initialize() { //делает все настройки по ячейке
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal //горизонтальный скролин коллекции
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(StoriesItemCell.self, forCellWithReuseIdentifier: String(describing: StoriesItemCell.self)) //регисттируем ячейку в коллекции
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

extension FeedStoriesSetCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: StoriesItemCell.self), for: indexPath) as! StoriesItemCell
        cell.configure(with: items[indexPath.item])
        return cell
    }

}

extension FeedStoriesSetCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIConstants.cellWidth, height: UIConstants.cellHeight)
    }
}


