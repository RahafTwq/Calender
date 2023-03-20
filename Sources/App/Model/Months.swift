//
//  File.swift
//
//
//  Created by Rahaf Aldosary on 26/08/1444 AH.
//

import Foundation
import Fluent
import Vapor
import FluentPostgresDriver

final class Months: Model, Content {
    
    static let schema = "months" //table name
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "name") // column
    var title: String
    
    //month has many events
    @Children(for: \.$month)
    var events: [Events]
    
    init() {}
    
    init(id: UUID? = nil, title: String){
        self.id = id
        self.title = title
    }
}
