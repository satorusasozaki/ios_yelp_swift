//
//  SwitchCell.swift
//  Yelp
//
//  Created by Satoru Sasozaki on 2/23/16.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import UIKit

@objc protocol SwitchCellDelegate {
    optional func switchCell(switchCell: SwitchCell, didChangeValue value: Bool)
}

class SwitchCell: UITableViewCell {

    @IBOutlet weak var switchLabel: UILabel!
    @IBOutlet weak var onSwitch: UISwitch!
    
    weak var delegate: SwitchCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        onSwitch.addTarget(self, action: "switchValueChanged", forControlEvents: UIControlEvents.ValueChanged)
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func switchValueChanged(){
        print("switchValue changed")
        
//        if delegate != nil {
//            // Explain the benefit of optional values
//            // if the delegate implements the switchCell method, then call it on the delegate. 
//            // Otherwise (if switchCell method is not implemented in the delegate) do nothing.
//            delegate!.switchCell?(self, didChangeValue: onSwitch.on)
//        }
        
        // The same concept as above
        // if delegate is not nill and also switchCell method is implemented in the delegate object
        // then call it
        delegate?.switchCell?(self, didChangeValue: onSwitch.on)
    }

}
