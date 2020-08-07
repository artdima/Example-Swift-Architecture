//
//  AddEventViewController.swift
//  MVVMTemplate
//
//  Created by Medyannik Dima on 29.07.2020.
//  Copyright © 2020 Medyannik Dmitri. All rights reserved.
//

import UIKit

class AddEventViewController: UIViewController, Storyboard {
    
    @IBOutlet weak var tableView: UITableView!

    var viewModel: AddEventViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        viewModel.onUpdate = { [weak self] in
            self?.tableView.reloadData()
        }
        viewModel.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        tableView.register(TitleSubtitleCell.self, forCellReuseIdentifier: "TitleSubtitleCell")
        tableView.tableFooterView = UIView()
        
        let rightBarButtom = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneTapped))
        navigationItem.rightBarButtonItem = rightBarButtom
        
        //Set Navigation Bar large titles
        navigationItem.title = viewModel.title
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.setContentOffset(.init(x: 0, y: -2), animated: false)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        viewModel.viewDidDisappear()
    }
    
    @objc private func doneTapped() {
        viewModel.tappedDone()
    }
}

//MARK: - UITextFieldDelegate
extension AddEventViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let currentText = textField.text else { return false}
        let text = currentText + string
        
        let point = textField.convert(textField.bounds.origin, to: tableView)
        if let indexPath = tableView.indexPathForRow(at: point) {
            viewModel.updateCell(for: indexPath, subtitle: text)
        }
        return true
    }
}

//MARK: - UITableViewDataSource
extension AddEventViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellViewModel = viewModel.cell(for: indexPath)
        switch cellViewModel {
        case .titleSubtitle(let titleSubtitleCellViewModel):
            let cell = tableView.dequeueReusableCell(withIdentifier: "TitleSubtitleCell", for: indexPath) as! TitleSubtitleCell
            cell.update(with: titleSubtitleCellViewModel)
            cell.subtitleTextField.delegate = self
            return cell
        }
    }
}

//MARK: - UITableViewDelegate
extension AddEventViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectRow(at: indexPath)
        tableView.deselectRow(at: indexPath, animated: false)
    }
}
