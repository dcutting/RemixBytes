//  Copyright © 2017 cutting.io. All rights reserved.

import UIKit

class PickGameViewControllerFactory: PickGameViewFactory {
    func make() -> PickGameView {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: "PickGameViewController") as! PickGameViewController
    }
}

class PickGameViewController: UIViewController, PickGameView {

    weak var delegate: PickGameViewDelegate?

    @IBAction func didTapSpelledOut(_ sender: Any) {
        delegate?.didPickSpelledOut()
    }

    @IBAction func didTapPrime(_ sender: Any) {
        delegate?.didPickPrime()
    }
}
