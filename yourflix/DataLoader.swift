import Foundation

protocol DataLoader {
    var resource: String { get set }

    associatedtype Resource

    func load() -> [Resource]
}
