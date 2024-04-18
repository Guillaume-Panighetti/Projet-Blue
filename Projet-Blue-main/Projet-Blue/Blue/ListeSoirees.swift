//
//  ListeSoirees.swift
//  Blue
//
//  Created by Guillaume Panighetti on 08/04/2024.
//

import UIKit

class ListeSoirees: UIViewController {

    @IBOutlet weak var view_listeSoiree: UIStackView!
    
    var ListeSoiree: [Designation.Soiree] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Remplir le Stack View avec les données de ListeSoiree
        print(ListeSoiree)
        remplirStackView()
    }
    
    // Fonction pour remplir le Stack View avec les données de ListeSoiree
    func remplirStackView() {
        for soiree in ListeSoiree {
            // Créer une étiquette pour afficher les détails de la soirée
            let label = UILabel()
            label.text = "Nom: \(soiree.nom), Adresse: \(soiree.adresse), sam: \(soiree.sam)"
            
            // Ajouter l'étiquette au Stack View
            view_listeSoiree.addArrangedSubview(label)
        }
    }
    override func prepare(for segue:UIStoryboardSegue, sender: Any?) {
        let c = segue.destination as! Formulaire
        c.ListeSoiree = ListeSoiree
    }
}



/* à faire :
 
 retirer l'élément de la liste "personnesAvecVéhicules" dès qu'il a été designé (pour l'instant il se retire du tableau mais dès qu'on reclique sur bt_lancerRoue le tableau se remet au point de départ)
 
 afficher des nouveaux boutons dans la liste quand on clique sur "commencer" dans la vue "adresse soirées" (à faire)


 
 voir si on peut conserver les données quand on ferme l'appli (optionnel) (en vrai pas grave si ça y est pas)
 */
