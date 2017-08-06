//  Copyright © 2017 cutting.io. All rights reserved.

import UIKit

protocol PickNumberViewControllerDelegate: class {
    func didPick(number: Int)
}

class PickNumberViewController: UIViewController {

    weak var delegate: PickNumberViewControllerDelegate?

    @IBOutlet weak var numberTextField: UITextField!
    
    @IBAction func didTapGo(_ sender: Any) {
        guard
            let text = numberTextField.text,
            let number = Int(text)
        else { return }

        delegate?.didPick(number: number)
    }
}
