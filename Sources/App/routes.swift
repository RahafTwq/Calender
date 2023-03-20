import Vapor

func routes(_ app: Application) throws {
    
    //months and event get
    app.get("month") { req in
        Months.query(on: req.db).all()
    }
    
    
    //month/id
    app.get("month", ":monthId") { req -> EventLoopFuture<Months> in
        Months.find(req.parameters.get("monthId"), on: req.db)
            .unwrap(or: Abort(.notFound))
    }
    
    
    //Months post
  
    app.post("month") { req -> EventLoopFuture<Months> in
        
        let month = try req.content.decode(Months.self)
        
        return month.create(on: req.db).map {month}
    }
    
    
    //Months put
    
    app.put("month"){ req -> EventLoopFuture<HTTPStatus> in
        let month = try req.content.decode(Months.self)
        return Months.find(month.id, on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap{
                $0.title = month.title
                return $0.update(on: req.db).transform(to: .ok)
            }
    }
    
    // Months Delete
    app.delete("month",":monthId"){ req -> EventLoopFuture<HTTPStatus> in
        Months.find(req.parameters.get("monthId"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap{
                $0.delete(on: req.db)
                
            }.transform(to: .ok)
    }
    
    
    //Events get
    app.get("events") { req in
        Events.query(on: req.db).all()
    }
    
    
    //Events post
    app.post("events") { req -> EventLoopFuture<Events> in
        let event = try req.content.decode(Events.self)
        return event.create(on: req.db).map {event}
    }
    
    
    //Events put
    app.put("events"){ req -> EventLoopFuture<HTTPStatus> in
        let event = try req.content.decode(Events.self)
        return Events.find(event.id, on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap{
                $0.title = event.title
                $0.body = event.body

                return $0.update(on: req.db).transform(to: .ok)
            }
    }
    
    
    //Events delete
    app.delete("events",":eventId"){ req -> EventLoopFuture<HTTPStatus> in
        Events.find(req.parameters.get("eventId"), on: req.db)
            .unwrap(or: Abort(.notFound))
            .flatMap{
                $0.delete(on: req.db)
                
            }.transform(to: .ok)
    }
}
