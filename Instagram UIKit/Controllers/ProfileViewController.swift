//
//  ProfileViewController.swift
//  Instagram UIKit
//
//  Created by Sergey Kykhov on 20.03.2023.
//

import UIKit
import SnapKit


class ProfileViewController: UIViewController {

    //MARK: - Properties
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: ProfileViewController.createCollectionCompositionalLayout())

    private let tableView = UITableView()
    private var items: [ProfileItemType] = [
        .stories([
            ProfileStoriesItemCellInfo(image: UIImage(named: "Georg")!, storiesName: "Georgia", isAddButtonVisible: false, isNewStory: true),
            ProfileStoriesItemCellInfo(image: UIImage(named: "Tyrkiye")!, storiesName: "Türkiye", isAddButtonVisible: false, isNewStory: false),
            ProfileStoriesItemCellInfo(image: UIImage(named: "Germany")!, storiesName: "Germany", isAddButtonVisible: false, isNewStory: false),
            ProfileStoriesItemCellInfo(image: UIImage(named: "paraplan")!, storiesName: "Мир", isAddButtonVisible: false, isNewStory: false),
            ProfileStoriesItemCellInfo(image: UIImage(named: "Parusa")!, storiesName: "Паруса", isAddButtonVisible: false, isNewStory: false),
            ProfileStoriesItemCellInfo(image: UIImage(named: "Rosa")!, storiesName: "Rosa", isAddButtonVisible: false, isNewStory: false),
            ProfileStoriesItemCellInfo(image: UIImage(named: "Zimmer")!, storiesName: "Zimmer", isAddButtonVisible: false, isNewStory: false),
            ProfileStoriesItemCellInfo(image: UIImage(named: "BigW")!, storiesName: "BigWood", isAddButtonVisible: false, isNewStory: false)
        ])
    ] //массив блока сторис

    // Создал экземпляр класса ProfileButtons. Кнопки
    private let profileButtons = ProfileButtons()
    private let profileInfo = ProfileInfo()

    //MARK: - Methods
    //Левая часть кнопок. Добавил логотип LogoNicknameView
    static func makeProfileLeftBarButtonItem() -> UIBarButtonItem {
        let logoBarButtonItem = UIBarButtonItem(customView: LogoNicknameView()) // добавили лого Nickname
        return logoBarButtonItem
    }

    //Правая часть кнопок. Создали кнопки и добивили с селекторе их действия.
    static func makeProfileRightBarButtonItems() -> [UIBarButtonItem] {
        let addPlusBarButtonItem = UIBarButtonItem(title: nil, image: UIImage(systemName: "plus.app.fill"), target: self, action: nil, menu: ProfileViewController.makePlustDropMenu())
        let addLineBarButtonItem = UIBarButtonItem(title: nil, image: UIImage(systemName: "line.3.horizontal"), target: self, action: nil, menu: ProfileViewController.makeLineDropMenu())
        return [addLineBarButtonItem, addPlusBarButtonItem]
    }

    //Создал методы для открытия меню DropMenu
    static func makePlustDropMenu() -> UIMenu {
        let subsItemFirst = UIAction(title: "Новая публикация", image: UIImage(systemName: "plus")) { _ in
            print("Нажата кнопка СОЗДАТЬ ПУБЛИКАЦИЮ")
        }
        return UIMenu(title: "", children: [subsItemFirst])
    }

    static func makeLineDropMenu() -> UIMenu {
        let subsItemSecond = UIAction(title: "Настройки", image: UIImage(systemName: "text.line.first.and.arrowtriangle.forward")) { _ in
            print("Нажата кнопка НАСТРОЙКИ ПРОФИЛЯ")
        }
        return UIMenu(title: "", children: [subsItemSecond])
    }

    //MARK: - view lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .black //cделал цвет шеврона черным
        navigationItem.leftBarButtonItem = ProfileViewController.makeProfileLeftBarButtonItem() //добавил левый ряд кнопок
        navigationItem.rightBarButtonItems = ProfileViewController.makeProfileRightBarButtonItems() //добавил правый ряд кнопок

        view.addSubview(tableView) // добавил в родительскую вью таблицу
        tableView.separatorColor = .clear //убрал у таблицы полосу сверху и снизу (границы таблицы)
        tableView.showsVerticalScrollIndicator = false
        tableView.dataSource = self //Настройка таблицы
        tableView.register(ProfileStoriesSetCell.self, forCellReuseIdentifier: String(describing: ProfileStoriesSetCell.self)) //регистрация ячейки Stories

        view.addSubview(collectionView) // добавил в родительскую вью коллекцию
        collectionView.dataSource = self
        collectionView.register(ProfilePostCell.self, forCellWithReuseIdentifier: ProfilePostCell.identifier) //добавили ячейку в collectionView

        view.addSubview(profileButtons.postsButton)
        view.addSubview(profileButtons.videoButton)
        view.addSubview(profileButtons.markButton)
        view.addSubview(profileButtons.changeButton)
        view.addSubview(profileButtons.shareProfileButton)
        view.addSubview(profileButtons.addUserButton)

        view.addSubview(profileInfo.imageView)
        view.addSubview(profileInfo.plusButton)
        view.addSubview(profileInfo.nameLabel)
        view.addSubview(profileInfo.publications)
        view.addSubview(profileInfo.publicationsCount)
        view.addSubview(profileInfo.subscribers)
        view.addSubview(profileInfo.subscribersCount)
        view.addSubview(profileInfo.subscriptions)
        view.addSubview(profileInfo.subscriptionsCount)

        createLayout()
    }

    //MARK: - Constraints

