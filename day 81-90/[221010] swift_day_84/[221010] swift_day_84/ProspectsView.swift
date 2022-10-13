//
//  ProspectsView.swift
//  [221010] swift_day_84
//
//  Created by user on 2022/10/10.
//

import SwiftUI
import CodeScanner
import UserNotifications

struct ProspectsView: View {
    enum FilterType {
        case none, contacted, uncontacted
    }
    
    let filter: FilterType
    
    @EnvironmentObject var prospects: Prospects
    
    @State private var isShowingScanner = false
    @State private var isShowingConfirmationDialog = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(filteredProspects) { prospect in
                    HStack {
                        if filter == .none {
                            if prospect.isContacted {
                                Image(systemName: "person.crop.circle.fill.badge.checkmark")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width:50, height: 50)
                                    .foregroundColor(.blue)
                            } else {
                                Image(systemName: "person.crop.circle.badge.xmark")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 50)
                                    .foregroundColor(.orange)
                            }
                        }
                        VStack(alignment: .leading) {
                            Text(prospect.name)
                                .font(.headline)
                            Text(prospect.emailAddress)
                                .foregroundColor(.secondary)
                            Text("\(prospect.created)")
                                .font(.body)
                        }
                    }
                        .swipeActions {
                            if prospect.isContacted {
                                Button {
                                    prospects.toggle(prospect)
                                } label: {
                                    Label("Mark Uncontacted", systemImage: "person.crop.circle.badge.xmark")
                                    }
                                .tint(.blue)
                                } else {
                                    Button {
                                        prospects.toggle(prospect)
                                    } label: {
                                        Label("Mark Contacted", systemImage: "person.crop.circle.fill.badge.checkmark")
                                    }
                                    .tint(.green)
                                    
                                    Button {
                                        addNotification(for: prospect)
                                    } label: {
                                        Label("Remind Me", systemImage: "bell")
                                    }
                                    .tint(.orange)
                            }
                        }
                    }
            }
                .navigationTitle(title)
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        Button {
                            isShowingConfirmationDialog = true
                        } label: {
                            Label("Sort", systemImage: "pencil")
                        }
                        
                        Spacer()
                        
                        Button {
                            isShowingScanner = true
                        } label: {
                            Label("Scan", systemImage: "qrcode.viewfinder")
                        }
                    }
                }
                .sheet(isPresented: $isShowingScanner) {
                    CodeScannerView(codeTypes: [.qr],simulatedData: "PaulHudson\npaul@hackingwiththeswift.com", completion: handleScan)
                }
                .confirmationDialog("How to Sort prospects??",isPresented: $isShowingConfirmationDialog){
                    Button("By name") {
                        prospects.sortByName()
                    }
                    
                    Button("By most recent") {
                        prospects.sortByMostRecent()
                    }
                }
                
        }
    }
    
    var title: String {
        switch filter {
        case .none:
            return "Everyone"
        case .contacted:
            return "Contacted people"
        case .uncontacted:
            return "Uncontacted people"
        }
    }
    
    var filteredProspects: [Prospect] {
        switch filter {
        case .none:
            return prospects.people
        case .contacted:
            return prospects.people.filter { $0.isContacted }
        case .uncontacted:
            return prospects.people.filter { !$0.isContacted }
        }
    }
    
    func handleScan(result: Result<ScanResult, ScanError>) {
        isShowingScanner = false
        // more code to come
        switch result {
        case .success(let result):
            let details = result.string.components(separatedBy: "\n")
            guard details.count == 2 else { return }
            
            let person = Prospect()
            person.name = details[0]
            person.emailAddress = details[1]
            
            prospects.add(person)
            
            
        case .failure(let error):
            print("Scanning failed: \(error.localizedDescription)")
        }
    }
    
    func addNotification(for prospect: Prospect) {
        let center = UNUserNotificationCenter.current()
        
        let addRequest = {
            let content = UNMutableNotificationContent()
            content.title = "Contact \(prospect.name)"
            content.subtitle = prospect.emailAddress
            content.sound = UNNotificationSound.default
            
            var dateComponents = DateComponents()
            dateComponents.hour = 9
//            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
            
            let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
            center.add(request)
        }
        
        // more code to come
        center.getNotificationSettings { settings in
            if settings.authorizationStatus == .authorized {
                addRequest()
            } else {
                center.requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    if success {
                        addRequest()
                    } else {
                        print(error?.localizedDescription)
                    }
                }
            }
        }
    }
}

struct ProspectsView_Previews: PreviewProvider {
    static var previews: some View {
        ProspectsView(filter: .none)
    }
}
