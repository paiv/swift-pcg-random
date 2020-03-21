import UIKit


class DiceControl : UIControl {
    
    weak var label: UILabel!
    
    var value: Int = 0 {
        didSet {
            label.text = "\(value)"
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()

        layer.borderColor = UIColor.darkGray.cgColor
        layer.borderWidth = 1
        
        let label = UILabel()
        label.frame = self.bounds
        label.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        label.font = UIFont.boldSystemFont(ofSize: 100)
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        addSubview(label)
        self.label = label
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        layer.cornerRadius = bounds.width / 10
    }
}
