//
//  LocalState.swift
//  Professional-ios
//
//  Created by Abhishek Gupta on 26/08/23.
//

import Foundation

class LocalState  {
    
    enum keys:String {
        case hasOnBoarded
    }
    
    static var hasOnboarded:Bool {
        get{
            return UserDefaults.standard.bool(forKey: keys.hasOnBoarded.rawValue)
        }
        set(state){
            UserDefaults.standard.setValue(state, forKey: keys.hasOnBoarded.rawValue)
        }
    }
}
