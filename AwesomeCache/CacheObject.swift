import Foundation

/// This class is a wrapper around an objects that should be cached to disk.
///
/// NOTE: It is currently not possible to use generics with a subclass of NSObject
/// 	 However, NSKeyedArchiver needs a concrete subclass of NSObject to work correctly
class CacheObject<T: Codable>: NSObject, Codable {
    let value: T
    let expiryDate: Date

    /// Designated initializer.
    ///
    /// - parameter value:      An object that should be cached
    /// - parameter expiryDate: The expiry date of the given value
    init(value: T, expiryDate: Date) {
        self.value = value
        self.expiryDate = expiryDate
    }

    /// Determines if cached object is expired
    ///
    /// - returns: True If objects expiry date has passed
    func isExpired() -> Bool {
        return expiryDate.isInThePast
    }
}

extension Date {
    var isInThePast: Bool {
        return self.timeIntervalSinceNow < 0
    }
}
