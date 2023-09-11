//
//  RadioButtonView.swift
//  SKHUAZ
//
//  Created by 문인호 on 2023/09/10.
//

import UIKit

protocol RadioButtonsStackDelegate: AnyObject {
    func radioButtonStack(_ radioButtonStack: RadioButtonsStack, didSelectValue value: String?)
}

class RadioButtonsStack: UIView {
    
    weak var delegate: RadioButtonsStackDelegate?

    private let stackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alignment = .fill
        view.distribution = .fill
        view.axis = .horizontal
        view.spacing = 11
        return view
    }()

    private var radioViews = [RadioButtonView]()

    var selectedIndex: Int?

    init() {
        super.init(frame: .zero)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    private func setup() {
        addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }

    func set(_ options: [String]) {
        radioViews.removeAll()
        stackView.removeAllArrangedSubviews()
        
        for (index, text) in options.enumerated() {
            let radioView: RadioButtonView = {
                let view = RadioButtonView()
                view.radioButton.tag = index
                view.radioButton.addTarget(self, action: #selector(radioSelected(_:)), for: .valueChanged)
                view.set(text)
                return view
            }()
            stackView.addArrangedSubview(radioView)
            radioViews.append(radioView)
        }
    }
    
    func radioButtonStack(_ radioButtonStack: RadioButtonView, didSelect isSelected: Bool, labelText: String) {
            if isSelected {
                let selectedValue = labelText
                delegate?.radioButtonStack(self, didSelectValue: selectedValue)
            }
        }

    @objc private func radioSelected(_ sender: RadioButton?) {
        guard let sender else { return }
        selectedIndex = sender.tag
        
        radioViews.forEach {
            $0.select($0.radioButton.tag == sender.tag)
        }
    }

    class RadioButtonView: UIView {

        let radioButton: RadioButton = {
            let radioButton = RadioButton(frame: .zero)
            radioButton.translatesAutoresizingMaskIntoConstraints = false
            return radioButton
        }()

        let label: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.numberOfLines = 0
            label.textAlignment = .left
            label.font = .systemFont(ofSize: 14)
            return label
        }()

        let stackView: UIStackView = {
            let view = UIStackView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.alignment = .center
            view.distribution = .fill
            view.axis = .horizontal
            view.spacing = 4
            return view
        }()

        init() {
            super.init(frame: .zero)
            setup()
        }

        required init?(coder: NSCoder) {
            super.init(coder: coder)
            setup()
        }

        func setup() {
            addSubview(stackView)
            stackView.addArrangedSubview(radioButton)
            stackView.addArrangedSubview(label)
            NSLayoutConstraint.activate([
                stackView.topAnchor.constraint(equalTo: topAnchor),
                stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
                stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
                stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
//                radioButton.widthAnchor.constraint(equalToConstant: 30)
            ])
        }

        func set(_ text: String) {
            label.text = text
        }

        func select(_ select: Bool) {
            radioButton.isOn = select
        }
    }
}

extension UIStackView {
    func removeAllArrangedSubviews() {
        let removedSubviews = arrangedSubviews.reduce([]) { (allSubviews, subview) -> [UIView] in
            self.removeArrangedSubview(subview)
            return allSubviews + [subview]
        }
        NSLayoutConstraint.deactivate(removedSubviews.flatMap({ $0.constraints }))
        removedSubviews.forEach({ $0.removeFromSuperview() })
    }
}
