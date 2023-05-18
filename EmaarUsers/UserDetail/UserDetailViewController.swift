//
//  UserDetailViewController.swift
//  EmaarUsers
//
//  Created by Ankur Agarwal on 18/05/23.
//

import Foundation
import SDWebImage

@objc
class UserDetailViewController: UIViewController {
    var userDetailViewModel: UserDetailViewModel!
    private var selectedUserUuid: String = ""
    
    @IBOutlet weak var userImg: UIImageView!
    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var userJoined: UILabel!
    @IBOutlet weak var userDob: UILabel!
    @IBOutlet weak var userCity: UILabel!
    @IBOutlet weak var userState: UILabel!
    @IBOutlet weak var userCountry: UILabel!
    @IBOutlet weak var userPostCode: UILabel!
    @IBOutlet weak var userAge: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.userDetailViewModel = UserDetailViewModel(self)
        getData()
    }
    
    
    @objc func setUserUuid(_ user: String) {
        self.selectedUserUuid = user
    }
    
    func getData() {
        self.userDetailViewModel.getSelectedUserData(self.selectedUserUuid)
    }
    
    
    func drawUI() {
        if let title = self.userDetailViewModel?.userDetails()?.name {
            self.title = title
        }
        
        if let imgUrl = self.userDetailViewModel?.userDetails()?.imageUrl {
            let transformer = SDImageResizingTransformer(size: CGSize(width: 200, height: 200), scaleMode: .aspectFit)
            self.userImg.sd_setImage(with: URL(string:imgUrl), placeholderImage:UIImage(named: "placeholder"), context: [.imageTransformer: transformer])
        }
        
        if let email = self.userDetailViewModel?.userDetails()?.email {
            self.userEmail.text = email
        }
        
        if let joined = self.userDetailViewModel?.userDetails()?.registered {
            
            let formatter = DateFormatter()
            formatter.locale = Locale(identifier: "en_US_POSIX")
            formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
            
            let newDate = formatter.date(from: joined)
            
            let formatterConvert = DateFormatter()
            formatterConvert.locale = Locale(identifier: "en_US_POSIX")
            formatterConvert.dateFormat = "MMM d, yyyy"
            
            self.userJoined.text = formatterConvert .string(from: newDate!)
        }
        
        if let dob = self.userDetailViewModel?.userDetails()?.dob {
            
            let formatter = DateFormatter()
            formatter.locale = Locale(identifier: "en_US_POSIX")
            formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
            
            let newDate = formatter.date(from: dob)
            
            let formatterConvert = DateFormatter()
            formatterConvert.locale = Locale(identifier: "en_US_POSIX")
            formatterConvert.dateFormat = "d MMM yyyy"
            
            self.userDob.text = formatterConvert .string(from: newDate!)
        }
        
        if let city = self.userDetailViewModel?.userDetails()?.city {
            self.userCity.text = city
        }
        
        if let state = self.userDetailViewModel?.userDetails()?.state {
            self.userState.text = state
        }
        
        if let country = self.userDetailViewModel?.userDetails()?.country {
            self.userCountry.text = country
        }
        
        if let postcode = self.userDetailViewModel?.userDetails()?.postcode {
            self.userPostCode.text = postcode
        }
        
        if let age = self.userDetailViewModel?.userDetails()?.age {
            self.userAge.text = String(format: "%d",age)
        }
    }
}

extension UserDetailViewController: UserDetailViewModelDelegate {
    
    func parseUserDetailSuccess() {
        drawUI()
    }
    
    func parseUserDetailFailedWithMessage(_ message: String) {
        let alertController = UIAlertController(title: "Error",
                                                message: message,
                                                preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OKAction)
        present(alertController, animated: true, completion: nil)
    }
}
