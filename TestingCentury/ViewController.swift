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
        guard let century = getCentury(ofYear: year) else {
            return ""
        }
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .ordinal
        
        guard let resultCentury = formatter.string(from: abs(century) as NSNumber) else {
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
}

