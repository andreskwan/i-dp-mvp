
import Foundation

struct UserViewData{
    
    let name: String
    let age: String
}

protocol UserView: NSObjectProtocol {
    func startLoading()
    func finishLoading()
    func setUsers(_ users: [UserViewData])
    func setEmptyUsers()
}

class UserPresenter {
    fileprivate let userService:UserService
    weak fileprivate var userView : UserView?
    
    init(userService:UserService){
        self.userService = userService
    }
    
    //programming to a supertype 
    //open close principle
    func attachView(_ view:UserView){
        userView = view
    }
    
    func detachView() {
        userView = nil
    }
    
    //ViewController conforms UserView:NSObjectProtocol
    //how getUsers() is tested? if it contains a userView an instance of UIViewController?
    //yes, but UserView is a Protocol(NSObjectProtocol) so anything that conforms to it can be used
    //instead. excelent!
    func getUsers(){
        self.userView?.startLoading()
        userService.getUsers{ [weak self] users in
            self?.userView?.finishLoading()
            if(users.count == 0){
                self?.userView?.setEmptyUsers()
            }else{
                let mappedUsers = users.map{
                    return UserViewData(name: "\($0.firstName) \($0.lastName)", age: "\($0.age) years")
                }
                self?.userView?.setUsers(mappedUsers)
            }
            
        }
    }
}
