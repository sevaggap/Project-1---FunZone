//
//  BookViewController.swift
//  Project 1 - FunZone
//
//  Created by Sevag Gaprielian on 2022-05-25.
//

import UIKit

class BookViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{
    
    class Book {
        var title : String
        var author : String
        
        init(title : String, author : String){
            self.title = title
            self.author = author
        }
    }
    
    var books = [Book]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        books.append(Book.init(title: "milk and honey", author: "Rupi Kuar"))
        books.append(Book.init(title: "home body", author: "Rupi Kuar"))
        books.append(Book.init(title: "Heartstopper", author: "Alice Oseman"))
        books.append(Book.init(title: "Strange Planet", author: "Nathan W Pyle"))
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        books.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if(collectionView.restorationIdentifier != "second"){
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! BookCollectionViewCell
        

        cell.bookTitle.text = books[indexPath.row].title
        cell.bookAuthor.text = books[indexPath.row].author
        cell.bookImage.image = UIImage(systemName: "book.fill")
        cell.backgroundColor = UIColor.white
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 20
        
        return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! BookCollectionViewCell
            
            cell.secondCollectionLabel.text = "test"
            cell.backgroundColor = UIColor.white
            cell.layer.borderWidth = 1
            cell.layer.cornerRadius = 20
            
            return cell
        }
        
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension BookViewController : UICollectionViewDelegateFlowLayout{
    
    // write sizeForItemAt -> will bring this function which should return a CGSize with width and height
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 128, height: 128)
    }
    
}

