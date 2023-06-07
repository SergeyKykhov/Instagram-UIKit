//
//  FeedViewController.swift
//  Instagram UIKit
//
//  Created by Sergey Kykhov on 20.03.2023.
//

import UIKit
import SnapKit


class FeedViewController: UIViewController {

    //MARK: - Properties
    private let tableView = UITableView()
    private var items: [FeedItemType] = [
        .stories([
            FeedStoriesItemCellInfo(image: UIImage(named: "AvaCat")!, username: "sergeykykhov", isAddButtonVisible: true, isNewStory: false),
            FeedStoriesItemCellInfo(image: UIImage(named: "MBDvina")!, username: "sokolov", isAddButtonVisible: false, isNewStory: true),
            FeedStoriesItemCellInfo(image: UIImage(named: "new4")!, username: "john", isAddButtonVisible: false, isNewStory: true),
            FeedStoriesItemCellInfo(image: UIImage(named: "Profile15")!, username: "liza", isAddButtonVisible: false, isNewStory: true),
            FeedStoriesItemCellInfo(image: UIImage(named: "Profile1")!, username: "nikita", isAddButtonVisible: false, isNewStory: false),
            FeedStoriesItemCellInfo(image: UIImage(named: "new10")!, username: "katrin", isAddButtonVisible: false, isNewStory: false),
            FeedStoriesItemCellInfo(image: UIImage(named: "Profile11")!, username: "olga", isAddButtonVisible: false, isNewStory: false),
            FeedStoriesItemCellInfo(image: UIImage(named: "Profile5")!, username: "irina", isAddButtonVisible: false, isNewStory: false),
            FeedStoriesItemCellInfo(image: UIImage(named: "Profile9")!, username: "laura", isAddButtonVisible: false, isNewStory: false),
            FeedStoriesItemCellInfo(image: UIImage(named: "new8")!, username: "mint", isAddButtonVisible: false, isNewStory: false),
            FeedStoriesItemCellInfo(image: UIImage(named: "Profile5")!, username: "temi", isAddButtonVisible: false, isNewStory: false),
            FeedStoriesItemCellInfo(image: UIImage(named: "MBDvina")!, username: "barber", isAddButtonVisible: false, isNewStory: false)
        ]),
        .post(FeedPostCellInfo(userImage: UIImage(named: "MBDvina")!, username: "dmitriy_mtn", postSubtitle: "М3", postImage: UIImage(named: "MBDvina")!, numberOfLikes: 105, comment: CommentsShortInfo(username: "sergeykykhov", commentText: "very cool"))),
        .post(FeedPostCellInfo(userImage: UIImage(named: "Profile3")!, username: "laura", postSubtitle: "New York", postImage: UIImage(named: "AvaCat")!, numberOfLikes: 199, comment: CommentsShortInfo(username: "temi", commentText: "Было круто!!!!!"))),
        .post(FeedPostCellInfo(userImage: UIImage(named: "MBDvina")!, username: "dmitriy_mtn", postSubtitle: "Ладожские шхеры", postImage: UIImage(named: "MBDvina")!, numberOfLikes: 105, comment: CommentsShortInfo(username: "sergeykykhov", commentText: "Было круто!!!!!"))),
        .post(FeedPostCellInfo(userImage: UIImage(named: "AvaCat")!, username: "dmitriy_mtn", postSubtitle: "Ладожские шхеры", postImage: UIImage(named: "AvaCat")!, numberOfLikes: 105, comment: CommentsShortInfo(username: "sergeykykhov", commentText: "Было круто!!!!!"))),
        .post(FeedPostCellInfo(userImage: UIImage(named: "MBDvina")!, username: "dmitriy_mtn", postSubtitle: "Ладожские шхеры", postImage: UIImage(named: "AvaCat")!, numberOfLikes: 105, comment: CommentsShortInfo(username: "sergeykykhov", commentText: "Было круто!!!!!"))),
        .post(FeedPostCellInfo(userImage: UIImage(named: "MBDvina")!, username: "dmitriy_mtn", postSubtitle: "Ладожские шхеры", postImage: UIImage(named: "MBDvina")!, numberOfLikes: 105, comment: CommentsShortInfo(username: "sergeykykhov", commentText: "Было круто!!!!!"))),
        .post(FeedPostCellInfo(userImage: UIImage(named: "AvaCat")!, username: "dmitriy_mtn", postSubtitle: "Ладожские шхеры", postImage: UIImage(named: "AvaCat")!, numberOfLikes: 105, comment: CommentsShortInfo(username: "sergeykykhov", commentText: "Было круто!!!!!")))

    ] //массив блока сторис и пост

