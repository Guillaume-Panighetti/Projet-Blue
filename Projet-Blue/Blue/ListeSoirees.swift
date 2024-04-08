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
 
 calculer le nombre de véhicule à prendre et donc le nombre de sam en fonction du nombre de place et du nombre de véhicule (participant / places puis arrondire à l'entier superieur)
 
demander comment afficher des nouveaux boutons dans la liste
quand on clique sur "commencer" dans la vue "adresse soirées"

soit mettre une map avec un point précis en fonction de l'adresse soit ouvrir directement map et mettre l'itinéraire
 
 voir si on peut conserver les données quand on ferme l'appli
 */
