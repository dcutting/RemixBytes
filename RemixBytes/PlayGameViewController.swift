//  Copyright © 2017 cutting.io. All rights reserved.

import UIKit

class PlayGameViewController: UIViewController {

    @IBOutlet weak var outputLabel: UILabel!
    
    var game = Game.none
    var number = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        switch game {
        case .none:
            outputLabel.text = ""
        case .spelledOut:
            outputLabel.text = spelledOutText()
        case .prime:
            outputLabel.text = primeText()
        }
    }

    private func spelledOutText() -> String {

        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .spellOut
        return numberFormatter.string(for: number) ?? ""
    }

    private func primeText() -> String {

        let n = Int(number)
        let result = isPrime(n: n)
        return result ? "\(n) is prime\n🤓" : "\(n) is not prime\n😔"
    }

    private func isPrime(n: Int) -> Bool {
        guard n > 1 else { return false }
        guard n > 3 else { return true }
        guard n % 2 != 0, n % 3 != 0 else { return false }
        var i = 5
        while i * i <= n {
            guard n % i != 0, n % (i + 2) != 0 else { return false }
            i += 6
        }
        return true
    }
}
