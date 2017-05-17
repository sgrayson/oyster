//
//  taps.swift
//  oyster
//
//  Created by Jasen Henderson on 5/11/17.
//  Copyright © 2017 Otter. All rights reserved.
//

import UIKit


func feedbackTap() {
    let generator = UISelectionFeedbackGenerator()
    generator.prepare()
    generator.selectionChanged()
}


