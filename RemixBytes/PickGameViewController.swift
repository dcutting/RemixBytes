//  Copyright © 2017 cutting.io. All rights reserved.

import UIKit

enum Game {
    case spelledOut
    case prime
}

class PickGameViewController: UIViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        guard
            let destination = segue.destination as? PickNumberViewController,
            let identifier = segue.identifier
        else { return }

        switch identifier {
        case "Spelled Out":
            destination.game = .spelledOut
        case "Prime":
            destination.game = .prime
        default:
            return
        }
    }
}
