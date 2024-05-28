//
//  Screen.swift
//  FashinShopPet
//
//  Created by Александр Богачев on 6.04.24.
//

import Foundation

protocol Screen<Presenter>: AnyObject {
    associatedtype Presenter: AnyObject
    
    var presenter: Presenter! { get set }
}
