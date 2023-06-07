//
//  NewPublicationViewController.swift
//  Instagram UIKit
//
//  Created by Sergey Kykhov on 20.03.2023.
//

import UIKit
import SnapKit

class NewPublicationViewController: UIViewController {

    //MARK: - Properties

    let imageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .yellow
        view.contentMode = .scaleAspectFill
        view.image = UIImage(named: "new6")
        view.layer.masksToBounds = false
        view.clipsToBounds = true
        return view
    }()

    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: NewPublicationViewController.createCollectionCompositionalLayout())

    let buttons = ButtonsNewPublication()

    //MARK: - Methods
    //Левая часть кнопок. Добавил логотип LogoNicknameView
    static func makeProfileLeftBarButtonItem() -> UIBarButtonItem {
        let closeBarButtonItem = UIBarButtonItem(title: nil, image: UIImage(systemName: "xmark"), target: self, action: #selector(self.closeBarButtonItem))
        return closeBarButtonItem
    }
    
    @objc func closeBarButtonItem() {
        let feedViewController = FeedViewController() // создаем экземпляр FeedViewController
        if let navigationController = self.navigationController {
            // если навигационный контроллер открыт, добавляем контроллер в стек и переходим на него
            navigationController.pushViewController(feedViewController, animated: true)
            navigationController.popToViewController(feedViewController, animated: true)
        } else {
            // если навигационный контроллер не открыт, просто показываем контроллер
            present(feedViewController, animated: true, completion: nil)
        }
    }

    //Правая часть кнопок. Добавил логотип
    static func makeProfileRightBarButtonItem() -> UIBarButtonItem {
        let closeBarButtonItem = UIBarButtonItem(title: "Далее", image: nil, target: self, action: nil)
        return closeBarButtonItem
    }


        // обработка жеста нажатия на ячейку
    @objc func handleCollectionViewCellTap(_ sender: UITapGestureRecognizer) {
        let touchPoint = sender.location(in: collectionView)

        if let indexPath = collectionView.indexPathForItem(at: touchPoint) {
            // Получаем индекс выбранной ячейки
            let selectedCellIndex = indexPath.item

            // Изменяем изображение в imageView на основе выбранной ячейки
            imageView.image = UIImage(named: NewPublicationCellInfo.image[selectedCellIndex])
        }
    }

    //MARK: - view lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = NewPublicationViewController.makeProfileLeftBarButtonItem()
        navigationItem.leftBarButtonItem?.tintColor = .black
        navigationItem.rightBarButtonItem = NewPublicationViewController.makeProfileRightBarButtonItem()

        view.backgroundColor = .white

        view.addSubview(imageView)
        view.addSubview(buttons.buttonRecent)
        view.addSubview(buttons.stackViewFewMakePhoto)

        view.addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(ProfilePostCell.self, forCellWithReuseIdentifier: ProfilePostCell.identifier)

        // обработка жеста по нажатию на ячейку
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleCollectionViewCellTap(_:)))
        collectionView.addGestureRecognizer(tapGesture)



        createLayout()
    }

    //MARK: - Constraints

    func createLayout() {

        imageView.snp.makeConstraints { make in
            make.left.equalTo(view).offset(50)
            make.right.equalTo(view).offset(-50)
            make.top.equalTo(view).offset(100)
            make.bottom.equalTo(collectionView.snp.top).offset(-50)
        }

        buttons.buttonRecent.snp.makeConstraints { make in
            make.left.equalTo(view).offset(15)
            make.bottom.equalTo(collectionView.snp.top).offset(-15)
        }

        buttons.stackViewFewMakePhoto.snp.makeConstraints { make in
            make.right.equalTo(view).offset(-15)
            make.bottom.equalTo(collectionView.snp.top).offset(-15)
        }

        collectionView.snp.makeConstraints { make in
            make.left.right.bottom.equalTo(view)
            make.top.equalTo(view).offset(550) // устанавливаем отступ сверху в 450 единиц
            }
    }

    //     метод по компановке блоков в коллекции. Оснвные блоки: Item, Group, Sections
    static func createCollectionCompositionalLayout() -> UICollectionViewCompositionalLayout {
        // ITEM
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)))
        item.contentInsets = NSDirectionalEdgeInsets(top: 1, leading: 1, bottom: 1, trailing: 1)

        // GROUP
        let horizontalGroup = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)),
                                                                 subitem: item, count: 4)
        let verticalGroup = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)),
                                                             subitem: horizontalGroup, count: 3)

        // SECTION
        let section = NSCollectionLayoutSection(group: verticalGroup)
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }

} //finish class

//MARK: - Extension UICollectionViewDataSource (коллекции),
extension NewPublicationViewController: UICollectionViewDataSource, UICollectionViewDelegate {

    //количество элементов в коллекции
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return NewPublicationCellInfo.image.count
    }

    //переиспользование ячейки коллекции
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfilePostCell.identifier, for: indexPath) as! ProfilePostCell
        cell.imageView.image = UIImage(named: NewPublicationCellInfo.image[indexPath.item])
        return cell
    }

}
