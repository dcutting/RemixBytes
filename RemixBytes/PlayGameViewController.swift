//  Copyright © 2017 cutting.io. All rights reserved.

import UIKit

class PlayGameViewController: UIViewController {

    @IBOutlet weak var outputLabel: UILabel!
    
    var game: Game?
    var number: Int?

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let game = game else { return }

        switch game {
        case .spelledOut:
            outputLabel.text = spelledOutText()
        case .prime:
            outputLabel.text = primeText()
        }
    }

    private func spelledOutText() -> String {
        return "spelled out \(number)"
    }

    private func primeText() -> String {
        return "\(number) is not prime"
    }
}
