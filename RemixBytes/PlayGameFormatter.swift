//  Copyright © 2017 cutting.io. All rights reserved.

import Foundation

class PlayGameFormatter {
    
    func prepare(result: GameResult) -> PlayGameViewData {
        let outputText: String
        switch result {
        case .none:
            outputText = ""
        case let .spelledOut(number):
            outputText = spelledOutText(number: number)
        case let .prime(number, isPrime):
            outputText = primeText(number: number, isPrime: isPrime)
        }
        return PlayGameViewData(outputText: outputText)
    }

    private func spelledOutText(number: Int) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .spellOut
        return numberFormatter.string(for: number) ?? ""
    }

    private func primeText(number: Int, isPrime: Bool) -> String {
        return isPrime ? "\(number) is prime\n🤓" : "\(number) is not prime\n😔"
    }
}
