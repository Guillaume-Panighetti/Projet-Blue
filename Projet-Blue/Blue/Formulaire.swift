//
//  Formulaire
//  Blue
//
//  Created by Guillaume Panighetti on 04/04/2024.
//

import UIKit

class Formulaire: UIViewController {

    var participants = [[String: Any]]()

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
    }

    @IBAction func switch_vehicule(_ sender: Any) {
        miseAJourEtatChampNbrPlaces()
    }
    
    @IBAction func bt_valider(_ sender: Any) {
        // Création d'un dictionnaire pour stocker les données du participant actuel
        var participant = [String: Any]()
        
        // Récupération des données des champs de texte et du commutateur
        if let nom = tf_nom.text, let prenom = tf_prenom.text, let telephone = tf_telephone.text, let adresse = tf_adresse.text {
            participant["nom"] = nom
            participant["prenom"] = prenom
            participant["telephone"] = telephone
            participant["adresse"] = adresse
            participant["vehicule"] = switch_vehicule.isOn ? "Oui" : "Non"
            
            // Ajout du participant au tableau
            participants.append(participant)
            
            // Affichage du nombre de participants dans le label
            lb_participants.text = "Liste des participants :"
            for participant in participants {
                if let prenom = participant["prenom"] as? String, let nom = participant["nom"] as? String {
                    let premiereLettreNom = String(nom.prefix(1))
                    lb_participants.text! += " \(prenom) \(premiereLettreNom),"
                }
            }

            // Réinitialisation des champs de texte
            tf_nom.text = ""
            tf_prenom.text = ""
            tf_telephone.text = ""
            tf_adresse.text = ""
            switch_vehicule.isOn = false
            tf_nbrPlaces.isEnabled = false
            tf_nbrPlaces.backgroundColor = .lightGray
            tf_nbrPlaces.text = ""
        }
    }
    
    @IBAction func bt_designation(_ sender: Any) {
        let nbrPlaces = 1
        let nbrParticipants = participants.count
        let nbrVehicule = nbrParticipants / nbrPlaces
        printContent("Nombre de véhicule à prendre : \(nbrVehicule)")
    }
    
    override func prepare(for segue:UIStoryboardSegue, sender: Any?) {
        let c = segue.destination as! Designation
        c.participantsT = participants
    }
}

