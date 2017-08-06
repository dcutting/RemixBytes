//  Copyright © 2017 cutting.io. All rights reserved.

import UIKit

class PickGameViewController: UIViewController {

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        guard
            let destination = segue.destination as? PickNumberViewController,
            let identifier = segue.identifier
        else { return }

        if identifier == "Spelled Out" {
            destination.game = .spelledOut
        } else if identifier == "Prime" {
            destination.game = .prime
        }
    }
}
