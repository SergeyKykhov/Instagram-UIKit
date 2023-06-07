//
//  SearchViewController.swift
//  Instagram UIKit
//
//  Created by Sergey Kykhov on 20.03.2023.
//
import UIKit
import SnapKit

class SearchViewController: UIViewController, UICollectionViewDataSource {

    //MARK: - Properties
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: SearchViewController.createCollectionCompositionalLayout())
//    private lazy var searchTextField: UITextField = {
//        let textField = UITextField()
//        textField.textColor = .black
//        textField.backgroundColor = .systemGray4
//        textField.placeholder = "Поиск"
//        return textField
//    }

    let searchTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Поиск"
        textField.backgroundColor = .systemGray4
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.textColor = .black
        textField.borderStyle = .roundedRect
        let searchIcon = UIImage(systemName: "magnifyingglass")
        let searchImageView = UIImageView(image: searchIcon)
        searchImageView.tintColor = .gray
        searchImageView.contentMode = .scaleAspectFit
        searchImageView.frame = CGRect(x: 5, y: 0, width: 20, height: 20)
        textField.leftView = searchImageView
        textField.leftViewMode = .always
        textField.addTarget(self, action: #selector(SearchViewController.textFieldTapped), for: .touchDown)
        return textField
    }()



    //MARK: - Public methods

    //количество элементов в коллекции
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 210
    }

    //переиспользование ячейки
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath)
        return cell
    }

    @objc func textFieldTapped() {
        searchTextField.becomeFirstResponder()
    }



    //MARK: - view lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .black //cделал цвет шеврона черным
        view.addSubview(collectionView) // добавил в родительскую вью коллекцию
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier) //добавили ячейку в collectionView
        view.addSubview(searchTextField)
        //        collectionView.frame = view.bounds //коллекция на весь экран
        collectionView.dataSource = self
        createLayout()
    }

    //MARK: - Layout

    func createLayout() {

        collectionView.snp.makeConstraints { make in
            make.left.right.bottom.equalTo(view)
            make.top.equalTo(view).offset(50) // устанавливаем отступ сверху в 50 единиц
        }
        searchTextField.snp.makeConstraints { make in
            make.left.right.equalTo(view).offset(15)
            make.right.equalTo(view).offset(-15)
            make.bottom.equalTo(collectionView.snp.top).offset(40)
        }
    }

    // метод по компановке блоков в коллекции. Оснвные блоки: Item, Group, Sections
    static func createCollectionCompositionalLayout() -> UICollectionViewCompositionalLayout {

        //ITEM
        let itemFirst = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.333),
            heightDimension: .fractionalHeight(1)))
        itemFirst.contentInsets = NSDirectionalEdgeInsets(top: 1, leading: 1, bottom: 1, trailing: 1)

        let itemSecond = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(0.333)))
        itemSecond.contentInsets = NSDirectionalEdgeInsets(top: 1, leading: 1, bottom: 1, trailing: 1)

        // GROUP
        let verticalGroupFirst = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.333),
            heightDimension: .fractionalHeight(1)),
                                                                  subitem: itemSecond, count: 2)
        verticalGroupFirst.contentInsets = NSDirectionalEdgeInsets(top: 1, leading: 1, bottom: 1, trailing: 1)

        let verticalGroupSecond = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.333),
            heightDimension: .fractionalHeight(1)),
                                                                   subitem: itemSecond, count: 2)
        verticalGroupSecond.contentInsets = NSDirectionalEdgeInsets(top: 1, leading: 1, bottom: 1, trailing: 1)

        let horizontalGroupSection = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalWidth(0.6)),
                                                                        subitems: [verticalGroupFirst, verticalGroupSecond, itemFirst])
        // SECTIONS
        let section = NSCollectionLayoutSection(group: horizontalGroupSection)
        return UICollectionViewCompositionalLayout(section: section)
    }



}// конец класса




