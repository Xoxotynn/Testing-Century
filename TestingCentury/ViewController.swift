import UIKit
import SnapKit

class ViewController: UIViewController {

    private let centuryLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(centuryLabel)
        
        centuryLabel.text = whatCentury("2000")
        centuryLabel.font = .systemFont(ofSize: 32)
        centuryLabel.textAlignment = .center
        centuryLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func whatCentury(_ year: String) -> String {
        guard let intYear = Int(year) else { return "" }
        
        let century = (intYear - 1) / 100 + 1
        let formatter = NumberFormatter()
        formatter.numberStyle = .ordinal
        
        return formatter.string(from: century as NSNumber) ?? ""
    }
}

