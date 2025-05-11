import UIKit


class RandogramViewController : UIViewController {

    @IBOutlet var imageView: UIImageView!

    @IBAction func handleRefresh(_ sender: Any) {
        refreshImage()
    }

    @IBAction func handleScale(_ sender: Any) {
        imageView.contentMode = imageView.contentMode == .center ?
            .scaleAspectFit : .center
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        refreshImage()
    }

    let random = Random.shared

    func refreshImage() {
        guard let image = grayscaleImage(for: random.randogram())
        else { return }
        imageView.image = image
    }

    func grayscaleImage(for data: [[Float]]) -> UIImage? {
        let w = data[0].count
        let h = data.count

        var content = Data(capacity: w * h)
        for row in data {
            for i in row {
                content.append(UInt8((1 - i) * 255))
            }
        }

        let dataProvider = CGDataProvider(data: content as CFData)!
        let grayscale = CGColorSpaceCreateDeviceGray()
        let bitmapInfo = CGBitmapInfo()

        guard let cgImage = CGImage(width: w, height: h, bitsPerComponent: 8, bitsPerPixel: 8, bytesPerRow: w, space: grayscale, bitmapInfo: bitmapInfo, provider: dataProvider, decode: nil, shouldInterpolate: false, intent: .defaultIntent)
        else { return nil }
        return UIImage(cgImage: cgImage)
    }
}
