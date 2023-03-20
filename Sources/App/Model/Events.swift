//
//  File.swift
//  
//
//  Created by Rahaf Aldosary on 26/08/1444 AH.
//

import Foundation
import Fluent
import FluentPostgresDriver
import Vapor

final class Events: Model, Content {
    
    static let schema = "events"
    
    @ID(key: .id)
    var id: UUID? //PK
    
    @Field(key: "name")
    var title: String
    
    @Field(key: "day")
    var body: String
    
    
    //event happens in a month
    @Parent(key: "month_id") //FK
    var month: Months
    
    init() {}
    
    init(id: UUID? = nil, title: String, body: String, monthId: UUID){
        self.id = id
        self.title = title
        self.body = body
        self.$month.id = monthId
    }
}
