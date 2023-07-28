//
//  ConditionsTreatedView.swift
//  H&I Personalized Medicine
//
//  Created by Marcus Grant on 8/11/22.
//

import SwiftUI

struct ConditionsTreatedView: View {
    var body: some View {
        VStack(spacing: -20) {
            HStack {
                Text("Conditions We Treat:")
                    .fontWeight(.bold)
                Spacer()
                Text("")
            }
            .padding(20)
            .font(.system(size: 22, weight: .bold))
            .foregroundColor(.black)
            .background(Color.white)
            .offset(x: 0, y: 10)
            .padding(17)
        
        LazyVStack {
           ConditionsTreatedRow()
            ConditionsTreatedRow2()
            ConditionsTreatedRow3()
            ConditionsTreatedRow4()
            ConditionsTreatedRow5()
            ConditionsTreatedRow6()
            ConditionsTreatedRow7()
            ConditionsTreatedRow8()
            ConditionsTreatedRow9()
        }
        .background(Color.white)
        .cornerRadius(20)
        .padding(.horizontal)
        .shadow(radius: 3)
    }
}
}

struct ConditionsTreatedRow: View {
    var body: some View {
        HStack {
            Image("Conditions logo1")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
                .padding(5)
            VStack(alignment: .leading) {
                Text("Autoimmune")
                    .font(.headline)
                Text("")
                    .font(.caption)
                    .foregroundColor(Color(.secondaryLabel))
            }
            Spacer()
            Text("")
                .font(.headline)
        }
        .padding(8)
    }
}

struct ConditionsTreatedView_Previews: PreviewProvider {
    static var previews: some View {
        ConditionsTreatedView()
    }
}

struct ConditionsTreatedRow2: View {
    var body: some View {
        HStack {
            Image("Conditions logo2")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
                .padding(5)
            VStack(alignment: .leading) {
                Text("Inflammation")
                    .font(.headline)
                Text("")
                    .font(.caption)
                    .foregroundColor(Color(.secondaryLabel))
            }
            Spacer()
            Text("")
                .font(.headline)
        }
        .padding(8)
    }
}
struct ConditionsTreatedRow3: View {
    var body: some View {
        HStack {
            Image("Conditions logo3")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
                .padding(5)
            VStack(alignment: .leading) {
                Text("Hormonal Health")
                    .font(.headline)
                Text("")
                    .font(.caption)
                    .foregroundColor(Color(.secondaryLabel))
            }
            Spacer()
            Text("")
                .font(.headline)
        }
        .padding(8)
    }
}
struct ConditionsTreatedRow4: View {
    var body: some View {
        HStack {
            Image("Conditions logo4")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
                .padding(5)
            VStack(alignment: .leading) {
                Text("Metabolic Health")
                    .font(.headline)
                Text("")
                    .font(.caption)
                    .foregroundColor(Color(.secondaryLabel))
            }
            Spacer()
            Text("")
                .font(.headline)
        }
        .padding(8)
    }
}
struct ConditionsTreatedRow5: View {
    var body: some View {
        HStack {
            Image("Conditions logo5")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
                .padding(5)
            VStack(alignment: .leading) {
                Text("Cardiovascular Health")
                    .font(.headline)
                Text("")
                    .font(.caption)
                    .foregroundColor(Color(.secondaryLabel))
            }
            Spacer()
            Text("")
                .font(.headline)
        }
        .padding(8)
    }
}
struct ConditionsTreatedRow6: View {
    var body: some View {
        HStack {
            Image("Conditions logo6")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
                .padding(5)
            VStack(alignment: .leading) {
                Text("Digestive Health")
                    .font(.headline)
                Text("")
                    .font(.caption)
                    .foregroundColor(Color(.secondaryLabel))
            }
            Spacer()
            Text("")
                .font(.headline)
        }
        .padding(8)
    }
}
struct ConditionsTreatedRow7: View {
    var body: some View {
        HStack {
            Image("Conditions logo7")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
                .padding(5)
            VStack(alignment: .leading) {
                Text("Dermatological Health")
                    .font(.headline)
                Text("")
                    .font(.caption)
                    .foregroundColor(Color(.secondaryLabel))
            }
            Spacer()
            Text("")
                .font(.headline)
        }
        .padding(8)
    }
}
struct ConditionsTreatedRow8: View {
    var body: some View {
        HStack {
            Image("Conditions logo8")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
                .padding(5)
            VStack(alignment: .leading) {
                Text("Weight Health")
                    .font(.headline)
                Text("")
                    .font(.caption)
                    .foregroundColor(Color(.secondaryLabel))
            }
            Spacer()
            Text("")
                .font(.headline)
        }
        .padding(8)
    }
}
struct ConditionsTreatedRow9: View {
    var body: some View {
        HStack {
            Image("Conditions logo9")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
                .padding(5)
            VStack(alignment: .leading) {
                Text("Mental Health")
                    .font(.headline)
                Text("")
                    .font(.caption)
                    .foregroundColor(Color(.secondaryLabel))
            }
            Spacer()
            Text("")
                .font(.headline)
        }
        .padding(8)
    }
}
