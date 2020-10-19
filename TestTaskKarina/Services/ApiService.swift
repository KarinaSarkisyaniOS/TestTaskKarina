//
//  ApiService.swift
//  TestTaskKarina
//
//  Created by Karina Sarkisyan on 04.10.2020.
//

import Foundation


final class ApiService {
    
    func getPersons(_ handler: @escaping ([Person]?, String?) -> ()) {
        let persons = getFakePersons()
        handler(persons, nil)
    }
    
    private func getFakePersons() -> [Person] {
        return [
            Person(
                name: "Геннадий",
                lastname: "Петров",
                imageUrl: "https://scontent-arn2-1.xx.fbcdn.net/v/t1.0-9/120160382_4479644068775034_4330670008597046578_n.jpg?_nc_cat=103&_nc_sid=8bfeb9&_nc_ohc=MCZbRzBCkQUAX90j-XX&_nc_ht=scontent-arn2-1.xx&oh=da0c49a6891c18e8379c6e79d66cfbfe&oe=5F977691",
                latitude: Double.random(in: -90...90),
                longitude: Double.random(in: -180...180)
            ),
            Person(
                name: "Андрей",
                lastname: "Иванов",
                imageUrl: "https://scontent-arn2-1.xx.fbcdn.net/v/t1.0-9/120178252_4479644415441666_2011203325054447534_n.jpg?_nc_cat=109&_nc_sid=8bfeb9&_nc_ohc=ijiUqOYoIzQAX_O6s1l&_nc_ht=scontent-arn2-1.xx&oh=fbd3be1da52115baa1b97ef822ec991d&oe=5F9775C9",
                latitude: Double.random(in: -90...90),
                longitude: Double.random(in: -180...180)
            ),
            Person(
                name: "Карина",
                lastname: "Саркисян",
                imageUrl: "https://scontent-arn2-1.xx.fbcdn.net/v/t1.0-9/120194434_4479644088775032_8302819276001726556_n.jpg?_nc_cat=102&_nc_sid=8bfeb9&_nc_ohc=ed9P58E3Q9wAX_ffe-_&_nc_ht=scontent-arn2-1.xx&oh=6d2e8d78c99818cf6acc6970992bc7c9&oe=5F9B0865",
                latitude: Double.random(in: -90...90),
                longitude: Double.random(in: -180...180)
            ),
            Person(
                name: "Ацамаз",
                lastname: "Бицоев",
                imageUrl: "https://scontent-arn2-2.xx.fbcdn.net/v/t1.0-9/120190506_4479644248775016_1711687284603563240_n.jpg?_nc_cat=100&_nc_sid=8bfeb9&_nc_ohc=vCcNHdX9lXoAX9_KONg&_nc_ht=scontent-arn2-2.xx&oh=19822616a07c4ea4acf6288663cd1b42&oe=5F9A16F0",
                latitude: Double.random(in: -90...90),
                longitude: Double.random(in: -180...180)
            ),
            Person(
                name: "Марина",
                lastname: "Саркисян",
                imageUrl: "https://scontent-arn2-1.xx.fbcdn.net/v/t1.0-9/120244843_4479644245441683_1444757844774602323_n.jpg?_nc_cat=102&_nc_sid=8bfeb9&_nc_ohc=HcKEiSna3EMAX8oJNhq&_nc_ht=scontent-arn2-1.xx&oh=311fb5b23f5b3bc8079b0ae916fefd5a&oe=5F99FC5B",
                latitude: Double.random(in: -90...90),
                longitude: Double.random(in: -180...180)
            ),
            Person(
                name: "Юля",
                lastname: "Сидорова",
                imageUrl: "https://scontent-arn2-2.xx.fbcdn.net/v/t1.0-9/120161764_4479644432108331_4023667442455695602_n.jpg?_nc_cat=100&_nc_sid=8bfeb9&_nc_ohc=VqsmwS4eDKoAX9gwFih&_nc_oc=AQk4MMiC6j7SQEbtz_ra9oV8izOMOu9iwDpdvPdGoZYGX9t1EslFV4wmrz_Hdb4uFGw&_nc_ht=scontent-arn2-2.xx&oh=518eca92f686c741ac97eaf7527b14db&oe=5F986930",
                latitude: Double.random(in: -90...90),
                longitude: Double.random(in: -180...180)
            ),
            Person(
                name: "Евгений",
                lastname: "Платонов",
                imageUrl: "https://sun9-61.userapi.com/c846221/v846221074/ea650/X218X5JwEB8.jpg",
                latitude: Double.random(in: -90...90),
                longitude: Double.random(in: -180...180)
            ),
            Person(
                name: "Влад",
                lastname: "Богданов",
                imageUrl: "https://sun9-56.userapi.com/c844617/v844617528/b6c83/8XSzIu8cmlE.jpg",
                latitude: Double.random(in: -90...90),
                longitude: Double.random(in: -180...180)
            ),
        ]
    }
}
