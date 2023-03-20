//
//  File.swift
//
//
//  Created by Rahaf Aldosary on 26/08/1444 AH.
//

import Foundation
import Fluent
import FluentPostgresDriver

struct CreateMonths: Migration {
    
    func prepare(on database: Database) -> EventLoopFuture<Void> {
        database.schema("months") // table name
            .id()
            .field("Name", .string) // columns

            .create()
    }
    
    func revert(on database: Database) -> EventLoopFuture<Void> {
        database.schema("months").delete()
            
    }
}
