//
//  ListOrdersViewController.swift
//  Yummie
//
//  Created by Lukich on 15.08.2022.
//

import UIKit

class ListOrdersViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var orders: [Order] = [
        .init(id: "id", name: "Alex Jopa", dish: .init(id: "id1", name: "Pizza", description: "This is the best i have ever tastet", image: "https://picsum.photos/100/200", calories: 1234)),
        .init(id: "id", name: "Jopa Alex", dish: .init(id: "id1", name: "Pizza", description: "This is the best i have ever tastet", image: "https://picsum.photos/100/200", calories: 1234)),
        .init(id: "id", name: "Raisa Pavlovna", dish: .init(id: "id1", name: "Pizza", description: "This is the best i have ever tastet", image: "https://picsum.photos/100/200", calories: 1234)),
        .init(id: "id", name: "Raisa Pavlovna", dish: .init(id: "id1", name: "Pizza", description: "This is the best i have ever tastet", image: "https://picsum.photos/100/200", calories: 1234))

    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Orders"
        registerCells()
    }
    
    private func registerCells() {
        tableView.register(UINib(nibName: DishListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DishListTableViewCell.identifier)
    }
}

extension ListOrdersViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier) as! DishListTableViewCell
        cell.setup(order: orders[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DishDetailViewController.instantiate()
        controller.dish = orders[indexPath.row].dish
        navigationController?.pushViewController(controller, animated: true)
    }
    
}
