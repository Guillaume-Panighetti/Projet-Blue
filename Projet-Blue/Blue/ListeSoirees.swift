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
 
 afficher le nombre de SAM sur la vue designation + faire en sorte de pouvoir lancer juste le nombre de fois qu'il faut la roue (a faire absolument)
 
demander comment afficher des nouveaux boutons dans la liste quand on clique sur "commencer" dans la vue "adresse soirées" (à faire)
 
 ajouter bouton sur toutes les pages qui revient à la vue "ListeSoirees" (à faire)

soit mettre une map avec un point précis en fonction de l'adresse soit ouvrir directement l'app Plans et mettre l'itinéraire (si on arrive pas, pas grave)
 
 voir si on peut conserver les données quand on ferme l'appli (optionnel)
 */
