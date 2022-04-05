import UIKit
import SnapKit

class ViewController: UIViewController {

    // MARK: - Properties
    private let centuryService = CenturyService(
        localDataSource: CoreDataService.shared())
    
    private let yearTextField = UITextField()
    private let centuryStackView = UIStackView()
    private let centuryTitleLabel = UILabel()
    private let centuryLabel = UILabel()
    private let whatCenturyButton = UIButton()
    
    private var century: Century?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupYearTextField()
        setupCenturyStackView()
        setupCenturyTitleLabel()
        setupCenturyLabel()
        setupWhatCenturyButton()
    }
    
    // MARK: - Public methods
    func whatCentury(_ year: String) -> String {
        guard let century = getCentury(ofYear: year) else {
            return ""
        }
        
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "en_US")
        formatter.numberStyle = .ordinal
        
        guard let resultCentury = formatter.string(
            from: abs(century) as NSNumber) else {
            return ""
        }
        return century > 0 ? resultCentury : resultCentury + " BC"
    }
    
    func getCentury(ofYear year: String) -> Int? {
        guard let intYear = Int(year) else { return nil }
        guard intYear != 0 else { return nil }
        
        return intYear > 0 ?
            (intYear - 1) / 100 + 1 :
            (intYear + 1) / 100 - 1
    }
    
    // MARK: - Private setup methods
    private func setupView() {
        view.addGestureRecognizer(UITapGestureRecognizer(
            target: self,
            action: #selector(hideKeyboard)))
        view.backgroundColor = .white
        
        view.addSubview(yearTextField)
        view.addSubview(centuryStackView)
        centuryStackView.addArrangedSubview(centuryTitleLabel)
        centuryStackView.addArrangedSubview(centuryLabel)
        view.addSubview(whatCenturyButton)
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
            make.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
                .inset(16)
            make.height.equalTo(56)
        }
    }
    
    private func setupCenturyStackView() {
        centuryStackView.axis = .vertical
        centuryStackView.spacing = 16
        
        centuryStackView.snp.makeConstraints { make in
            make.centerY.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide)
                .inset(16)
        }
    }
    
    private func setupCenturyTitleLabel() {
        centuryTitleLabel.text = "Century"
        centuryTitleLabel.font = .systemFont(ofSize: 40)
        centuryTitleLabel.textAlignment = .center
    }
    
    private func setupCenturyLabel() {
        centuryLabel.font = .systemFont(ofSize: 32)
        centuryLabel.textAlignment = .center
    }
    
    private func setupWhatCenturyButton() {
        whatCenturyButton.addTarget(
            self,
            action: #selector(calculateCentury),
            for: .touchUpInside)
        whatCenturyButton.setTitle("What Century?", for: .normal)
        whatCenturyButton.backgroundColor = .systemBlue
        whatCenturyButton.titleLabel?.font = .systemFont(ofSize: 20)
        whatCenturyButton.titleLabel?.textColor = .white
        whatCenturyButton.layer.cornerRadius = 16
        whatCenturyButton.layer.masksToBounds = true
        
        whatCenturyButton.snp.makeConstraints { make in
            make.bottom.leading.trailing.equalTo(view.safeAreaLayoutGuide)
                .inset(16)
            make.height.equalTo(56)
        }
    }
    
    // MARK: - Actions
    @objc private func calculateCentury() {
        let centuryValue = whatCentury(yearTextField.text ?? "")
        guard let year = yearTextField.text,
              !centuryValue.isEmpty else { return }
        
        let century = Century(year: year, century: centuryValue)
        centuryService.addCentury(century)
        centuryLabel.text = centuryValue
        self.century = century
    }
    
    @objc private func hideKeyboard() {
        view.endEditing(true)
    }
}

