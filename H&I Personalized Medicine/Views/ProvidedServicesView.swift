//
//  ProvidedServicesView.swift
//  H&I Personalized Medicine
//
//  Created by Marcus Grant on 8/9/22.
//

import SwiftUI

struct ProvidedServicesView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Spacer()
                Image("Services logoV1")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 30, height: 10)
                    .padding()
                    .foregroundColor(.white)
                    .cornerRadius(5)
            }
            Text("Laboratory  Tests")
                .fontWeight(.bold)
//            HStack {
//                Text("USD")
//                    .font(.caption)
//                Text("$13.00")
//                    .font(.headline)
//            }
            .padding(.bottom)
//            Text("********** 3022")
//                .font(.caption)
//                .padding(.vertical)
        }
        .padding(8)
        .background(Color.white)
        .cornerRadius(20)
        .frame(width: 130, height: 130)
    }
}

struct ProvidedServicesView_Previews: PreviewProvider {
    static var previews: some View {
        ProvidedServicesView()
//        ProvidedServicesView2()
//        ProvidedServicesView3()
//        ProvidedServicesView4()
//          ProvidedServicesView5()
    }
}

struct ProvidedServicesView2: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Spacer()
                Image("Services logoV2")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 30, height: 10)
                    .padding()
                    .foregroundColor(.white)
                    .cornerRadius(5)
            }
            Text("""
            Wellness
            Assessment
            """)
            .fontWeight(.semibold)
//            HStack {
//                Text("USD")
//                    .font(.caption)
//                Text("$13.00")
//                    .font(.headline)
//            }
            .padding(.bottom)
        }
        .padding(8)
        .background(Color.white)
        .cornerRadius(20)
        .frame(width: 130, height: 130)
    }
}

struct ProvidedServicesView3: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Spacer()
                Image("Services logoV3")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 30, height: 10)
                    .padding()
                    .foregroundColor(.white)
                    .cornerRadius(5)
            }
            Text("""
            Analytical
            Softwares
            """)
            .fontWeight(.semibold)
//            HStack {
//                Text("USD")
//                    .font(.caption)
//                Text("$13.00")
//                    .font(.headline)
//            }
            .padding(.bottom)
        }
        .padding(8)
        .background(Color.white)
        .cornerRadius(20)
        .frame(width: 130, height: 130)
    }
}

struct ProvidedServicesView4: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Spacer()
                Image("Services logoV4")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 30, height: 10)
                    .padding()
                    .foregroundColor(.white)
                    .cornerRadius(5)
            }
            Text("""
            Personalized
            Treatment
            """)
            .fontWeight(.bold)
//            HStack {
//                Text("USD")
//                    .font(.caption)
//                Text("$13.00")
//                    .font(.headline)
//            }
            .padding(.bottom)
        }
        .padding(8)
        .background(Color.white)
        .cornerRadius(20)
        .frame(width: 130, height: 130)
    }
}

struct ProvidedServicesView5: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Spacer()
                Image("Services logoV5")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 30, height: 10)
                    .padding()
                    .foregroundColor(.white)
                    .cornerRadius(5)
            }
            Text("""
            Telehealth
            Services
            """)
            .fontWeight(.bold)
//            HStack {
//                Text("USD")
//                    .font(.caption)
//                Text("$13.00")
//                    .font(.headline)
//            }
            .padding(.bottom)
        }
        .padding(8)
        .background(Color.white)
        .cornerRadius(20)
        .frame(width: 130, height: 130)
    }
}
