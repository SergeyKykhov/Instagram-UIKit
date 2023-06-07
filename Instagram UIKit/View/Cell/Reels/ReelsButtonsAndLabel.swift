//
//  ReelsButtonsAndLable.swift
//  Instagram UIKit
//
//  Created by Sergey Kykhov on 05.06.2023.
//

import UIKit
import SnapKit

class ReelsButtonsAndLabel: UIView {

    //MARK: - Properties

     let buttonCamera: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "camera"), for: .normal)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let buttonHeart: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private var buttonLabelHeart: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 12)
        label.text = "369 тыс."
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let buttonComment: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "message"), for: .normal)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private var buttonLabelComment: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 12)
        label.text = "939"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let buttonShare: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "paperplane.fill"), for: .normal)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private var buttonLabelShare: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 12)
        label.text = "94,2 тыс."
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let imageViewNickReels: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 50 / 2
        view.contentMode = .scaleAspectFill
        view.image = UIImage(named: "new9")
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.masksToBounds = true
        return view
    }()

    private var labelNickReels: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.text = "N.Geogr"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let buttonNickReels: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Подписаться", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

     let buttonEllipsis: UIButton = {
        let button = UIButton(type: .system)
         button.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    var progressView: UIProgressView = {
        let progress = UIProgressView(progressViewStyle: .default)
        progress.progress = 0
        progress.translatesAutoresizingMaskIntoConstraints = false
        progress.progressTintColor = .white
        return progress
    }()




    //MARK: - Stack
    let stackHeart: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    let stackComment: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    let stackShare: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    let stackAll: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    let stackNickReels: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()



    //MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        startProgress()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
        startProgress()
    }

    //MARK: - Methods

    private func startProgress() {
        var progress: Float = 0
        let totalDuration: Float = 10
        let stepDuration: Float = 0.0001

        Timer.scheduledTimer(withTimeInterval: TimeInterval(stepDuration), repeats: true) { [weak self] timer in
            guard let self = self else {
                timer.invalidate()
                return
            }

            progress += stepDuration / totalDuration
            self.progressView.setProgress(progress, animated: true)

            if progress >= 1 {
                timer.invalidate()
            }
        }
    }

    private func setupUI() {
        stackHeart.addArrangedSubview(buttonHeart)
        stackHeart.addArrangedSubview(buttonLabelHeart)

        stackComment.addArrangedSubview(buttonComment)
        stackComment.addArrangedSubview(buttonLabelComment)

        stackShare.addArrangedSubview(buttonShare)
        stackShare.addArrangedSubview(buttonLabelShare)
        stackShare.addArrangedSubview(buttonEllipsis)

        stackAll.addArrangedSubview(stackHeart)
        stackAll.addArrangedSubview(stackComment)
        stackAll.addArrangedSubview(stackShare)

        stackNickReels.addArrangedSubview(imageViewNickReels)
        stackNickReels.addArrangedSubview(labelNickReels)
        stackNickReels.addArrangedSubview(buttonNickReels)


        addSubview(stackAll)
        addSubview(stackNickReels)
        addSubview(progressView)

        //MARK: - Constraints
        NSLayoutConstraint.activate([
            stackAll.topAnchor.constraint(equalTo: topAnchor),
            stackAll.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackAll.trailingAnchor.constraint(equalTo: trailingAnchor),

            stackNickReels.topAnchor.constraint(equalTo: topAnchor),
            stackNickReels.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackNickReels.trailingAnchor.constraint(equalTo: trailingAnchor),

            imageViewNickReels.widthAnchor.constraint(equalToConstant: 50),
            imageViewNickReels.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
