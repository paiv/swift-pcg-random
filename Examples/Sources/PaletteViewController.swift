import UIKit


struct Palette {
    let color1: UIColor
    let color2: UIColor
    let color3: UIColor
    let color4: UIColor
}


class PaletteViewController : UICollectionViewController {
    
    @IBAction func handleAddButton(_ sender: Any) {
        let item = randomPalette()
        
        let indexPath = IndexPath(item: items.count, section: 0)
        items.append(item)
        collectionView.insertItems(at: [indexPath])
    }
    
    var items: [Palette] = []
    let random = Random.shared
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = items[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "palette", for: indexPath) as! PaletteCell
        
        cell.color1 = item.color1
        cell.color2 = item.color2
        cell.color3 = item.color3
        cell.color4 = item.color4
        return cell
    }
    
    func randomPalette() -> Palette {
        let h1 = CGFloat(random.float())
        let h3 = h1 + (h1 > 0.5 ? -0.5 : 0.5)
        let h2 = min(h1, h3) + CGFloat(random.float(in: 0.1 ... 0.25))
        let h4 = h2 + (h2 > 0.5 ? -0.5 : 0.5)
        let s = CGFloat(random.float(in: 0.5...1))
        let b = CGFloat(random.float(in: 0.5...1))
        let color1 = UIColor(hue: h1, saturation: s, brightness: b, alpha: 1)
        let color2 = UIColor(hue: h2, saturation: s, brightness: b, alpha: 1)
        let color3 = UIColor(hue: h3, saturation: s, brightness: b, alpha: 1)
        let color4 = UIColor(hue: h4, saturation: s, brightness: b, alpha: 1)
        return Palette(color1: color1, color2: color2, color3: color3, color4: color4)
    }
}


class PaletteCell : UICollectionViewCell {
    
    @IBOutlet weak var color1View: UIView!
    @IBOutlet weak var color2View: UIView!
    @IBOutlet weak var color3View: UIView!
    @IBOutlet weak var color4View: UIView!
    
    var color1: UIColor? {
        get { return color1View.backgroundColor }
        set { color1View.backgroundColor = newValue }
    }

    var color2: UIColor? {
        get { return color2View.backgroundColor }
        set { color2View.backgroundColor = newValue }
    }

    var color3: UIColor? {
        get { return color3View.backgroundColor }
        set { color3View.backgroundColor = newValue }
    }

    var color4: UIColor? {
        get { return color4View.backgroundColor }
        set { color4View.backgroundColor = newValue }
    }
}
