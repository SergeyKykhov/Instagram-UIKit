//
//  ProfileButtons.swift
//  Instagram UIKit
//
//  Created by Sergey Kykhov on 30.05.2023.
//

import UIKit
import SnapKit


class ProfileButtons: UIViewController {

    //MARK: - Properties

    //кнопка плюс на картинке
    let postsButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .systemGray4
        button.setImage(UIImage(systemName: "circle.grid.3x3.fill"), for: .normal)//закрепить изображение
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(postsButtonTapped), for: .touchUpInside)
        return button
    }()

    let videoButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .systemGray4
        button.setImage(UIImage(systemName: "play.rectangle.fill"), for: .normal)//закрепить изображение
        button.addTarget(self, action: #selector(videoButtonTapped), for: .touchUpInside)
        return button
    }()

    let markButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .systemGray4
        button.setImage(UIImage(systemName: "person.crop.rectangle"), for: .normal)//закрепить изображение
        button.addTarget(self, action: #selector(markButtonTapped), for: .touchUpInside)
        return button
    }()

    let changeButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemGray4
        button.setTitle("Изменить", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 12)
        button.setTitleColor(.black, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(ProfileButtons.changeButtonTapped), for: .touchUpInside)
        return button
    }()

    let shareProfileButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemGray4
        button.setTitle("Поделиться профилем", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 12)
        button.titleLabel?.numberOfLines = 1
        button.setTitleColor(.black, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(ProfileButtons.shareButtonTapped), for: .touchUpInside)
        return button
    }()

    let addUserButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .black
        button.setImage(UIImage(systemName: "person.badge.plus"), for: .normal)
        button.setPreferredSymbolConfiguration(UIImage.SymbolConfiguration(scale: .medium), forImageIn: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 5)
        button.backgroundColor = .systemGray4
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(ProfileButtons.addUserTapped), for: .touchUpInside)
        return button
    }()

    //MARK: - Methods

    // Действия на экшен по кнопке.
@objc private func postsButtonTapped() {
    let alert = UIAlertController(title: "Кнопка постов", message: "тут должен быть переход", preferredStyle: .alert)
    let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
    alert.addAction(okAction)
    self.present(alert, animated: true, completion: nil)
}

@objc private func videoButtonTapped() {
    let alert = UIAlertController(title: "Кнопка видео", message: "тут должен быть переход на видео", preferredStyle: .alert)
    let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
    alert.addAction(okAction)
    self.present(alert, animated: true, completion: nil)
}
@objc private func markButtonTapped() {
    let alert = UIAlertController(title: "Кнопка вас отметили", message: "тут должен быть переход на блок с вашей отметкой", preferredStyle: .alert)
    let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
    alert.addAction(okAction)
    self.present(alert, animated: true, completion: nil)
}

@objc private func changeButtonTapped() {
        print("Нажата кнопка ИЗМЕНИТЬ")
    }
@objc private func shareButtonTapped() {
        print("Нажата кнопка ПОДЕЛИТЬСЯ ПРОФИЛЕМ")
    }
@objc private func addUserTapped() {
        print("Нажата кнопка ДОБАВИТЬ ПОЛЬЗОВАТЕЛЯ")
    }
}//finish class
