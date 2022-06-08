//
//  PDFViewController.swift
//  Project 1 - FunZone
//
//  Created by Sevag Gaprielian on 2022-06-02.
//

import UIKit
import PDFKit

class PDFViewController: UIViewController {

    var pdfName : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let pdfView = PDFView(frame: view.bounds)
        view.addSubview(pdfView)
        view.addSubview(pdfView)
        pdfView.autoScales = true
        let filePath = Bundle.main.url(forResource: pdfName, withExtension: "pdf")
        pdfView.document = PDFDocument(url: filePath!)

    }
    
}
