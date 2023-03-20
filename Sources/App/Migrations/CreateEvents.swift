//
//  File.swift
//  
//
//  Created by Rahaf Aldosary on 26/08/1444 AH.
//

import Foundation
import Vapor
import Fluent
import FluentPostgresDriver

struct CreateEvents: Migration{
    
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        database.schema("events")
            .id()
            .field("name", .string)
            .field("day", .string)
        
            .field("month_id", .uuid, .references("months", "id"))
            .create()
    }
    func revert(on database: Database) -> EventLoopFuture<Void> {
        database.schema("events").delete()
    }
}
