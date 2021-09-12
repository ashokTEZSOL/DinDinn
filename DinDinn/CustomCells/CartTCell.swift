//
//  CartTCell.swift
//  DinDinnTest
//
//  Created by apple on 12/09/21.
//  Copyright © 2021 Komara Ashok. All rights reserved.

import UIKit
import RealmSwift

class CartTCell: UITableViewCell {

    @IBOutlet weak var image_View: UIImageView!
    @IBOutlet weak var title_Lbl: UILabel!
    @IBOutlet weak var price_Lbl: UILabel!
    @IBOutlet weak var remove_Btn: UIButton!
    
    var item : CartObject?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.remove_Btn.layer.cornerRadius = self.remove_Btn.frame.height/2
        self.remove_Btn.clipsToBounds = true
        self.remove_Btn.backgroundColor = UIColor.lightGray
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateUI(item : CartObject) {
        self.item = item
        
        self.image_View.image = UIImage(named: "")
        self.title_Lbl.text = item.title
        self.price_Lbl.text = "\(item.price) usd"
        self.image_View.image = UIImage(named: item.image)
    }
    
    @IBAction func remove_Action(_ sender: UIButton) {
        if let item = self.item {
            DataBase.shared.removeCart(obj: item)
        }
    }
    
}
