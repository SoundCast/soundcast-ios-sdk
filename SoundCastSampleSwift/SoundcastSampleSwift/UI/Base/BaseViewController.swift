
import UIKit
class BaseViewController : UIViewController {

    func rootView() -> UIView {
        preconditionFailure("This method must be overridden")
    }

    func showDialog(_ title: String,_ message: String) {
        let attributedTitle = NSAttributedString(string: title, attributes: [
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 20),
            NSAttributedString.Key.foregroundColor : UIColor.black
            ])
        let attributedMessage = NSAttributedString(string: message, attributes: [
            NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15),
            NSAttributedString.Key.foregroundColor : UIColor.black
            ])

        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let backView = alert.view.subviews.last?.subviews.last
        backView?.layer.cornerRadius = 10.0
        backView?.backgroundColor = UIColor.white
        alert.setValue(attributedTitle, forKey: "attributedTitle") //Title
        alert.setValue(attributedMessage, forKey: "attributedMessage") //Message
        alert.view.tintColor = UIColor.black // Button

        let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
            alert.dismiss(animated: true, completion: nil)
        }
        alert.addAction(OKAction)
        self.present(alert, animated: true, completion: nil)
    }
}
