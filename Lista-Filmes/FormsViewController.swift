//
//  FormsViewController.swift
//  Lista-Filmes
//
//  Created by Sofia on 20/08/24.
//

import UIKit

protocol FormsViewControllerProtocol {
    func criarFilme(filme: Filme)
}

class FormsViewController: UIViewController {

    @IBOutlet weak var txtNome: UITextField!
    @IBOutlet weak var txtGenero: UITextField!
    @IBOutlet weak var txtNota: UITextField!
    @IBOutlet weak var txtLancamento: UITextField!
    
    var delegate : FormsViewControllerProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func create(_ sender: Any) {
        let filmeNovo = Filme(
            nome: txtNome.text ?? "",
            nota: txtNota.text ?? "",
            lancamento: txtLancamento.text ?? "",
            genero: txtGenero.text ?? ""
        )
        
        
        delegate?.criarFilme(filme: filmeNovo)
        navigationController?.popViewController(animated: true) // ao salvar o filme, volte para a tela de trás automaticamente

    }
    
}
