//
//  Formulaire
//  Blue
//
//  Created by Guillaume Panighetti on 04/04/2024.
//

import UIKit

import UIKit

var totalPlaces = 0

class Formulaire: UIViewController {

  var participants = [[String: Any]]()
    var nbrVehicules = 0
    var vehiculeGrand = 0

  @IBOutlet weak var tf_nom: UITextField!
  @IBOutlet weak var tf_prenom: UITextField!
  @IBOutlet weak var tf_telephone: UITextField!
  @IBOutlet weak var tf_adresse: UITextField!
  @IBOutlet weak var switch_vehicule: UISwitch!
  @IBOutlet weak var lb_participants: UILabel!
  @IBOutlet weak var bt_valider: UIButton!
  @IBOutlet weak var tf_nbrPlaces: UITextField!
  @IBOutlet weak var bt_designation: UIButton!

  func miseAJourEtatChampNbrPlaces() {
    if switch_vehicule.isOn == true {
      // Activer le champ nombre de places
      tf_nbrPlaces.isEnabled = true
      tf_nbrPlaces.backgroundColor = .white
    } else {
      // Désactiver le champ nombre de places
      tf_nbrPlaces.isEnabled = false
      tf_nbrPlaces.backgroundColor = .lightGray
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
      tf_nbrPlaces.keyboardType = .numberPad
      tf_telephone.keyboardType = .numberPad
  }

  @IBAction func switch_vehicule(_ sender: Any) {
    miseAJourEtatChampNbrPlaces()
  }

  func validationChamps() -> Bool {
    // Vérification de tous les champs sauf tf_nbrPlaces
    guard let nom = tf_nom.text, !nom.isEmpty,
          let prenom = tf_prenom.text, !prenom.isEmpty,
          let telephone = tf_telephone.text, !telephone.isEmpty,
          let adresse = tf_adresse.text, !adresse.isEmpty else {
      return false
    }
    return true
  }

  @IBAction func bt_valider(_ sender: Any) {
    if validationChamps() {
      // Sauvegarde des données et affichage des participants
      var participant = [String: Any]()
      participant["nom"] = tf_nom.text!
      participant["prenom"] = tf_prenom.text!
      participant["telephone"] = tf_telephone.text!
      participant["adresse"] = tf_adresse.text!
      participant["vehicule"] = switch_vehicule.isOn ? "Oui" : "Non"
      participants.append(participant)
      lb_participants.text = "Liste des participants :"
      for participant in participants {
        if let prenom = participant["prenom"] as? String, let nom = participant["nom"] as? String {
          let premiereLettreNom = String(nom.prefix(1))
          lb_participants.text! += " \(prenom) \(premiereLettreNom),"
        }
      }
        
        // Additionne et recupère le nombre de places pour avoir le nombre total de places
        if switch_vehicule.isOn, let nombrePlaces = Int(tf_nbrPlaces.text!) {
        
          totalPlaces += nombrePlaces
            print(nombrePlaces)
            if nombrePlaces > vehiculeGrand{
                vehiculeGrand = nombrePlaces
            }
        }
        
      tf_nom.text = ""
      tf_prenom.text = ""
      tf_telephone.text = ""
      tf_adresse.text = ""
      switch_vehicule.isOn = false
      tf_nbrPlaces.isEnabled = false
      tf_nbrPlaces.backgroundColor = .lightGray
      tf_nbrPlaces.text = ""
 

    } else {
      // Alerte si tous les champs sont pas remplis (sauf tf_NbrPlaces)
      let alerte = UIAlertController(title: "Impossible !", message: "Tous les champs doivent être remplis", preferredStyle: .alert)
      alerte.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
      present(alerte, animated: true, completion: nil)
      // Focus sur le premier champ vide
      if tf_nom.text!.isEmpty {
        tf_nom.becomeFirstResponder()
      } else if tf_prenom.text!.isEmpty {
        tf_prenom.becomeFirstResponder()
      } else if tf_telephone.text!.isEmpty {
        tf_telephone.becomeFirstResponder()
      } else if tf_adresse.text!.isEmpty {
        tf_adresse.becomeFirstResponder()
      }
    }
  }
    
    @IBAction func bt_designation(_ sender: Any) {
      // Récupération du nombre total de places
       let nbrPlacesTotal = totalPlaces
//       let vehiculeGrand = vehiculeGrand

      // Calcul du nombre de participants
      let nbrParticipants = participants.count

      // Calcul du nombre de véhicules (arrondi à l'entier supérieur)
        nbrVehicules = Int(ceil(Double(nbrParticipants) / Double(vehiculeGrand)))

      // Affichage du résultat dans la console
      print("Nombre de véhicules à prendre : \(nbrVehicules)")
        print("nb places ", nbrPlacesTotal)
        print("nb participant ", nbrParticipants)
        
    }

    
    override func prepare(for segue:UIStoryboardSegue, sender: Any?) {
        let c = segue.destination as! Designation
        c.participantsT = participants
        c.nbrVehiculesT = nbrVehicules
    }
}

