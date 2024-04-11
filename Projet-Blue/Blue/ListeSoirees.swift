//
//  ListeSoirees.swift
//  Blue
//
//  Created by Guillaume Panighetti on 08/04/2024.
//

import UIKit

class ListeSoirees: UIViewController {

    @IBOutlet weak var view_listeSoiree: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    

}


/* à faire :
 
 retirer l'élément de la liste "personnesAvecVéhicules" dès qu'il a été designé (pour l'instant il se retire du tableau mais dès qu'on reclique sur bt_lancerRoue le tableau se remet au point de départ)
 
 afficher des nouveaux boutons dans la liste quand on clique sur "commencer" dans la vue "adresse soirées" (à faire)

ouvrir l'app plans avec l'itinéraire quand on clique sur une soirée dans la liste (chiant à faire, au pire demande au prof mais si on le met pas c'est pas grave)
 
 
 voir si on peut conserver les données quand on ferme l'appli (optionnel) (en vrai pas grave si ça y est pas)
 */
