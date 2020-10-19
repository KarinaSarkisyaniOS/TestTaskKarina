//
//  PersonListController.swift
//  TestTaskKarina
//
//  Created by Karina Sarkisyan on 03.10.2020.
//

import UIKit

final class PersonListController: UIViewController, PersonListControlling {
    
    
    private var personListView: PersonListViewing!
    private var apiService = ApiService()
    private var gpsService = GpsService()
    
    private var selectedIndex: Int?
    private var selectedLatitude: Double?
    private var selectedLongitude: Double?
    
    private lazy var persons: [Person] = [] {
        didSet {
            let items = getPersonItems(fromPersons: persons)
            personListView.setNewItems(items)
        }
    }
    
    
    override func loadView() {
        super.loadView()
        personListView = PersonListView(controller: self)
        view = personListView
        personListView.configureView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Рядом"
        startFetchingPersons()
    }
    
    
    func personSelected(index: Int) {
        selectedIndex = index
        selectedLatitude = persons[index].latitude
        selectedLongitude = persons[index].longitude
        personListView.setItemSelected(index: index)
        let items = getPersonItems(fromPersons: persons)
        personListView.setNewItems(items)
    }
    
    func pinViewTapped() {
        selectedIndex = nil
        selectedLatitude = nil
        selectedLongitude = nil
        personListView.deselectItem()
        let items = getPersonItems(fromPersons: persons)
        personListView.setNewItems(items)
    }
    
    
    private func startFetchingPersons() {
        Timer.scheduledTimer(withTimeInterval: 3,
                             repeats: true) { (_) in
            guard self.gpsService.isLocationAvailable() else { return }
            self.apiService.getPersons { [weak self] (persons, errorString) in
                
                guard let self = self,
                      let persons = persons else {
                    
                    print(errorString ?? "Неизвестная ошибка")
                    return
                }
                
                if let index = self.selectedIndex {
                    self.selectedLatitude = persons[index].latitude
                    self.selectedLongitude = persons[index].longitude
                }
                self.persons = persons
            }
        }
    }
    
    private func getPersonItems(fromPersons persons: [Person]) -> [PersonItem] {
        return persons.map { (person) -> PersonItem in
            let displayName = "\(person.name) \(person.lastname)"
            let distance = gpsService.getDistance(
                latitudeFrom: selectedLatitude,
                longitudeFrom: selectedLongitude,
                latitudeTo: person.latitude,
                longitudeTo: person.longitude)
            let distanceMeters = distance!
            let distanceKilometers = Double(Int(distanceMeters / 100))/10
            return PersonItem(
                name: displayName,
                distance: "\(distanceKilometers) км",
                imageUrl: person.imageUrl
            )
        }
    }
    
    
}
