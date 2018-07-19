//
//  DataManager.swift
//  Colorific
//
//  Created by alex on 19/11/17.
//  Copyright © 2017 Alex. All rights reserved.
//

import UIKit

class DataManager: NSObject {

    /* le variabili dichiarate come statiche hanno un indirizzo di memoria fisso (non cambia mai)
        qundi se dichiariamo una variabile costante e statica, in cui istanziamo una classe...
        abbiamo la possibilità di raggiungere tutte le var e i metodi (in essa contenuti)
        da qualsiasi parte del programma */
    static let shared = DataManager()
    
    
    /* dichiariamo una var di tipo Array, che contiene oggetti di tipo 'ColorMio'
        adesso da qualsiasi parte del programma possiamo raggiungere
        questa var (leggerla e scriverla) così:
            --->  DataManager.shared.contenitoreDiColor <-----       */
    var contenitoreDiColor : [ColorMio] = []
}

