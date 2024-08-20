import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, FormsViewControllerProtocol {

    @IBOutlet weak var tableView: UITableView!
    
    var listaFilmes: [Filme] = []
    let userDefaults = UserDefaults.standard
    let key: String = "LISTAFILMECHAVE"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        do {
            if let listaData = userDefaults.data(forKey: key) {
                let listaFilme = try JSONDecoder().decode([Filme].self, from: listaData)
                self.listaFilmes = listaFilme
                tableView.reloadData()
            }
        } catch {
            print("Erro ao recuperar dados: \(error.localizedDescription)")
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listaFilmes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let filmeIndex = listaFilmes[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "filmes", for: indexPath) as! FilmeCell
        cell.setup(filme: filmeIndex)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let filmeSelecionado = listaFilmes[indexPath.row]
        performSegue(withIdentifier: "detalhesFilme", sender: filmeSelecionado)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let VCDestino = segue.destination as? DetalhesViewController {
            guard let filme = sender as? Filme else { return }
            VCDestino.setup(filme: filme)
        }
        
        if let VCDestino = segue.destination as? FormsViewController {
            VCDestino.delegate = self
        }
    }
    
    @IBAction func addFilme(_ sender: Any) {
        performSegue(withIdentifier: "forms", sender: nil)
    }
    
    func criarFilme(filme: Filme) {
        listaFilmes.append(filme)
        tableView.reloadData()
        
        do {
            let dataLista = try JSONEncoder().encode(listaFilmes)
            userDefaults.set(dataLista, forKey: key) // Correção aqui
        } catch {
            print("Não foi possível salvar a lista de dados: \(error.localizedDescription)")
        }
    }
}