    //MARK: - view lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
}

//MARK: - Extension UITableViewDataSource (настройка таблицы)
extension FeedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count //столько ячеек сколько элементов в массиве(в свойстве items)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell { // метод отвечает за отображение ячейки в таблице
        let item = items[indexPath.row]
        switch item {
        case .stories(let info): // создается ячейка stories по конфигурации из файла FeedStoriesSetCell
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FeedStoriesSetCell.self), for: indexPath) as! FeedStoriesSetCell
            cell.configure(with: info)
            return cell

        case .post(let post): // создается ячейка post по конфигурации из файла FeedPostCell
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FeedPostCell.self), for: indexPath) as! FeedPostCell
            cell.configure(with: post)
            return cell
        }
    }
}
//MARK: - Extension
extension FeedViewController {

    // Тут добавляем иерархию View
    func initialize() {
        view.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .black //cделал цвет шеврона черным
        navigationItem.leftBarButtonItems = FeedViewController.makeLeftBarButtonItems() //добавил левый ряд кнопок
        navigationItem.rightBarButtonItems = FeedViewController.makeRightBarButtonItems() //добавил правый ряд кнопок
        view.addSubview(tableView) // добавил в родительскую вью таблицу
        tableView.separatorColor = .clear //убрал у таблицы полосу сверху и снизу (границы таблицы)
        tableView.showsVerticalScrollIndicator = false
        tableView.dataSource = self //Настройка таблицы
        tableView.register(FeedStoriesSetCell.self, forCellReuseIdentifier: String(describing: FeedStoriesSetCell.self)) //регистрация ячейки Stories
        tableView.register(FeedPostCell.self, forCellReuseIdentifier: String(describing: FeedPostCell.self)) //регистрация ячейки Post
        setupLayout() // добавил констрейнты

    }

    //Левая часть кнопок. Создал шеврон и слева от него добавил логотип Instagram который создали в LogoInstagramView
    static func makeLeftBarButtonItems() -> [UIBarButtonItem] {
        let logoBarButtonItem = UIBarButtonItem(customView: LogoInstagramView()) // добавили лого Instagram
        let dropDownButtonItem = UIBarButtonItem(title: nil, image: UIImage(systemName: "chevron.down"), target: self, action: nil, menu: FeedViewController.makeDropDownMenu())
        return [logoBarButtonItem, dropDownButtonItem]
    }
    //Создал метод для открытия двух кнопок в шевроне
     static func makeDropDownMenu() -> UIMenu {
        let subsItem = UIAction(title: "Подписки", image: UIImage(systemName: "person.2")) { _ in
            print("кнопка Подпиcки")
        }
        let favsItem = UIAction(title: "Избранное", image: UIImage(systemName: "star")) { _ in
            print("кнопка Избранное")
        }
        return UIMenu(title: "", children: [subsItem, favsItem])
    }

        //Правая часть кнопок. Создали кнопки и добивили с селекторе их действия.
    static func makeRightBarButtonItems() -> [UIBarButtonItem] {
        let addHeartBarButtonItem = UIBarButtonItem(title: nil, image: UIImage(systemName: "heart"), target: self, action: nil, menu: FeedViewController.makeHeartDropMenu())
        let addBoltBarButtonItem = UIBarButtonItem(title: nil, image: UIImage(systemName: "bolt.horizontal.circle"), target: self, action: nil, menu: FeedViewController.makeBoltDropMenu())
        return [addHeartBarButtonItem, addBoltBarButtonItem]
    }

        //Создал методы для открытия меню DropMenu
    static func makeHeartDropMenu() -> UIMenu {
       let subsItemSecond = UIAction(title: "Уведомления", image: UIImage(systemName: "bell.fill")) { _ in
           print("кнопка уведомления")
       }
       return UIMenu(title: "", children: [subsItemSecond])
   }

    static func makeBoltDropMenu() -> UIMenu {
       let subsItemFirst = UIAction(title: "Директ", image: UIImage(systemName: "paperplane.fill")) { _ in
           print("кнопка директ")
       }
       return UIMenu(title: "", children: [subsItemFirst])
   }

    //MARK: - Constraints
    private func setupLayout() {

        //Установил констрейнты для таблицы
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

}
