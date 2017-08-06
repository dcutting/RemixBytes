//  Copyright © 2017 cutting.io. All rights reserved.

import UIKit

protocol PickGameViewDelegate: class {
    func didPickSpelledOut()
    func didPickPrime()
}

class PickGameViewController: UIViewController {

    weak var delegate: PickGameViewDelegate?

    @IBAction func didTapSpelledOut(_ sender: Any) {
        delegate?.didPickSpelledOut()
    }

    @IBAction func didTapPrime(_ sender: Any) {
        delegate?.didPickPrime()
    }
}
