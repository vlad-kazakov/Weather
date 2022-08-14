//
//  ModuleConfigurable.swift
//  Weather
//
//  Created by Kazakov Vladyslav on 08.08.2022.
//

import UIKit

protocol ModuleConfigurable where Self: Coordinator {
    func configure() -> UIViewController
}
