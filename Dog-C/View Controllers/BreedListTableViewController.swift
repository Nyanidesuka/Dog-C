//
//  BreedListTableViewController.swift
//  Dog-C
//
//  Created by Haley Jones on 5/22/19.
//  Copyright © 2019 HaleyJones. All rights reserved.
//

import UIKit

class BreedListTableViewController: UITableViewController {

    var breeds: [HAJDogBreed] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("the view, she has loaded.")
        HAJBreedNetworkClient().fetchAllBreeds { (fetchedBreeds) in
            DispatchQueue.main.async {
                for breed in fetchedBreeds{
                    self.breeds.append(breed as! HAJDogBreed)
                }
                print("got doggles. \(self.breeds)")
                self.tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return breeds.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "breedCell", for: indexPath)

        let breed = breeds[indexPath.row]
        cell.textLabel?.text = "\(breed.name), Sub Breeds: \(breed.subBreeds.count)"

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let breed = breeds[indexPath.row]
        if breed.subBreeds.count == 0{
            performSegue(withIdentifier: "toDogPics", sender: self)
        } else {
            performSegue(withIdentifier: "toSubBreeds", sender: self)
        }
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSubBreeds"{
            guard let destinVC = segue.destination as? SubBreedTableViewController else {return}
            guard let index = tableView.indexPathForSelectedRow else {return}
            let passBreed = breeds[index.row]
            destinVC.breed = passBreed
        }
        if segue.identifier == "toDogPics"{
            guard let destinVC = segue.destination as? DogPicCollectionViewController else {return}
            guard let index = tableView.indexPathForSelectedRow else {return}
            HAJBreedNetworkClient().fetchBreedImageURLs(breeds[index.row]) { (imageURLs) in
                print("Passing how many URLS: \(imageURLs.count)")
                destinVC.imageURLs = imageURLs
            }
        }
    }
}
