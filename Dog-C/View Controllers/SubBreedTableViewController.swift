//
//  SubBreedTableViewController.swift
//  Dog-C
//
//  Created by Haley Jones on 5/22/19.
//  Copyright © 2019 HaleyJones. All rights reserved.
//

import UIKit

class SubBreedTableViewController: UITableViewController {

    var breed: HAJDogBreed?
    var subBreeds: [HAJSubBreed] = []{
        didSet{
            tableView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let breed = breed else {return}
        subBreeds = breed.subBreeds
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return subBreeds.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "subBreedCell", for: indexPath)

        let subBreed = subBreeds[indexPath.row]
        cell.textLabel?.text = subBreed.name

        return cell
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDogPics"{
            
            guard let destinVC = segue.destination as? DogPicCollectionViewController else {return}
            
            guard let index = tableView.indexPathForSelectedRow else {return}
           
            let passSub = subBreeds[index.row]
            guard let passBreed = breed else {return}
           
            HAJBreedNetworkClient().fetchSubBreedImageURLs(passBreed, subBreed: passSub) { (imageURLs) in
                destinVC.imageURLs = imageURLs
                print("finished network call, this many URLs: \(imageURLs.count)")
            }
        }
    }

}
