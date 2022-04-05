import UIKit

class HistoryViewController: UIViewController {

    private let centuryService = CenturyService(
        localDataSource: CoreDataService.shared())
    private var centuries: [Century] = []
    
    private let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(tableView)
        
        setupTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        centuries = centuryService.getAllCenturies().reversed()
        tableView.reloadData()
    }
    
    private func setupTableView() {
        tableView.accessibilityIdentifier = "HistoryTableView"
        
        tableView.backgroundColor = .clear
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self,
                           forCellReuseIdentifier: "CenturyCell")
        
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
                .inset(16)
        }
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
