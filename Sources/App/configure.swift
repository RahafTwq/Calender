import Vapor
import Fluent
import FluentPostgresDriver

// configures your application
public func configure(_ app: Application) throws {
    
    
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    // register routes
    try routes(app)
    
    app.databases.use(
        .postgres(hostname: "localhost",
                  username: "rahafaldosary",
                  password: "vapor",
                  database: "nannomonths"),as: .psql
                 )
    
    app.migrations.add(CreateMonths())
    app.migrations.add(CreateEvents())

}
