import Foundation

struct TVDataLoader {
    var resource: String

    init(resource: String) {
        self.resource = resource
    }

    func load() -> [[String:Any]]? {
        guard let location = Bundle.main.path(forResource: resource, ofType: "json") else { return [] }
        let resourceUrl = URL(fileURLWithPath: location)
        guard let data = try? Data(contentsOf: resourceUrl) else { return [] }

        guard let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [[String: Any]] else { return [] }

        return json
    }
}
