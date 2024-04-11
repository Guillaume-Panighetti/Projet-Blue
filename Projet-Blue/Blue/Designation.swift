//
//  ListeSoirees.swift
//  Blue
//
//  Created by Thiméa Holleville on 04/04/2024.
//

import UIKit

class Designation: UIViewController {
    
    var participantsT = [[String: Any]]()
    var personnesAvecVehicule = [[String: Any]]() // Liste des personnes avec véhicule
    var nbrVehiculesT = 0
    var nbrLancer = 0
    
    @IBOutlet weak var lb_affichageNom: UILabel!
    @IBOutlet weak var chargement: UIActivityIndicatorView!
    @IBOutlet weak var lb_resultat: UILabel!
    @IBOutlet weak var bt_lancerRoue: UIButton!
    @IBOutlet weak var lb_SAM: UILabel!
    @IBOutlet weak var lb_nbrSam: UILabel!
    
    // Index pour suivre la position dans le tableau de participants
    var currentIndex = 0
    
    // Liste des prénoms désignés SAM
    var samDesignes = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Récupérer la liste des personnes avec véhicule
        lb_nbrSam.text = "Nombre de SAM : \(nbrVehiculesT)"
    }
    
    @IBAction func bt_lancerRoue(_ sender: Any) {
        if nbrVehiculesT > nbrLancer {
            personnesAvecVehicule = listePersonnesAvecVehicule()
            afficherNomSuivant()
            //empeche de lancer la roue plus de fois qu'il n'y a de SAM
            nbrLancer += 1
            
        }else{
            bt_lancerRoue.isHidden = true
        }
    }
    
    // Fonction pour récupérer les personnes avec véhicule
    func listePersonnesAvecVehicule() -> [[String: Any]] {
        var personnesAvecVehicule = [[String: Any]]()

        for participant in participantsT {
            if let vehicule = participant["vehicule"] as? String, vehicule.lowercased() == "oui" {
                personnesAvecVehicule.append(participant)
            }
        }

        return personnesAvecVehicule
    }
    
    // Fonction pour désigner le prochain SAM et mettre à jour le label lb_SAM
    func afficherNomSuivant() {
        // Vérifier si l'index est valide
        guard currentIndex < personnesAvecVehicule.count else {
            chargement.isHidden = true
            lb_affichageNom.isHidden = true
            lb_resultat.isHidden = false
            lb_SAM.isHidden = false
            
            // Désignation aléatoire du SAM parmi les personnes avec véhicule
            let randomIndex = Int.random(in: 0..<personnesAvecVehicule.count)
            if let prenomAleatoire = personnesAvecVehicule[randomIndex]["prenom"] as? String {
                // Ajoute les SAM Choisis
                samDesignes.append(prenomAleatoire)
                lb_resultat.text = "Bravo, \(prenomAleatoire) est le SAM de la soirée !"
                lb_SAM.text = samDesignes.joined(separator: ", ")
                personnesAvecVehicule.remove(at: randomIndex)
            }
            
            return // Sortir si tous les prénoms ont été affichés
        }
        
        // Affichage du prénom du participant actuel
        if let prenom = personnesAvecVehicule[currentIndex]["prenom"] as? String {
            lb_affichageNom.text = prenom
        }
        
        currentIndex += 1
        
        // Timer pour afficher le prochain prénom
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            self.afficherNomSuivant()
        }
    }
}
