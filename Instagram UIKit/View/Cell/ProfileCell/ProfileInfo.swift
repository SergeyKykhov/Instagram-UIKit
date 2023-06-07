//
//  ProfileInfo.swift
//  Instagram UIKit
//
//  Created by Sergey Kykhov on 31.05.2023.
//

import UIKit
import SnapKit

class ProfileInfo: UIView{

    //MARK: - Properties

    let imageView: UIImageView = {
        let view = UIImageView()

        view.layer.cornerRadius = 100 / 2
        view.contentMode = .scaleAspectFill
        view.image = UIImage(named: "AvaCat")
        view.layer.masksToBounds = false
        view.clipsToBounds = true
        return view
    }()


    //кнопка плюс на картинке
     let plusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "Plus"), for: .normal)//закрепить изображение
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    //свойства для nameLabel
     let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.text = "Sergey Kykhov"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    //свойства для label публикации
     let publications: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .light)
        label.text = "Публикации"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

     let publicationsCount: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.text = "74"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    //свойства для label Подписчики
     let subscribers: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .light)
        label.text = "Подписчики"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

     let subscribersCount: UILabel = {
        let label = UILabel()
         label.font = .systemFont(ofSize: 16, weight: .bold)
        label.text = "62"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    //свойства для label Подписки
     let subscriptions: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .light)
        label.text = "Подписки"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    //свойства для label публикации
     let subscriptionsCount: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.text = "84"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()






//    func fdfd() {
//        // Создаем главный стек-контейнер
//        let stackView = UIStackView()
//        stackView.axis = .vertical // Устанавливаем вертикальную ориентацию
//        stackView.spacing = 10 // Устанавливаем расстояние между элементами стека
//
//        // Добавляем все элементы в стек
//        stackView.addArrangedSubview(imageView)
//        stackView.addArrangedSubview(plusButton)
//        stackView.addArrangedSubview(nameLabel)
//        stackView.addArrangedSubview(publications)
//        stackView.addArrangedSubview(publicationsCount)
//        stackView.addArrangedSubview(subscribers)
//        stackView.addArrangedSubview(subscribersCount)
//        stackView.addArrangedSubview(subscriptions)
//        stackView.addArrangedSubview(subscriptionsCount)
//        stackView.addArrangedSubview(conteiner)
//
//        // Устанавливаем констрейнты для стек-контейнера
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//
//    }


}//finish class




