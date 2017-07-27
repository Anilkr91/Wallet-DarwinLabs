//
//  Login+Helpers.swift
//  DarwinLabsMachineTest
//
//  Created by Anil Kumar on 7/24/17.
//  Copyright © 2017 Anil Kumar. All rights reserved.
//

import UIKit

class Default {
    
    static func getCurrentUser() -> DLUser {
        let pref = UserDefaults.standard
        let id = pref.object(forKey: "id") as? String
        let token = pref.object(forKey: "token") as? String
        
        let user = DLUser(_id: id ?? "", token: token ?? "")
        return user
    }

    static func setCurrentUser(user: DLUser) {
        let pref = UserDefaults.standard
        pref.set(user._id, forKey: "id")
        pref.set(user.token, forKey: "token")
        pref.synchronize()
    }
    
    static func setCurrentUserWallet(user: DLCreateWalletResponse) {
        let pref = UserDefaults.standard
        
        pref.set(user.__v, forKey: "__v")
        pref.set((user._id), forKey: "_id")
        pref.set(user.createdAt, forKey: "createdAt")
        pref.set(user.updatedAt, forKey: "updatedAt")
        pref.set(user.user, forKey: "user")
        pref.set(user.xpub, forKey: "xpub")
        
        pref.synchronize()
    }
    
    static func getCurrentUserWallet() -> DLCreateWalletResponse {
        let pref = UserDefaults.standard
        
        let __v = pref.object(forKey: "__v") as? Bool ?? false
        let _id = pref.object(forKey: "_id") as? String ?? ""
        let createdAt = pref.object(forKey: "createdAt") as? String ?? ""
        let updatedAt = pref.object(forKey: "updatedAt") as? String ?? ""
        let user = pref.object(forKey: "user") as? String ?? ""
        let xpub = pref.object(forKey: "xpub") as? String ?? ""
        
        let wallet = DLCreateWalletResponse(__v: __v, _id: _id, createdAt: createdAt, updatedAt: updatedAt, user: user, xpub: xpub)
        return wallet
    }
    
    
}
