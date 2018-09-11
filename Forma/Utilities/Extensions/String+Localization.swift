//
//  String+Localization.swift
//  Naqliat
//
//  Created by ahmed elshobary on 3/28/17.
//  Copyright © 2017 ahmed elshobary. All rights reserved.
//

import Foundation
extension String {
    
    var localized: String {
        return NSLocalizedString(self, bundle: .main, comment: "")
    }
}
