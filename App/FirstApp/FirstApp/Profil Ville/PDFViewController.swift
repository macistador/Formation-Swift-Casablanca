//
//  PDFViewController.swift
//  FirstApp
//
//  Created by Michel-Andre Chirita on 28/03/2019.
//  Copyright © 2019 croamac. All rights reserved.
//

import UIKit
import WebKit

class PDFViewController: UIViewController {

    var docController: UIDocumentInteractionController!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupDocumentRemote()
        //        setupDocumentLocal()
    }

    func setupDocumentRemote() {
        let url = URL(string: "https://appletree.or.kr/quick_reference_cards/Apple-Mac-iOS/xcode-cheat-sheet.pdf")!
        let urlRequest = URLRequest(url: url)

        let webView = WKWebView(frame: self.view.frame)

        webView.load(urlRequest)

        self.view.insertSubview(webView, at: 0)
    }


    @IBAction func didTappedCloseButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}


// Methode 2: pour un fichier PDF local
//extension PDFViewController: UIDocumentInteractionControllerDelegate {
//
//    func setupDocumentLocal() {
//        let urlVal = "nomDuFichierPDF"
//        let url = URL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent(urlVal)
//        docController = UIDocumentInteractionController(url: url)
//        docController.delegate = self
//        docController.presentPreview(animated: true)
//    }
//
//    func documentInteractionControllerViewControllerForPreview(_ controller: UIDocumentInteractionController) -> UIViewController {
//        return self
//    }
//}
