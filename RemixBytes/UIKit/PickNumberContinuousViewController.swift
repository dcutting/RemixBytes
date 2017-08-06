//  Copyright © 2017 cutting.io. All rights reserved.

import UIKit

class PickNumberContinuousViewControllerFactory: PickNumberViewFactory {
    func make() -> PickNumberView {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "PickNumberContinuousViewController") as! PickNumberContinuousViewController
    }
}

class PickNumberContinuousViewController: UIViewController, PickNumberView {

    @IBOutlet weak var numberTextField: UITextField!

    weak var delegate: PickNumberViewDelegate?

    @IBAction func numberDidChange(_ sender: Any) {

        guard
            let text = numberTextField.text,
            let number = Int(text)
        else { return }

        delegate?.didPick(number: number)
    }
}
