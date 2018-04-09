import UIKit

extension UIView {
    func drawBorder(with color: UIColor) {
        layer.borderColor = color.cgColor
        layer.borderWidth = 2.0
        layer.cornerRadius = 10.0
    }
}

class BorderedTextView: UITextView {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        drawBorder(with: UIColor.black)
    }
}

class BorderedTextField: UITextField {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        drawBorder(with: UIColor.lightGray)
    }
}
