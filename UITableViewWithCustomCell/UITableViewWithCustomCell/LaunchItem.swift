import UIKit

struct LaunchItem {
    var name: String
    var description: String
    var launchTime: String
    var status: Status
    
    enum Status {
        case success
        case failure
    }
}
