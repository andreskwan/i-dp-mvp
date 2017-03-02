//
//  UserView.swift
//  TestMVP
//
//  Created by Andres Kwan on 3/2/17.
//  Copyright © 2017 is24. All rights reserved.
//

import Foundation

protocol UserView: NSObjectProtocol {
    func startLoading()
    func finishLoading()
    func setUsers(users: [UserViewData])
    func setEmptyUsers()
}
