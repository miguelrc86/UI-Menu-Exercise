//
//  UIDemo
//
//  Created by Miguel D Rojas Cortés on 4/14/19.
//  Copyright © 2019 MRC. All rights reserved.
//

import Foundation

struct Event: Codable {
    var events: [EventDetail]
}

struct EventDetail: Codable {
    var name: String?
    var description: String?
    var image: String?
}

struct DetailViewModel {
    
    var selectedOption: MenuOption = .option1
    private var eventsData: Event?
    
    init() {
        if let url = Bundle.main.url(forResource: "ImsaData", withExtension: ".json") {
            do {
                let jsonData = try Data(contentsOf: url)
                eventsData = try JSONDecoder().decode(Event.self, from: jsonData)
            } catch let error {
                print(error.localizedDescription)
            }
        }
    }
    
    func numberOfEvents() -> Int {
        return eventsData?.events.count ?? 0
    }
    
    func model(at index: Int) -> EventDetail? {
        return eventsData?.events[index]
    }
    
}
