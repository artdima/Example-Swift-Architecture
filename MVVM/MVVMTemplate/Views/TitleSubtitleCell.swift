//
//  TitleSubtitleCell.swift
//  MVVMTemplate
//
//  Created by Medyannik Dmitri on 29.07.2020.
//  Copyright © 2020 Medyannik Dmitri. All rights reserved.
//

import UIKit

final class TitleSubtitleCell: UITableViewCell {
    private var titleLabel = UILabel()
    var subtitleTextField = UITextField()
    private var verticalStackView = UIStackView()
    private let padding: CGFloat = 15
    
    private var datePickerView = UIDatePicker()
    private var toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    lazy var doneButton: UIBarButtonItem = {
        UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonTapped))
    }()
    
    private var photoImageView = UIImageView()
    
    private var viewModel: TitleSubtitleCellViewModel?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
        setupHierarchy()
        setupLayout()
    }
    
    func update(with viewModel: TitleSubtitleCellViewModel) {
        self.viewModel = viewModel
        titleLabel.text = viewModel.title
        subtitleTextField.text = viewModel.subtitle
        subtitleTextField.placeholder = viewModel.placeholder
        subtitleTextField.inputView = viewModel.type == .text ? nil : datePickerView
        subtitleTextField.inputAccessoryView = viewModel.type == .text ? nil : toolBar
        
        photoImageView.isHidden = viewModel.type != .image
        subtitleTextField.isHidden = viewModel.type == .image
        
        verticalStackView.spacing = viewModel.type == .image ? 10 : verticalStackView.spacing
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        verticalStackView.axis = .vertical
        titleLabel.font = .systemFont(ofSize: 22, weight: .medium)
        subtitleTextField.font = .systemFont(ofSize: 20, weight: .medium)
        
        [verticalStackView, titleLabel, subtitleTextField].forEach{
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        toolBar.setItems([doneButton], animated: false)
        datePickerView.datePickerMode = .date
        photoImageView.backgroundColor = .gray
        photoImageView.layer.cornerRadius = 10
    }
    
    private func setupHierarchy() {
        contentView.addSubview(verticalStackView)
        verticalStackView.addArrangedSubview(titleLabel)
        verticalStackView.addArrangedSubview(subtitleTextField)
        verticalStackView.addArrangedSubview(photoImageView)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            verticalStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            verticalStackView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: padding),
            verticalStackView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -padding),
            verticalStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding)
        ])
        
        photoImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    @objc
    private func doneButtonTapped() {
        self.viewModel?.update(datePickerView.date)
    }
}
