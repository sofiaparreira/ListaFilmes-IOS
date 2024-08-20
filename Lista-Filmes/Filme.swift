//
//  Filme.swift
//  Lista-Filmes
//
//  Created by Sofia on 20/08/24.
//

import Foundation


struct Filme: Encodable, Decodable {
    let nome: String
    let nota: String
    let lancamento: String
    let genero: String
}
