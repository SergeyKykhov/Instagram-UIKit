//
//  LogoNicknameView.swift
//  Instagram UIKit
//
//  Created by Sergey Kykhov on 24.05.2023.
//

import UIKit
import SnapKit

class LogoNicknameView: UIView {

    //MARK: - Properties

    //свойства для label
    private let nicknameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.text = "sergeykykhov"
        return label
    }()

    //MARK: - Init

    init() {
        super.init(frame: .zero)
        initialize()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}//finish class

//MARK: - Extension LogoNicknameView

private extension LogoNicknameView {

    func initialize() {
        //добавили контейнер с изобоадением на родительскую вьюху
        addSubview(nicknameLabel)

        // Раставал констрейнты для логотипа Instagram
        nicknameLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview() // все грани прикованы к границе view
            make.width.equalTo(160) // ширина
            make.height.equalTo(30) // высота
        }
    }
}

