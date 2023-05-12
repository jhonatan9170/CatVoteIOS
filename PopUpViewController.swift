//
//  PopUPViewController.swift
//  CatVoteIOS
//
//  Created by Jhonatan chavez chavez on 12/05/23.
//

import UIKit


protocol PopUpDelegate :AnyObject {
    func acceptButtonPressed()
}


class PopUPViewController: UIViewController {
    
    weak var delegate: PopUpDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func aceptPressed(_ sender: Any) {
        self.dismiss(animated: true)
        delegate?.acceptButtonPressed()
    }
    
    @IBAction func cancelPressed(_ sender: Any) {
        self.dismiss(animated: true)
        
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
