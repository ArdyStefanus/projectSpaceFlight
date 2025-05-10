//
//  Article.swift
//  ProjectSpaceFlight
//
//  Created by Macbook Pro on 10/05/25.
//

import Foundation
import SwiftyJSON

struct ArticleBlog {
    let report: Report
    let featured: Bool
    let launches: [Launch]
    let events: [Event]

    init(data: JSON) {
        report = Report.init(data: data["report"])
        featured = data["featured"].boolValue
        launches = data["launches"].arrayValue.map { Launch(data: $0) }
        events = data["events"].arrayValue.map { Event(data: $0) }
    }
}

struct Report {
    let id: Int
    let title: String
    let authors: [Author]
    let url: String
    let imageUrl: String
    let newsSite: String
    let summary: String
    let publishedAt: String
    let updatedAt: String
    
    init(data: JSON) {
        id = data["id"].intValue
        title = data["title"].stringValue
        authors = data["authors"].arrayValue.map { Author(data: $0) }
        url = data["url"].stringValue
        imageUrl = data["image_url"].stringValue
        newsSite = data["news_site"].stringValue
        summary = data["summary"].stringValue
        publishedAt = data["published_at"].stringValue
        updatedAt = data["updated_at"].stringValue
    }
}

struct Author {
    let name: String
    let socials: Socials

    init(data: JSON) {
        name = data["name"].stringValue
        socials = Socials(data: data["socials"])
    }
}

struct Socials {
    let x: String
    let youtube: String
    let instagram: String
    let linkedin: String
    let mastodon: String
    let bluesky: String

    init(data: JSON) {
        x = data["x"].stringValue
        youtube = data["youtube"].stringValue
        instagram = data["instagram"].stringValue
        linkedin = data["linkedin"].stringValue
        mastodon = data["mastodon"].stringValue
        bluesky = data["bluesky"].stringValue
    }
}

struct Launch {
    let launchId: String
    let provider: String

    init(data: JSON) {
        launchId = data["launch_id"].stringValue
        provider = data["provider"].stringValue
    }
}

struct Event {
    let eventId: Int
    let provider: String

    init(data: JSON) {
        eventId = data["event_id"].intValue
        provider = data["provider"].stringValue
    }
}

