//
//  WaterLogsView.swift
//  H&I Personalized Medicine
//
//  Created by Marcus Grant on 7/20/23.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore

struct WaterLogsView: View {
    @ObservedObject var waterLogViewModel: WaterLogViewModel
    @EnvironmentObject var userViewModel: UsersViewModel // assumes you're passing the UserViewModel as an environment object
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }()


    var body: some View {
        VStack {
            HStack {
                Text("Logs")
                    .bold()
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                    .padding()
                NavigationLink(destination: AddWaterView(waterLogViewModel: waterLogViewModel)) {
                    Text("+ Add Water")
                }
                .padding()
            }
            List {
                ForEach(waterLogViewModel.logs.indices, id: \.self) { index in
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Date: \(waterLogViewModel.logs[index].date, formatter: dateFormatter)")
                            .font(.headline)
                        Text("Unit: \(waterLogViewModel.logs[index].unit)")
                        Text("Amount: \(waterLogViewModel.logs[index].amount)")
                    }
                    .padding()
                    .background(Color(.systemGray6)) // Choose the color that suits your app theme
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    .padding(.horizontal)
                }
            }
        }
            .navigationTitle("Water")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                        waterLogViewModel.fetchWaterLogs(forUserWithID: waterLogViewModel.userID)
                    }
        }
    }
