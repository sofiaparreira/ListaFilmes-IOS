//
//  FilmeCell.swift
//  Lista-Filmes
//
//  Created by Sofia on 20/08/24.
//

import UIKit

class FilmeCell: UITableViewCell {

    @IBOutlet weak var lblNome: UILabel!
    @IBOutlet weak var lblGenero: UILabel!
    @IBOutlet weak var lblNota: UILabel!
    @IBOutlet weak var lblLancamento: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setup(filme: Filme) {
        lblNome.text = filme.nome
        lblGenero.text = filme.genero
        lblNota.text = filme.nota
        lblLancamento.text = filme.lancamento
    }

}
