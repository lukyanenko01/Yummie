//
//  HomeViewController.swift
//  Yummie
//
//  Created by Lukich on 14.08.2022.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var popularCollectionView: UICollectionView!
    
    @IBOutlet weak var specialsCollectionView: UICollectionView!
    var categories: [DishCategory] = [
        .init(id: "id1", name: "Africa Dish", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "Africa Dish 2", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "Africa Dish 3", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "Africa Dish 4", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "Africa Dish 5", image: "https://picsum.photos/100/200")
    ]
    
    var populars: [Dish] = [
        .init(id: "id1", name: "Garri", description: "klndfvklsmdfg slkdnlksdnf slkdnvlksndfvs lskdnvnsd;fgn slkdnf;lsknd;flkns slkdnv;ksnd;flmwe; ;lwejmf;aoms;clm;legvn;wen q;w3jtpo3j;wemdv;lsmd;vms lkenmfg;skmd;ck,a[dsmf slkdnmf;sdockpoweo;msa;ld askldnf;jepcomweop;mf;lqwemf alsknf;akefpokas;mc;woekjfpoamsdcjwepomf;sdmvpokjwefo;msd;mfwemfThis is the best i have ever tastet", image: "https://picsum.photos/100/200", calories: 34),
        .init(id: "id1", name: "Indomi", description: "This is the best i have ever tastet", image: "https://picsum.photos/100/200", calories: 134),
        .init(id: "id1", name: "Pizza", description: "This is the best i have ever tastet", image: "https://picsum.photos/100/200", calories: 1234)

    ]
    
    var specials: [Dish] = [
        .init(id: "id1", name: "Fried Plantain", description: "This is the best i have ever tastet", image: "https://picsum.photos/100/200", calories: 134),
        .init(id: "id1", name: "Beans and Garri", description: "This is the best i have ever tastet", image: "https://picsum.photos/100/200", calories: 1234)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        specialsCollectionView.delegate = self
        specialsCollectionView.dataSource = self
        registerCells()
        
    }
    
    private func registerCells() {
        categoryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        popularCollectionView.register(UINib(nibName: DishPortraitCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: DishPortraitCollectionViewCell.identifier)
        specialsCollectionView.register(UINib(nibName: DishLandscapeCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: DishLandscapeCollectionViewCell.identifier)
    }
    
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case categoryCollectionView:
            return categories.count
        case popularCollectionView:
            return populars.count
        case specialsCollectionView:
            return specials.count
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
        case categoryCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
            cell.setup(category: categories[indexPath.row])
            return cell
        case popularCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishPortraitCollectionViewCell.identifier, for: indexPath) as! DishPortraitCollectionViewCell
            cell.setup(dish: populars[indexPath.row])
            return cell
        case specialsCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishLandscapeCollectionViewCell.identifier, for: indexPath) as! DishLandscapeCollectionViewCell
            cell.setup(dish: specials[indexPath.row])
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == categoryCollectionView {
            let controller = ListDishViewController.instantiate()
            controller.category = categories[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
        } else {
            let controller = DishDetailViewController.instantiate()
            controller.dish = collectionView == popularCollectionView ? populars[indexPath.row] : specials[indexPath.row]
            
            navigationController?.present(controller, animated: true)
        }
    }
    
}
