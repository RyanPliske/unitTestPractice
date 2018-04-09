import UIKit

class PracticeViewController: UIViewController {
    
    @IBOutlet fileprivate weak var textField: BorderedTextField!
    @IBOutlet fileprivate weak var textView: BorderedTextView!
    
    var model: PracticeModel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        model = PracticeModel()
        model.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        
        let toolBar = UIToolbar()
        toolBar.barStyle = .blackTranslucent
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneClicked))
        toolBar.items = [doneButton]
        toolBar.sizeToFit()
        textField.inputAccessoryView = toolBar
    }
    
    @objc func doneClicked(sender: AnyObject) {
        self.view.endEditing(true)
    }
}

extension PracticeViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        model.new(text: textField.text)
    }
    
}

extension PracticeViewController: PracticeModelDelegate {
    
    func display(_ text: String) {
        textView.text = text
    }
    
    func displayError() {
        textView.text = "Please put in a proper number."
    }
    
}
