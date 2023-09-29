//
//  TipsyBrain.swift
//  Tipsy
//
//  Created by Nikita on 29.09.23.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

struct TipsyBrain {
    
    func calculateForPerson(tts: TTS) -> Double {
        tts.billTotal / tts.peopleSplit + tts.tip * tts.billTotal
    }
    
    
}
