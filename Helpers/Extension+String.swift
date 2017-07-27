//
//  Extension+String.swift
//  DarwinLabsMachineTest
//
//  Created by Anil Kumar on 7/27/17.
//  Copyright © 2017 Anil Kumar. All rights reserved.
//

import UIKit

extension String {
    func removeAllSpaces () -> String {
        return self.trimmingCharacters(in: CharacterSet.whitespaces)
    }
}
