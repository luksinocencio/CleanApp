import UIKit

public protocol Storyboarded {
    static func instanciate() -> Self
}

extension Storyboarded where Self: UIViewController {
    public static func instanciate() -> Self {
        let vcName = String(describing: self)
        let sbName = vcName.components(separatedBy: "ViewController")[0]
        let bundle = Bundle(for: Self.self)
        let sb = UIStoryboard(name: sbName, bundle: bundle)

        return sb.instantiateViewController(withIdentifier: vcName) as! Self
    }
}
