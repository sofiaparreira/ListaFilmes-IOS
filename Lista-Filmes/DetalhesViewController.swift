//
//  DetalhesViewController.swift
//  Lista-Filmes
//
//  Created by Sofia on 20/08/24.
//

import UIKit

class DetalhesViewController: UIViewController {

    @IBOutlet weak var lblNome: UILabel!
    @IBOutlet weak var lblGenero: UILabel!
    @IBOutlet weak var lblNota: UILabel!
    @IBOutlet weak var lblLancamento: UILabel!
    
    var detalhesFilme: Filme?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLabels()
    }
    
    func setup(filme: Filme){
        detalhesFilme = filme
    }
    
    func setupLabels(){
        lblNome.text = detalhesFilme?.nome
        lblGenero.text = detalhesFilme?.genero
        lblNota.text = detalhesFilme?.nota
        lblLancamento.text = detalhesFilme?.lancamento
    }
    
}
