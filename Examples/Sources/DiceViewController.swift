import PcgRandom
import UIKit


class DiceViewController: UIViewController {
    @IBOutlet weak var dice1Control: DiceControl!
    @IBOutlet weak var dice2Control: DiceControl!

    @IBAction func handleTap(_ sender: Any) {
        rollDice()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        rng1 = Pcg64Random(seed: random.integer(), stream: random.integer())
        rng2 = Pcg64Random(seed: random.integer(), stream: random.integer())
    }
    
    let random = Random.shared
    var rng1: Pcg64Random!
    var rng2: Pcg64Random!

    func roll(using rng: inout Pcg64Random) -> Int {
        return Int.random(in: 1...6, using: &rng)
    }

    func rollDice() {
        dice1Control.value = roll(using: &rng1)
        dice2Control.value = roll(using: &rng2)
    }
}
