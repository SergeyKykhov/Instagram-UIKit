//
//  ButtonsNewPublication.swift
//  Instagram UIKit
//
//  Created by Sergey Kykhov on 05.06.2023.
//

import UIKit
import SnapKit

class ButtonsNewPublication: UIView {

    //MARK: - Properties

    let buttonRecent: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Недавние", for: .normal)
        button.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        button.tintColor = .black
        button.semanticContentAttribute = .forceRightToLeft
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let buttonFewPhotos: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "square.on.square"), for: .normal)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let buttonMakePhoto: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "camera"), for: .normal)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    let stackViewFewMakePhoto: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 15
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    //MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }

    //MARK: - Methods
    private func setupUI() {
        stackViewFewMakePhoto.addArrangedSubview(buttonFewPhotos)
        stackViewFewMakePhoto.addArrangedSubview(buttonMakePhoto)
        addSubview(stackViewFewMakePhoto)

        //MARK: - Constraints

        NSLayoutConstraint.activate([
            stackViewFewMakePhoto.topAnchor.constraint(equalTo: topAnchor),
            stackViewFewMakePhoto.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackViewFewMakePhoto.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
