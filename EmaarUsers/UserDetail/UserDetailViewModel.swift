//
//  UserDetailViewModel.swift
//  EmaarUsers
//
//  Created by Ankur Agarwal on 18/05/23.
//

import Foundation

protocol UserDetailViewModelDelegate: NSObject {
    func parseUserDetailSuccess()
    func parseUserDetailFailedWithMessage(_ message: String)
}

class UserDetailViewModel: NSObject {
    
    private var selectedUser: UserModel? {
        didSet {
            self.delegate?.parseUserDetailSuccess()
        }
    }
    
    weak var delegate: UserDetailViewModelDelegate?
    
    init(_ delegate: UserDetailViewModelDelegate?) {
        self.delegate = delegate
    }
    
    func getSelectedUserData(_ userId: String) {
        
        let predicate = NSPredicate(format: "uuid == %@", userId)
          
        let user  = DatabaseManager.getObjectsforEntity(.user, sortBy: nil, isAscending: true, predicate: predicate, count: -1) as! [User]
        
        print("\(user.count)")
        
        if(user.count > 0) {
            self.selectedUser = UserModel(dictionary: user[0])
        }
        
    }
    
    
    func userDetails() -> UserModel? {
        return self.selectedUser
    }
    
}
