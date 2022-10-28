//
//  ContentView.swift
//  [221027] swift_day_98
//
//  Created by user on 2022/10/27.
//

import SwiftUI

extension View {
    @ViewBuilder func phoneOnlyStackNavigationView() -> some View {
        if UIDevice.current.userInterfaceIdiom == .phone {
            self.navigationViewStyle(.stack)
        } else {
            self
        }
    }
}

struct ContentView: View {
    let resorts: [Resort] = Bundle.main.decode("resorts.json")
    
    @State private var sortedResorts = [Resort]()
    
    @State private var searchText = ""
    
    @StateObject var favorites = Favorites()
    
    @State private var sortingStandard = "byDefault"
    let sortingKeys = ["byDefault", "byAlphabet", "byCountry"]
    var body: some View {
        NavigationView {
            VStack {
                Picker("Sort by", selection: $sortingStandard) {
                    ForEach(sortingKeys, id: \.self) { key in
                        Text(key)
                    }
                }
                .pickerStyle(.segmented)
                .onChange(of: sortingStandard) { sortStd in
                    sortResort(sortStd)
                }
                
                List(filteredResort) { resort in
                    NavigationLink {
                        ResortView(resort: resort)
                    } label: {
                        HStack {
                            Image(resort.country)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 25)
                                .clipShape(RoundedRectangle(cornerRadius: 5))
                                .overlay {
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(.black, lineWidth: 1)
                                }
                            
                            VStack(alignment: .leading) {
                                Text(resort.name)
                                    .font(.headline)
                                Text("\(resort.runs)")
                                    .foregroundColor(.secondary)
                            }
                            
                            if favorites.contains(resort) {
                                Spacer()
                                Image(systemName: "heart.fill")
                                    .accessibilityLabel("This is a favorite resort")
                                    .foregroundColor(.red)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Resorts")
            .searchable(text: $searchText, prompt: "Search for a resort")
            
//            Welcome()
        }
        .onAppear {
            sortResort("byDefault")
        }
        .environmentObject(favorites)
//        .phoneOnlyStackNavigationView()
    }
    
    var filteredResort: [Resort] {
        if searchText.isEmpty {
            return sortedResorts
        } else {
            return sortedResorts.filter{ $0.name.localizedCaseInsensitiveContains(searchText)}
        }
    }
    
    func sortResort(_ key: String) {
        switch key {
        case "byAlphabet":
            sortedResorts = resorts.sorted { $0.name < $1.name}
        case "byCountry":
            sortedResorts = resorts.sorted { $0.country < $1.country}
        default:
            sortedResorts = resorts
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
