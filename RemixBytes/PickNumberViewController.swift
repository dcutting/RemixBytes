//  Copyright © 2017 cutting.io. All rights reserved.

import UIKit

class PickNumberViewController: UIViewController {

    @IBOutlet weak var numberTextField: UITextField!
    
    var game: Game?

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        guard let destination = segue.destination as? PlayGameViewController else {
            return
        }

        guard let text = numberTextField.text else { return }

        let number = Int(text)
        destination.number = number
        destination.game = game
    }
}
