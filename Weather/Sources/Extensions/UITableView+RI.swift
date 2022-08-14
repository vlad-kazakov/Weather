//
//  UITableView+RI.swift
//  Weather
//
//  Created by Kazakov Vladyslav on 09.08.2022.
//

import UIKit

public extension UITableView {
    func register<T: UITableViewCell>(cellClass: T.Type) where T: ReusableIdentified {
        let nibName = cellClass.preferedNibName
        let nib = UINib(nibName: nibName, bundle: cellClass.preferedBundle)
        register(nib, forCellReuseIdentifier: cellClass.preferedReusableIdentifier)
    }
    
    func dequeueReusableCell<T>(_ cellClass: T.Type, indexPath: IndexPath) -> T where T: ReusableIdentified {
        guard let cell = dequeueReusableCell(withIdentifier: cellClass.preferedReusableIdentifier, for: indexPath) as? T else {
            fatalError("There is no such registered cell for: \(cellClass)")
        }
        return cell
    }
}

public protocol ReusableIdentified {
    static var preferedReusableIdentifier: String { get }
    static var preferedNibName: String { get }
    static var preferedBundle: Bundle { get }
}

public extension ReusableIdentified {
    static var preferedBundle: Bundle {
        return Bundle.main
    }
}

public extension ReusableIdentified where Self: UICollectionViewCell {
    static var preferedReusableIdentifier: String {
        return String(describing: Self.self)
    }
    static var preferedNibName: String {
        return String(describing: Self.self)
    }
}

public extension ReusableIdentified where Self: UITableViewCell {
    static var preferedReusableIdentifier: String {
        return String(describing: Self.self)
    }
    static var preferedNibName: String {
        return String(describing: Self.self)
    }
}

public extension ReusableIdentified where Self: UITableViewHeaderFooterView {
    static var preferedReusableIdentifier: String {
        return String(describing: Self.self)
    }

    static var preferedNibName: String {
        return String(describing: Self.self)
    }
}
