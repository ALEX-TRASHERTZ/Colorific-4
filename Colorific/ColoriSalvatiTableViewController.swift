//
//  ColoriSalvatiTableViewController.swift
//  Colorific
//
//  Created by alex on 19/11/17.
//  Copyright © 2017 Alex. All rights reserved.
//

import UIKit

class ColoriSalvatiTableViewController: UITableViewController {

    //--------------------------------------------------------------------------
    private var indice = 1
    
    
    //--------------------------------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        
    }

    
    //--------------------------------------------------------------------------
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }

    
    //--------------------------------------------------------------------------
    //questo metodo dice alla tableView quante sezioni deve avere
    override func numberOfSections(in tableView: UITableView) -> Int {
        // in questo caso ci serve solo una sezione e quindi restituiamo 1
        return 1
    }
    
    
    //--------------------------------------------------------------------------
    //questo metodo dice alla tableView quante celle vano fatte per ogni sezione
    //avendo una sola sezione possiamo direttamente restituire un numero, senza dover controllare di che sezione di tratta
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // qui 'sposiamo' l'array con la table, ovvero per dire alla table quante celle fare contiamo le variabili contenute nell'array
        return DataManager.shared.contenitoreDiColor.count
    }

    
    //--------------------------------------------------------------------------
    //questo metodo costruisce le celle e viene chiamato in tempo reale mentre avviene lo scroll della table
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //questa riga crea la cella, il suo nome deve corrispondere con il nome dato alla cella nello storyboard
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell

        // questo metodo porta in dono una variabile chiamata indexPath che contiene
        //   il numero della sezione
        //   il numero della cella da fare
        // quindi possiamo usarlo per "Sposare" la cella con l'array !!
        //   ovvero quando questo metodo crea la cella 0 estraiamo dall'array la
        //   variabile che stà all'indice 0 e così via per tutte le celle successive
        // noi useremo indexPath.row così è il sistema che crea le celle che determina quale istanza estrarre
        let coloreEstratto = DataManager.shared.contenitoreDiColor[indexPath.row]

        // questa riga accede alla label contenuta nella cella
        // adesso che abbiamo l'istanza giusta gli passiamo il nome che sta nel var nome
        cell.textLabel?.text = String(indice) + " - " + coloreEstratto.description
        indice += 1
        cell.backgroundColor = coloreEstratto.color
        return cell
    }
    
    //--------------------------------------------------------------------------
    // questo metodo autorizza le celle ad essere modificate
    // senza questo lo swipe non va (non si apre la cella e non mostra il tasto Delete)
    // e non funziona nemmeno il button Edit
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // diciamo di si
        return true
    }
    
    
    //--------------------------------------------------------------------------
    // Questo metodo viene invocato quando una cella viene cancellata o aggiunta (l'utente ha fatto swipe e toccato Cancel)
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        // trovi questo if perchè è possibile far apparire anche il button per aggiungere le celle
        // questo guarda specificatamente al tocco del pulsante Cancel
        if editingStyle == .delete {
            // se è cancel..
            
            // è importante cancellare prima la variabile dall'array e poi eliminare la cella...
            // ----> !! se no l'App va in CRASH !! <----
            // per eliminare una variabile dall'array usaimo il metodo remove(at:)
            // come al solito usiamo indexPath.row per sapere quale variabile cancellare
            DataManager.shared.contenitoreDiColor.remove(at: indexPath.row)
            
            // cancelliamo la cella dalla table
            tableView.deleteRows(at: [indexPath], with: .top)
        }
    }

}
