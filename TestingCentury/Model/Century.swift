import Foundation

struct Century {
    let year: String
    let century: String
}

extension Century: Equatable {
    static func == (lhs: Century, rhs: Century) -> Bool {
        lhs.year == rhs.year &&
        lhs.century == rhs.century
    }
}
