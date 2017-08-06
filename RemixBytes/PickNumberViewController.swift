//  Copyright © 2017 cutting.io. All rights reserved.

import UIKit

protocol PickNumberViewDelegate: class {
    func didPick(number: Int)
}

class PickNumberViewController: UIViewController {

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
