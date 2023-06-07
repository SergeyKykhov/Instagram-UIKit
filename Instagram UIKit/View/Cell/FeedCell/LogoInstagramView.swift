//
//  LogoInstagramView.swift
//  Instagram UIKit
//
//  Created by Sergey Kykhov on 20.03.2023.
//
import UIKit
import SnapKit

class LogoInstagramView: UIView {

    //MARK: - Constants

    //Тут храним размеры контйнера для изобрадения лого.
    private enum UIConstants {
        static let logoWidth: CGFloat = 120
        static let logoHeight: CGFloat = 30
    }

    //MARK: - Properties

    //Создал контейнер под изобрадение логотипа
    private let imageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "LogoInstagram")
        return view
    }()


    //MARK: - Init

    init() {
        super.init(frame: .zero)
        initialize()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

//MARK: - Extension LogoInstagramView

private extension LogoInstagramView {

    func initialize() {
        //добавили контейнер с изобоадением на родительскую вьюху
        addSubview(imageView)

        // Раставал констрейнты для логотипа Instagram
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview() // все грани прикованы к границе view
            make.width.equalTo(UIConstants.logoWidth) // ширина
            make.height.equalTo(UIConstants.logoHeight) // высота
        }
    }

}


