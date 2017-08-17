import Foundation

struct TV {
    let id: Int
    let vimondId: Int
    let level: String
    let parentId: Int
    let title: String
    let description: String
    let synopsis: String
    let imageUrl: String
    let imagePackId: String
    let slug: String
    let playURL: String
    let trailers: [Int]

    enum JSONKeys: String {
        case id
        case vimondId
        case level
        case parentId
        case title
        case description
        case synopsis
        case imageUrl
        case imagePackId
        case slug
        case playURL
        case trailers
    }

    init(_ json: [String: Any]) {
        id = json[JSONKeys.id.rawValue] as? Int ?? -1
        vimondId = json[JSONKeys.vimondId.rawValue] as? Int ?? -1
        level = json[JSONKeys.level.rawValue] as? String ?? ""
        parentId = json[JSONKeys.parentId.rawValue] as? Int ?? -1
        title = json[JSONKeys.title.rawValue] as? String ?? ""
        description = (json[JSONKeys.description.rawValue] as? [String: String])?["en_US"] ?? ""
        synopsis = (json[JSONKeys.synopsis.rawValue] as? [String: String])?["en_US"] ?? ""
        imageUrl = json[JSONKeys.imageUrl.rawValue] as? String ?? ""
        imagePackId = json[JSONKeys.imagePackId.rawValue] as? String ?? ""
        slug = json[JSONKeys.slug.rawValue] as? String ?? ""
        playURL = json[JSONKeys.playURL.rawValue] as? String ?? ""
        trailers = json[JSONKeys.trailers.rawValue] as? [Int] ?? []
    }
}
