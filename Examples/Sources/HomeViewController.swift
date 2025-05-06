import UIKit


class HomeViewController : UIViewController {
    
    @IBOutlet weak var seedTextField: UITextField!
    @IBOutlet weak var tickerLabel: UILabel!
    
    @IBAction func handleSetSeedButton(_ sender: Any) {
        reseed(seed)
    }
    
    @IBAction func handleRandomSeedButton(_ sender: Any) {
        reseed(.random(in: .min ... .max))
    }
    
    @IBAction func handleSeedTextField(_ sender: Any) {
        reseed(seed)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reseed(seed)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        view.endEditing(false)
    }

    let random = Random.shared
    
    func reseed(_ seed: Int) {
        random.reset(seed: seed)
        ticker = handleTicker()
    }

    func reseed(_ seed: String) {
        random.reset(seed: seed)
        ticker = handleTicker()
    }

    var seed: String {
        return seedTextField.text ?? ""
    }
    
    var ticker: String {
        get { return tickerLabel.text ?? "" }
        set { tickerLabel.text = newValue }
    }
    
    private func handleTicker() -> String {
        return (0..<40).map { _ in
            random.integer(in: 0..<3) == 0 ? "-" : random.string(charCount: 1)
        }
        .reduce(into: "") { (acc, s) in acc += s }
    }
}


extension HomeViewController : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        defer { textField.resignFirstResponder() }
        return true
    }
}
