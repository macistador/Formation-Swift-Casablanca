//
//  DBService.swift
//  FirstApp
//
//  Created by Michel-Andre Chirita on 28/03/2019.
//  Copyright © 2019 croamac. All rights reserved.
//

import Foundation
import SQLite

struct DBService {

    private let db = try! Connection("path/to/db.sqlite3")
    private let weatherTable = Table("weather")

    func config() {

        do {
            let id = Expression<Int64>("id")
            let temperature = Expression<String>("temperature") //double
            let cityName = Expression<String>("cityName")

            try db.run(weatherTable.create { t in
                t.column(id, primaryKey: true)
                t.column(temperature)
                t.column(cityName, unique: true)
            })
            // CREATE TABLE "users" (
            //     "id" INTEGER PRIMARY KEY NOT NULL,
            //     "name" TEXT,
            //     "email" TEXT NOT NULL UNIQUE
            // )

            let insert = weatherTable.insert(temperature <- "13", cityName <- "Paris")
            let rowid = try db.run(insert)
            // INSERT INTO "users" ("temperature", "cityName") VALUES ('13', 'Paris')

            for weather in try db.prepare(weatherTable) {
                print("id: \(weather[id]), temperature: \(weather[temperature]), cityNAme: \(weather[cityName])")
                // id: 1, temperature: "13", cityName: "Paris"
            }
            // SELECT * FROM "weather"

            let paris = weatherTable.filter(id == rowid)

            try db.run(paris.update(cityName <- cityName.replace("Paris", with: "Ici c'est Paris")))
            // UPDATE "weather" SET "cityName" = replace("cityName", 'Paris', 'Ici c'est Paris')
            // WHERE ("id" = 1)

            try db.run(paris.delete())
            // DELETE FROM "weather" WHERE ("id" = 1)

            let count = try db.scalar(weatherTable.count) // 0
            // SELECT count(*) FROM "weather"

            print(count)
        }
        catch {
            print("Erreur de BDD SQL: \(error)")
        }
    }

}
