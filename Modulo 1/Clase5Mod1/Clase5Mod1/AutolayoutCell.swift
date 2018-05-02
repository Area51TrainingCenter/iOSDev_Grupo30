//
//  AutolayoutCell.swift
//  Clase5Mod1
//
//  Created by Alumno on 4/27/18.
//  Copyright © 2018 Area51 Training Center. All rights reserved.
//

import UIKit

class AutolayoutCell: UITableViewCell {

    @IBOutlet weak var tituloLabel: UILabel!
    @IBOutlet weak var descripcionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
