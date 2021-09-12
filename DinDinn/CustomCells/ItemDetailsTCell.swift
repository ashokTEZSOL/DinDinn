//
//  ItemDetailsTCell.swift
//  DinDinnTest
//
//  Created by apple on 12/09/21.
//  Copyright © 2021 Komara Ashok. All rights reserved.

import UIKit

class ItemDetailsTCell: UITableViewCell {

    @IBOutlet weak var item_Image: UIImageView!
    @IBOutlet weak var title_Lbl: UILabel!
    @IBOutlet weak var description_Lbl: UILabel!
    @IBOutlet weak var quantity_Lbl: UILabel!
    @IBOutlet weak var add_Btn: UIButton!
    @IBOutlet weak var layer_View: UIView!
    @IBOutlet weak var layerView1: UIView!
    
    
    var item : ProductDetailsModel?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.add_Btn.layer.cornerRadius = self.add_Btn.frame.height/2
        self.add_Btn.backgroundColor = .black
        self.add_Btn.setTitleColor(.white, for: .normal)
        self.add_Btn.setTitle("Added 1", for: .highlighted)



        // shadow
        layer_View.layer.cornerRadius = 10
        layer_View.layer.shadowColor = UIColor.black.cgColor
        layer_View.layer.shadowOffset = CGSize(width: 3, height: 3)
        layer_View.layer.shadowOpacity = 0.3
        layer_View.layer.shadowRadius = 10.0
        layer_View.layer.masksToBounds = true
        layer_View.clipsToBounds = true
        
        layerView1.layer.cornerRadius = 10
        layerView1.layer.shadowColor = UIColor.black.cgColor
        layerView1.layer.shadowOffset = CGSize(width: 3, height: 3)
        layerView1.layer.shadowOpacity = 0.3
        layerView1.layer.shadowRadius = 10.0
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateUI(item : ProductDetailsModel) {
        self.item = item
        self.title_Lbl.text = item.title
        self.description_Lbl.text = item.description
        self.quantity_Lbl.text = "\(item.quantityString) grams, \(item.weightString) cm"
        self.add_Btn.setTitle("\(item.priceString) usd", for: .normal)
        self.item_Image.image = UIImage(named: item.image ?? "")
    }
    
    @IBAction func add_Action(_ sender: UIButton) {
        if let object = self.item {
            DataBase.shared.saveCart(pID: object.productId, title: object.title ?? "", price: object.priceString, image: object.image ?? "")
            
            sender.backgroundColor = .green
            sender.setTitle("Added 1", for: .normal)
            
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.0) {
                // change label here
                sender.backgroundColor = .black
                self.add_Btn.setTitle("\(self.item?.priceString ?? "") usd", for: .normal)
            }
        }
    }
}
