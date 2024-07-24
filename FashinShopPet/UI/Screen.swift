//
//  Screen.swift
//  FashinShopPet
//
//  Created by Александр Богачев on 24.07.24.
//

import Foundation


protocol Screen<Presenter>: AnyObject {
    associatedtype Presenter: AnyObject
    
    var presenter: AnyObject! { get set }
    
}
