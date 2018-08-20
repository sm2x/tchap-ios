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

import UIKit

final class RoomsCoordinator: RoomsCoordinatorType {
    
    // MARK: - Properties
    
    // MARK: Private
    
    private let roomsViewController: RoomsViewController
    private let session: MXSession
    private let roomsDataSource: RoomsDataSource
    
    // MARK: Public
    
    var childCoordinators: [Coordinator] = []
    
    // MARK: - Setup
    
    init(session: MXSession) {
        self.session = session
        
        self.roomsViewController = RoomsViewController.instantiate()
        self.roomsDataSource = RoomsDataSource(matrixSession: self.session)
        self.roomsDataSource.finalizeInitialization()
    }
    
    // MARK: - Public methods
    
    func start() {
        self.roomsViewController.displayList(self.roomsDataSource)
    }
    
    func toPresentable() -> UIViewController {
        return self.roomsViewController
    }
}
