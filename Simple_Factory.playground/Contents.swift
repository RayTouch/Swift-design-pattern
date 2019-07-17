import UIKit

class MyLabel {
    static func redWord(show text: String) -> UILabel {
        let label = UILabel(frame: .zero)
        label.text = text
        label.textColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.sizeToFit()
        return label
    }
    
    static func yellowWord(show text: String) -> UILabel {
        let label = UILabel(frame: .zero)
        label.text = text
        label.textColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 15)
        label.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        label.sizeToFit()
        return label
    }
    
    enum TextColorType {
        case red
        case yellow
    }
    
    static func set(wordColor: TextColorType, show text: String) -> UILabel {
        let label = UILabel(frame: .zero)
        label.text = text
        switch wordColor {
        case .red:
            label.textColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
            label.font = UIFont.boldSystemFont(ofSize: 17)
            label.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        case .yellow:
            label.textColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
            label.font = UIFont.systemFont(ofSize: 15)
            label.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        }
        label.sizeToFit()
        return label
    }
}

MyLabel.redWord(show: "高雄")
MyLabel.yellowWord(show: "發大財")
MyLabel.set(wordColor: .yellow, show: "結論")
