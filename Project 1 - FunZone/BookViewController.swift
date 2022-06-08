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
        var fileName : String
        
        init(title : String, fileName : String){
            self.title = title
            self.fileName = fileName
        }
    }
    
    var books = [Book]()
    
    func addBooks(){
        books = []
        books.append(Book.init(title: "Dash Diet", fileName: "Dash Diet"))
        books.append(Book.init(title: "Communication and the Self-Concept: Who are You?", fileName: "Communication and the Self-Concept Who are you?"))
        books.append(Book.init(title: "Data Management and Human Resource Systems", fileName: "Data Management and Human Resource Systems"))
        books.append(Book.init(title: "What is an HRIS System?", fileName: "What is an HRIS System?"))
        books.append(Book.init(title: "Organizational Behavior", fileName: "Organizational Behavior"))

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addBooks()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        books.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! BookCollectionViewCell

        cell.bookTitle.text = books[indexPath.row].title
        cell.bookImage.image = UIImage(systemName: "book.fill")
        
        return cell
        
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let pdfScreenVC = storyboard.instantiateViewController(withIdentifier: "pdfView") as! PDFViewController
        pdfScreenVC.pdfName = books[indexPath.row].fileName
        self.present(pdfScreenVC, animated: true, completion: nil)
    }
}


extension BookViewController : UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 120, height: 180)
    }
    
}

