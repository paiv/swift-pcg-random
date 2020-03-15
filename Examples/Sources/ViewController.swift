import PcgRandom
import UIKit


class ViewController: UIViewController {
    @IBOutlet weak var dice1: Dice!
    @IBOutlet weak var dice2: Dice!

    @IBAction func handleTap(_ sender: Any) {
        rollDice()
    }

    func rollDice() {
        var pcg = Pcg64Random(seed: .random(in: .min ... .max))
        let roll = { (sides:Int) in Int.random(in: 1...sides, using: &pcg) }

        dice1.value = roll(6)
        dice2.value = roll(6)
    }
}
