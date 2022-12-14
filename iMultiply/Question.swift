import Foundation

struct Question {
    var left: Int
    var right: Int
    var operation: QuestionType
    
    var string: String {
        switch operation {
        case .add:
            return "What is \(left) plus \(right)?"
        case .subtract:
            return "What is \(left) minus \(right)?"
        case .multiply:
            return "What is \(left) multiplied by \(right)?"
        }
    }
    
    var answer: Int {
        switch operation {
            case .add:
                return left + right
            case .subtract:
                return left - right
            case .multiply:
                return left * right
        }
    }
    
}

extension Question {
    init() {
        right = Int.random(in: 1...12)
        left = Int.random(in: 1...12)
        operation = QuestionType.allCases.randomElement()!
    }
}
