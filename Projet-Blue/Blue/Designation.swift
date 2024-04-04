//
//  Designation.swift
//  Blue
//
//  Created by Thimea Holleville on 04/04/2024.
//

import UIKit
class Designation: UIViewController {
    
    @IBOutlet weak var lb_affichageNom: UILabel!
    @IBOutlet weak var chargement: UIActivityIndicatorView!
    @IBOutlet weak var lb_resultat: UILabel!
    
    // Fausse liste pour test
    var prenoms = ["Alice", "Bob", "Charlie", "David", "Emma"]
    
    // Index pour suivre la position dans le tableau de noms
    var currentIndex = 0
    
    func afficherNomSuivant() {
        // Vérifier si l'index est valide
        guard currentIndex < prenoms.count else {
            // verif si last prenom
            
            chargement.isHidden = true
            lb_affichageNom.isHidden = true
            lb_resultat.isHidden = false
            
            //designation aleatoire du SAM
            let randomIndex = Int.random(in: 0..<prenoms.count)
            let prenomAleatoire = prenoms[randomIndex]
            lb_resultat.text = "Bravo, \(prenomAleatoire) est le SAM de la soirée !"
            
            return // on sort si tous les presnoms ont été affiché
        }
        
        lb_affichageNom.text = prenoms[currentIndex]
        
        currentIndex += 1
        
        // timer
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            self.afficherNomSuivant()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        afficherNomSuivant()
    }
}

