//
//  ListDishViewController.swift
//  Yummie
//
//  Created by Lukich on 15.08.2022.
//

import UIKit

class ListDishViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var category: DishCategory!
    
    var dishs: [Dish] = [
        .init(id: "id1", name: "Garri", description: "klndfvklsmdfg slkdnlksdnf slkdnvlksndfvs lskdnvnsd;fgn slkdnf;lsknd;flkns slkdnv;ksnd;flmwe; ;lwejmf;aoms;clm;legvn;wen q;w3jtpo3j;wemdv;lsmd;vms lkenmfg;skmd;ck,a[dsmf slkdnmf;sdockpoweo;msa;ld askldnf;jepcomweop;mf;lqwemf alsknf;akefpokas;mc;woekjfpoamsdcjwepomf;sdmvpokjwefo;msd;mfwemfThis is the best i have ever tastet", image: "https://picsum.photos/100/200", calories: 34),
        .init(id: "id1", name: "Indomi", description: "This is the best i have ever tastet", image: "https://picsum.photos/100/200", calories: 134),
        .init(id: "id1", name: "Pizza", description: "This is the best i have ever tastet", image: "https://picsum.photos/100/200", calories: 1234)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = category.name
        registerCells()

    }

    private func registerCells() {
        tableView.register(UINib(nibName: DishListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DishListTableViewCell.identifier)
    }
}

extension ListDishViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dishs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier) as! DishListTableViewCell
        cell.setup(dish: dishs[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DishDetailViewController.instantiate()
        controller.dish = dishs[indexPath.row]
        navigationController?.pushViewController(controller, animated: true)
    }
    
}
