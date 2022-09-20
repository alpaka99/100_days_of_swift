//
//  EditView.swift
//  [220920] swift_day_71
//
//  Created by user on 2022/09/20.
//

import SwiftUI

struct EditView: View {
    enum LoadingState {
        case loading, loaded, failed
    }
    
    @Environment(\.dismiss) var dismiss
    var location: Location

    @State private var name: String
    @State private var description: String
    
    @State private var loadingState = LoadingState.loading
    @State private var pages = [Page]()
    
    var onSave: (Location) -> Void

       var body: some View {
           NavigationView {
               Form {
                   Section {
                       TextField("Place name", text: $name)
                       TextField("Description", text: $description)
                   }
                   
                   Section("Nearby_") {
                       switch loadingState {
                       case .loading:
                           Text("Loading...")
                       case .loaded:
                           ForEach(pages, id: \.pageid) { page in
                               Text(page.title)
                                   .font(.headline)
                               + Text(": ")
                               + Text("\(page.description)")
                                   .italic()
                           }
                       case .failed:
                           Text("Please try again later")
                       }
                   }
               }
               .navigationTitle("Place details")
               .toolbar {
                   Button("Save") {
                       var newLocation = location
                       newLocation.id = UUID()
                       newLocation.name = name
                       newLocation.description = description

                        onSave(newLocation)
                        dismiss()
                   }
               }
               .task {
                   await fetchNearbyPlaces()
               }
           }
       }
    
    
    init(location: Location, onSave: @escaping (Location) -> Void) {
        self.location = location
        self.onSave = onSave

        _name = State(initialValue: location.name)
        _description = State(initialValue: location.description)
    }
    
    func fetchNearbyPlaces() async {
        let urlString = "https://ko.wikipedia.org/w/api.php?ggscoord=\(location.coordinate.latitude)%7C\(location.coordinate.longitude)&action=query&prop=coordinates%7Cpageimages%7Cpageterms&colimit=50&piprop=thumbnail&pithumbsize=500&pilimit=50&wbptterms=description&generator=geosearch&ggsradius=10000&ggslimit=50&format=json"
        
        guard let url = URL(string: urlString) else {
            print("Bad URL: \(urlString)")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let item = try JSONDecoder().decode(Result.self, from: data)
            pages = item.query.pages.values.sorted()
            loadingState = .loaded
        } catch {
            loadingState = .failed
            print(error.localizedDescription)
        }
    }
}

//struct EditView_Previews: PreviewProvider {
//    static var previews: some View {
//        EditView()
//    }
//}
