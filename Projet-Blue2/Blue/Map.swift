import UIKit
import MapKit

class Map: UIViewController {

    @IBOutlet weak var mapButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Définir l'action du bouton mapButton
        mapButton.addTarget(self, action: #selector(openMaps), for: .touchUpInside)
    }

    @objc func openMaps() {

        // Ouvrir l'application Plans
        let url = URL(string: "maps://")!
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}
