//
//  FormularioCell.swift
//  Clase1Mod3
//
//  Created by Admin on 25/05/18.
//  Copyright © 2018 area51. All rights reserved.
//

import UIKit

class FormularioCell: UITableViewCell {

    @IBOutlet weak var tituloLabel: UILabel!
    @IBOutlet weak var valorTextField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