// расстановка коллекции и таблицы на главной view
    func createLayout() {

        profileInfo.publicationsCount.snp.makeConstraints { make in
            make.right.equalTo( profileInfo.subscribersCount.snp.left).offset(-60)
            make.bottom.equalTo(profileInfo.nameLabel.snp.top).offset(-65)
        }
        profileInfo.publications.snp.makeConstraints { make in
            make.right.equalTo(profileInfo.subscribers.snp.left).offset(-10)
            make.bottom.equalTo(profileInfo.nameLabel.snp.top).offset(-50)
        }


        profileInfo.subscribersCount.snp.makeConstraints { make in
            make.right.equalTo(profileInfo.subscriptionsCount.snp.left).offset(-53)
            make.bottom.equalTo(profileInfo.nameLabel.snp.top).offset(-65)
        }
        profileInfo.subscribers.snp.makeConstraints { make in
            make.right.equalTo(profileInfo.subscriptions.snp.left).offset(-10)
            make.bottom.equalTo(profileInfo.nameLabel.snp.top).offset(-50)
        }


        profileInfo.subscriptionsCount.snp.makeConstraints { make in
            make.right.equalTo(view).offset(-53)
            make.bottom.equalTo(profileInfo.nameLabel.snp.top).offset(-65)
        }
        profileInfo.subscriptions.snp.makeConstraints { make in
            make.right.equalTo(view).offset(-35)
            make.bottom.equalTo(profileInfo.nameLabel.snp.top).offset(-50)
        }



        profileInfo.nameLabel.snp.makeConstraints { make in
            make.left.equalTo(view).offset(15)
            make.bottom.equalTo(profileButtons.changeButton.snp.top).offset(-15)
        }

        profileInfo.imageView.snp.makeConstraints { make in
            make.height.width.equalTo(100)
            make.left.equalTo(view).offset(15)
            make.bottom.equalTo(profileInfo.nameLabel.snp.top).offset(-15)
        }

        profileInfo.plusButton.snp.makeConstraints { make in
            make.height.width.equalTo(25)
            make.right.equalTo(profileInfo.imageView.snp.right).offset(0)
            make.bottom.equalTo(profileInfo.imageView.snp.bottom).offset(0)
        }

        tableView.snp.makeConstraints { make in
            make.top.equalTo(collectionView.snp.top).offset(-150)
            make.bottom.equalTo(collectionView.snp.top).offset(-60)
            make.left.equalTo(view).offset(1)
            make.right.equalTo(view).offset(-1)

        collectionView.snp.makeConstraints { make in
            make.left.right.bottom.equalTo(view)
            make.top.equalTo(view).offset(450) // устанавливаем отступ сверху в 450 единиц
            }
        }

        profileButtons.videoButton.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.bottom.equalTo(collectionView.snp.top).offset(-15)
        }

       profileButtons.postsButton.snp.makeConstraints { make in
            make.right.equalTo(profileButtons.videoButton.snp.left).offset(-100)
            make.bottom.equalTo(collectionView.snp.top).offset(-15)
        }

        profileButtons.markButton.snp.makeConstraints { make in
            make.left.equalTo(profileButtons.videoButton.snp.right).offset(100)
            make.bottom.equalTo(collectionView.snp.top).offset(-15)
        }

        profileButtons.changeButton.snp.makeConstraints { make in
            make.left.equalTo(view).offset(15)
            make.bottom.equalTo(tableView.snp.top).offset(-10)
            make.right.equalTo(view).offset(-230)
            make.top.equalTo(tableView.snp.top).offset(-40)
        }

        profileButtons.shareProfileButton.snp.makeConstraints { make in
            make.left.equalTo(profileButtons.changeButton.snp.right).offset(7)
            make.bottom.equalTo(tableView.snp.top).offset(-10)
            make.right.equalTo(view).offset(-52)
            make.top.equalTo(tableView.snp.top).offset(-40)
        }
        profileButtons.addUserButton.snp.makeConstraints { make in
            make.right.equalTo(view).offset(-15)
            make.top.equalTo(tableView.snp.top).offset(-40)
            make.left.equalTo(profileButtons.shareProfileButton.snp.right).offset(7)
            make.bottom.equalTo(tableView.snp.top).offset(-10)
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
                                                                 subitem: item, count: 3)
        let verticalGroup = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)),
                                                             subitem: horizontalGroup, count: 3)

        // SECTION
        let section = NSCollectionLayoutSection(group: verticalGroup)
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }

} // finish class

//MARK: - Extension UITableViewDataSource, UICollectionViewDataSource (настройка таблицы и коллекции),
extension ProfileViewController: UITableViewDataSource, UICollectionViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count //столько ячеек сколько элементов в массиве(в свойстве items)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.row]
        switch item {
        case .stories(let info): // создается ячейка stories по конфигурации из файла ProfileStoriesSetCell
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ProfileStoriesSetCell.self), for: indexPath) as! ProfileStoriesSetCell
            cell.configure(with: info)
            return cell
        }
    }

    //количество элементов в коллекции
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ProfilePostCellInfo.image.count
    }

    //переиспользование ячейки коллекции
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfilePostCell.identifier, for: indexPath) as! ProfilePostCell
        cell.imageView.image = UIImage(named: ProfilePostCellInfo.image[indexPath.item])
        return cell
    }

}
