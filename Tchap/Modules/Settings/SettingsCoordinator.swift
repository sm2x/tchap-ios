/*
 Copyright 2018 New Vector Ltd
 
 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at
 
 http://www.apache.org/licenses/LICENSE-2.0
 
 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */

import Foundation

protocol SettingsCoordinatorDelegate: class {
    func settingsCoordinator(_ coordinator: SettingsCoordinatorType, reloadMatrixSessionsByClearingCache clearCache: Bool)
}

final class SettingsCoordinator: NSObject, SettingsCoordinatorType {
    
    // MARK: - Properties
    
    // MARK: Private
    
    private let settingsViewController: SettingsViewController
    private let router: NavigationRouterType
    
    // MARK: Public
    
    var childCoordinators: [Coordinator] = []
    
    weak var delegate: SettingsCoordinatorDelegate?
    
    // MARK: - Setup
    
    init(router: NavigationRouterType) {
        self.router = router
        self.settingsViewController = SettingsViewController.instantiate()
    }
    
    // MARK: - Public methods
    
    func start() {
        self.settingsViewController.delegate = self
    }
    
    func toPresentable() -> UIViewController {
        return self.settingsViewController
    }
}

// MARK: - SettingsViewControllerDelegate
extension SettingsCoordinator: SettingsViewControllerDelegate {
    
    func settingsViewController(_ settingsViewController: SettingsViewController!, reloadMatrixSessionsByClearingCache clearCache: Bool) {
        self.delegate?.settingsCoordinator(self, reloadMatrixSessionsByClearingCache: clearCache)
    }
}
