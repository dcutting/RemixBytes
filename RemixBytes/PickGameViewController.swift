//  Copyright © 2017 cutting.io. All rights reserved.

import UIKit

class PickGameViewFactory {
    func make() -> PickGameViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "PickGameViewController") as! PickGameViewController
    }
}

protocol PickGameViewControllerDelegate: class {
    func didPickSpelledOut()
    func didPickPrime()
}

class PickGameViewController: UIViewController {

    weak var delegate: PickGameViewControllerDelegate?

    @IBAction func didTapSpelledOut(_ sender: Any) {
        delegate?.didPickSpelledOut()
    }

    @IBAction func didTapPrime(_ sender: Any) {
        delegate?.didPickPrime()
    }
}
