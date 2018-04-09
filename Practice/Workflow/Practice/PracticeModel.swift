import Foundation

protocol PracticeModelDelegate: class {
    func displayError()
    func display(_: String)
}

class PracticeModel  {
    
    weak var delegate: PracticeModelDelegate?
    
    private let calculator = Calculator()

    func new(text: String?) {
        guard let text = text, let count = Int(text) else {
            delegate?.displayError()
            return
        }
        let numbers = calculator.numbersThatContain2(for: count)
        let displayText = numbers.reduce("") { return $0 + "\($1) \n" }
        delegate?.display(displayText)
    }

}
