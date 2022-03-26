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
    
    func whatCentury(_ year: String) -> String? {
        guard let intYear = Int(year) else { return nil }
        
        let century = (intYear - 1) / 100 + 1
        let endings = [
            1: "st",
            2: "nd",
            3: "rd"
        ]
        
        if ((century / 10) % 10 == 1 || (century >= 10 && century <= 20)) {
            return "\(century)th"
        }
        
        if let result = endings[century % 10] {
            return "\(century)\(result)"
        }
        
        return "\(century)th"
    }
}

