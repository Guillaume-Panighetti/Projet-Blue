import UIKit
import MapKit

class MapViewController: UIViewController {

  @IBOutlet weak var mapView: MKMapView!

  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Set initial location for Université Lumière Lyon 2 Porte des Alpes
    let initialLocation = CLLocationCoordinate2D(latitude: 45.777778, longitude: 4.879444)
    mapView.setCenter(initialLocation, animated: true)
    
    // Optionally, add a marker at the initial location
    let annotation = MKPointAnnotation()
    annotation.coordinate = initialLocation
    annotation.title = "Université Lumière Lyon 2 Porte des Alpes"
    mapView.addAnnotation(annotation)
  }
}
