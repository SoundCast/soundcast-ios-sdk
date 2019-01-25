
import UIKit

class ViewController: BaseViewController {

    @IBOutlet weak var _view: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let viewMain = ViewMain.init(frame: UIScreen.main.bounds)
        viewMain.rootVC = self
        _view.addSubview(viewMain)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }

    override func rootView() -> UIView {
        return _view
    }
}
