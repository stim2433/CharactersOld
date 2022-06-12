//
//  CharactersView.swift
//  Characters
//
//  Created by stimLite on 05.06.2022.
//

import UIKit


//MARK: Character veiw controller
class CharacterViewController: UIViewController {
    
    var presenter: CharacterViewPresenterProtocol!
    let cellId = "cellIdCharacters"
    
    //pre config ui table view
    let tableView: UITableView = {
        let table = UITableView()
        table.frame = .zero
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)

        //subscribe datasource and delegate
        tableView.dataSource = self
        tableView.delegate = self
        
        //register cell in table view
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        
        //settings constraint table view
        setContstraintTableView()
        
    }
    
    //MARK: Set constraint table view
    func setContstraintTableView () {
        tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        tableView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        tableView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        tableView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
    }
}

//MARK: extension table view datasource
extension CharacterViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        cell.backgroundColor = .green
        
        return cell
    }
}

//MARK: extension table view delegate
extension CharacterViewController: UITableViewDelegate {
    
}

//MARK: Subscration Character view protocol
extension CharacterViewController: CharacterViewProtocol {
    func success() {
        print ("hi, I'm is live")
    }
}
