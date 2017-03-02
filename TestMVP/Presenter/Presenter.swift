//
//  Presenter.swift
//  TestMVP
//
//  Created by Andres Kwan on 3/2/17.
//  Copyright © 2017 is24. All rights reserved.
//

import Foundation

protocol Presenter {
    func attachView(view: UserView)
    func detachView()
    func getItems()
}
