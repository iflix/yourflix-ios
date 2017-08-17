import Foundation

struct TVDataLoader: DataLoader {
    var resource: String

    init(resource: String) {
        self.resource = resource
    }

    func load() -> [TV] {
        guard let location = Bundle.main.path(forResource: resource, ofType: "json") else { return [] }
        let resourceUrl = URL(fileURLWithPath: location)
        guard let data = try? Data(contentsOf: resourceUrl) else { return [] }

        guard let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [[String: Any]] else { return [] }

        return json?.map { values -> TV in
            return TV(values)
        } ?? []
    }
}
