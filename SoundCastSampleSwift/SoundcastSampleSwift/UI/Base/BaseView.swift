
import UIKit
class BaseView : UIView {
    var rootVC : BaseViewController?
    override init(frame: CGRect) {
        super.init(frame: frame)
        let view = UINib(nibName: String(describing: type(of: self)), bundle: nil).instantiate(withOwner: self, options: nil)[0] as! UIView
        view.frame = frame
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)

        Init()
        setupView()
        setEvents()
    }

    required init?(coder aDecoder: NSCoder) {
         super.init(coder: aDecoder)
    }

    func navigationController() -> UINavigationController {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate._rootNavigationController!
    }

    //Called when the user click on the view (outside the UITextField).
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.endEditing(true)
    }

    func Init() {}
    func setupView() {}
    func setEvents() {}
}
