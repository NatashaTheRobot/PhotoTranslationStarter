//
//  Speaker.swift
//  PhotoTranslator
//
//  Created by Natasha Murashev on 4/6/24.
//

import CorePersistence

protocol Speaker {
    var speakerName: String { get }
    var elevenLabsVoiceID: String { get }
    var elevenLabsVoiceSettings: [String: JSON]? {get}
}

extension Speaker {
    
    var elevenLabsVoiceSettings: [String: JSON]? {
        return [
            "stability" : 0.5,
            "similarity_boost": 0.75
        ]
    }
}
