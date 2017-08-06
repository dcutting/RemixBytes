//  Copyright © 2017 cutting.io. All rights reserved.

import UIKit

class PickNumberViewControllerFactory: PickNumberViewFactory {
    func make() -> PickNumberView {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "PickNumberViewController") as! PickNumberViewController
    }
}

class PickNumberViewController: UIViewController, PickNumberView {

    weak var delegate: PickNumberViewDelegate?

    @IBOutlet weak var numberTextField: UITextField!
    
    @IBAction func didTapGo(_ sender: Any) {

        guard
            let text = numberTextField.text,
            let number = Int(text)
        else { return }

        delegate?.didPick(number: number)
    }
}
