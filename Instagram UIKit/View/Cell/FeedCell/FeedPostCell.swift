//
//  FeedPostCell.swift
//  Instagram UIKit
//
//  Created by Sergey Kykhov on 20.03.2023.
//


import SnapKit
import UIKit

//Создание ячейки для Post
class FeedPostCell: UITableViewCell {

    //инициализатор для класса FeedStoriesSetCell
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initialize()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: - Public methods class FeedPostCell
    func configure(with info: FeedPostCellInfo) {
        userImageView.image = info.userImage
        usernameLabel.text = info.username
        subtitleLabel.text = info.postSubtitle
        postImageView.image = info.postImage
        likeLable.text = "Нравится: \(info.numberOfLikes)"
        if let comment = info.comment {
            configureCommentLabel(with: comment)
        }
    }

    //MARK: - Properties class FeedStoriesSetCell

    //Константы для размера
    private enum UIConstants {
        static let userImageSize: CGFloat = 35
        static let contentInset: CGFloat = 12
        static let userImageTopInsert: CGFloat = 6
        static let usernameLabelFontSize: CGFloat = 14
        static let subtitleLabelSize:CGFloat = 12
        static let usernameStackToProfileImageOffset: CGFloat = 12
        static let postImageToUsetImageOffset: CGFloat = 12
        static let actionsStackHeight: CGFloat = 24
        static let actionsStackToPostImageOffset: CGFloat = 12
        static let actionsStackSpacing: CGFloat = 10
        static let actionsStackToLikesLableOffset: CGFloat = 12
        static let likesLabelFontSize: CGFloat = 14
        static let commentLableFontSize: CGFloat = 14
        static let commentToLikesOffset: CGFloat = 12
    }

    //свойство для картники
    private let userImageView: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = UIConstants.userImageSize / 2 //закругление для картинки
        view.clipsToBounds = true
        return view
    }()

    //свойства для label
    private let usernameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: UIConstants.usernameLabelFontSize, weight: .bold)
        return label
    }()

    //свойства для subtitleLabel
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: UIConstants.subtitleLabelSize)
        return label
    }()

    //свойства стек вертикальный для subtitleLabel, usernameLabel
    private let usernameStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        return stack
    }()

    // свойство кнопка "..."
    private let optionsButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        button.tintColor = .black
        return button
    }()

    //свойство картинка в посте
    private let postImageView: UIImageView = {
        let view = UIImageView()
        return view
    }()

    //свойство кнопка с лайками под постом
    private let likeButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .black
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        return button
    }()

    //свойство кнопка с комментарием под постом
    private let commentButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .black
        button.setImage(UIImage(systemName: "bubble.right"), for: .normal)
        return button
    }()

    //свойство кнопка с директом под постом
    private let shareButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .black
        button.setImage(UIImage(systemName: "paperplane"), for: .normal)
        return button
    }()

    //свойства стек для кнопок shareButton, commentButton, likeButton
    private let actionStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = UIConstants.actionsStackSpacing
        return stack
    }()

    //свойства для label c лайками
    private let likeLable: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: UIConstants.likesLabelFontSize, weight: .bold)
        return label
    }()

    //свойства для label c комментарием
    private let commentLable: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: UIConstants.commentLableFontSize)
        return label
    }()



}// конец класса

//MARK: - Extension
private extension FeedPostCell {

    //функция делает все настройки по ячейке
    func initialize() {
        selectionStyle = .none //убрал выделение ячейки
        contentView.addSubview(userImageView)
        usernameStack.addArrangedSubview(usernameLabel) //добавили в стек вертикалный usernameStack свойство usernameLabel
        usernameStack.addArrangedSubview(subtitleLabel) //добавили в стек вертикалный usernameStack свойство subtitleLabel
        contentView.addSubview(usernameStack)
        contentView.addSubview(optionsButton)
        contentView.addSubview(postImageView) //добавили картинку из поста
        actionStack.addArrangedSubview(likeButton) //добавили в стек горизонтальный actionStack свойство usernameLabel
        actionStack.addArrangedSubview(commentButton) //добавили в стек горизонтальный actionStack свойство commentButton
        actionStack.addArrangedSubview(shareButton) //добавили в стек горизонтальный actionStack свойство shareButton
        contentView.addSubview(actionStack) //добавили стек горизонтальный actionStack на общую view
        contentView.addSubview(likeLable) //добавили likeLable на общую view
        contentView.addSubview(commentLable) //добавили commentLable на общую view
        setupLayout()
    }

    //Функция отвечающая за выделение жирным шрифтом username в комментарии
    func configureCommentLabel(with comment: CommentsShortInfo) {
        let string = comment.username + " " + comment.commentText
        let attributedString = NSMutableAttributedString(string: string)
        let range = NSRange(location: .zero, length: comment.username.count)
        attributedString.addAttribute(NSAttributedString.Key.font, value: UIFont.boldSystemFont(ofSize: UIConstants.commentLableFontSize), range: range)
        commentLable.attributedText = attributedString
    }

    //MARK: - Constraints
    private func setupLayout() {
        //Установил констрейнты для imageView
        userImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(UIConstants.contentInset)
            make.top.equalToSuperview().inset(UIConstants.userImageTopInsert)
            make.size.equalTo(UIConstants.userImageSize)
        }
        //Установил констрейнты для usernameStack
        usernameStack.snp.makeConstraints { make in
            make.centerY.equalTo(userImageView)
            make.leading.equalTo(userImageView.snp.trailing).offset(UIConstants.usernameStackToProfileImageOffset)
        }
        //Установил констрейнты для optionsButton
        optionsButton.snp.makeConstraints { make in
            make.top.trailing.equalToSuperview().inset(UIConstants.contentInset)
        }
        //Установил констрейнты для postImageView
        postImageView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(userImageView.snp.bottom).offset(UIConstants.postImageToUsetImageOffset)
            make.height.equalTo(contentView.snp.width)
        }
        //Установил констрейнты для actionStack
        actionStack.snp.makeConstraints { make in
            make.height.equalTo(UIConstants.actionsStackHeight)
            make.leading.equalToSuperview().inset(UIConstants.contentInset)
            make.top.equalTo(postImageView.snp.bottom).offset(UIConstants.actionsStackToPostImageOffset)
        }
        //Установил констрейнты для likeLable
        likeLable.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(UIConstants.contentInset)
            make.top.equalTo(actionStack.snp.bottom).offset(UIConstants.actionsStackToLikesLableOffset)
        }
        //Установил констрейнты для commentLable
        commentLable.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(UIConstants.contentInset)
            make.top.equalTo(likeLable.snp.bottom).offset(UIConstants.commentToLikesOffset)
            make.bottom.equalToSuperview().inset(UIConstants.contentInset)
        }
    }


}//конец расширения
