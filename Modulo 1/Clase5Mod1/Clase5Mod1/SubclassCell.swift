//
//  SubclassCell.swift
//  Clase5Mod1
//
//  Created by Alumno on 4/27/18.
//  Copyright © 2018 Area51 Training Center. All rights reserved.
//

import UIKit

class SubclassCell: UITableViewCell {

    @IBOutlet weak var nombreLabel: UILabel!
    @IBOutlet weak var interruptorSwitch: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
