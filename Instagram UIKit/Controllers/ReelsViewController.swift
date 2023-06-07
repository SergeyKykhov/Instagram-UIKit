//
//  ReelsViewController.swift
//  Instagram UIKit
//
//  Created by Sergey Kykhov on 20.03.2023.
//

import UIKit

class ReelsViewController: UIViewController {

    //MARK: - Properties
    let imageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .yellow
        view.contentMode = .scaleAspectFill
        view.image = UIImage(named: "new5")
        view.layer.masksToBounds = false
        view.clipsToBounds = true
        return view
    }()

    let buttons = ReelsButtonsAndLabel()

    //MARK: - view lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brown
        view.addSubview(imageView)
        view.addSubview(buttons.buttonCamera)
        view.addSubview(buttons.stackAll)
        view.addSubview(buttons.stackNickReels)
        view.addSubview(buttons.progressView)
        createLayout()
    }

    //MARK: - Constraints
    func createLayout() {

        imageView.snp.makeConstraints { make in
            make.top.right.left.bottom.equalTo(view).offset(0)
        }

        buttons.buttonCamera.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(50)
            make.right.equalTo(view.snp.right).offset(-15)
        }

        buttons.stackAll.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top).offset(500)
            make.right.equalTo(view.snp.right).offset(-15)
        }
        buttons.progressView.snp.makeConstraints { make in
            make.left.equalTo(view.snp.left).offset(0)
            make.right.equalTo(view.snp.right).offset(0)
            make.bottom.equalTo(view.snp.bottom).offset(-83)
            make.height.equalTo(3)
        }

        buttons.stackNickReels.snp.makeConstraints { make in
            make.left.equalTo(view.snp.left).offset(15)
            make.bottom.equalTo(view.snp.bottom).offset(-120)
        }
    }
}
