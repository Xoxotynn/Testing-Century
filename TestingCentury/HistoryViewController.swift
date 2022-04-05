import UIKit
import SnapKit

class HistoryViewController: UIViewController {

    private let centuryService = CenturyService(
        localDataSource: CoreDataService.shared())
    private var centuries: [Century] = []
    
    private let yearTextField = UITextField()
    private let searchButton = UIButton()
    private let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(yearTextField)
        view.addSubview(searchButton)
        view.addSubview(tableView)
        
        setupYearTextField()
        setupSearchButton()
        setupTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        centuries = centuryService.getAllCenturies().reversed()
        tableView.reloadData()
    }
    
    private func setupYearTextField() {
        yearTextField.placeholder = "Year"
        
        yearTextField.leftView = UIView(
            frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        yearTextField.rightView = UIView(
            frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        yearTextField.leftViewMode = .always
        yearTextField.rightViewMode = .always
        
        yearTextField.keyboardType = .numberPad
        yearTextField.returnKeyType = .done
        yearTextField.layer.cornerRadius = 12
        yearTextField.layer.borderColor = UIColor.darkGray.cgColor
        yearTextField.layer.borderWidth = 1
        yearTextField.layer.masksToBounds = true
        
        yearTextField.snp.makeConstraints { make in
            make.top.leading.equalTo(view.safeAreaLayoutGuide)
                .inset(16)
            make.height.equalTo(56)
        }
    }
    
    private func setupSearchButton() {
        searchButton.addTarget(
            self,
            action: #selector(findCentury),
            for: .touchUpInside)
        searchButton.setImage(UIImage(systemName: "magnifyingglass"),
                              for: .normal)
        searchButton.backgroundColor = .systemBlue
        searchButton.tintColor = .white
        searchButton.layer.cornerRadius = 16
        searchButton.layer.masksToBounds = true
        
        searchButton.snp.makeConstraints { make in
            make.centerY.equalTo(yearTextField)
            make.leading.equalTo(yearTextField.snp.trailing)
                .offset(16)
            make.trailing.equalTo(view.safeAreaLayoutGuide)
                .inset(16)
            make.height.equalTo(yearTextField)
            make.width.equalTo(searchButton.snp.height)
        }
    }
    
    private func setupTableView() {
        tableView.accessibilityIdentifier = "HistoryTableView"
        
        tableView.backgroundColor = .clear
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self,
                           forCellReuseIdentifier: "CenturyCell")
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(yearTextField.snp.bottom)
                .offset(16)
            make.bottom.leading.trailing.equalTo(view.safeAreaLayoutGuide)
                .inset(16)
        }
    }
    
    @objc private func findCentury() {
        guard let year = yearTextField.text,
              !year
            .trimmingCharacters(in: .whitespacesAndNewlines)
            .isEmpty else {
            centuries = centuryService.getAllCenturies()
            tableView.reloadData()
            return
        }
        
        let century = centuryService.getCentury(withYear: year)
        guard let century = century else {
            centuries = []
            tableView.reloadData()
            return
        }

        centuries = [century]
        tableView.reloadData()
    }
}

extension HistoryViewController: UITableViewDelegate & UITableViewDataSource {
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        centuries.count
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "CenturyCell",
            for: indexPath)
        
        let century = centuries[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = "\(century.century) Century"
        content.secondaryText = "Year \(century.year)"
        
        cell.accessibilityIdentifier = "CellYear\(century.year)"
        cell.tintColor = .darkText
        cell.backgroundColor = .clear
        cell.contentConfiguration = content
        
        return cell
    }
}
