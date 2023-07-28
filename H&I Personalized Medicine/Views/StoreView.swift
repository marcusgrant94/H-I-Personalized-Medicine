//
//  StoreView.swift
//  H&I Personalized Medicine
//
//  Created by Marcus Grant on 10/21/22.
//

import SwiftUI

//struct StoreView: View {
//
//    @StateObject var cartManager = CartManager()
//    var columns = [GridItem(.adaptive(minimum: 160), spacing: 20)]
//
//    var body: some View {
//        NavigationView {
//            ScrollView {
//
//                NavigationLink(destination: ProductDetailedView(product: productList[0]), label: {
//                    LazyVGrid(columns: columns, spacing: 62) {
//                        ForEach(productList, id: \.id) { product in
//                            ProductCard(product: product)
//                                .environmentObject(cartManager)
//                        }
//                    }
//                    .padding()
//                })
//
//            }
//            .navigationTitle(Text("Shop"))
//            .toolbar {
//                NavigationLink {
//                    CartView()
//                        .environmentObject(cartManager)
//                } label: {
//                    CartButton(numberOfProducts: cartManager.products.count)
//                }
//            }
//        }
//    }
//}
//
//struct StoreView_Previews: PreviewProvider {
//    static var previews: some View {
//        StoreView()
//    }
//}
//
//struct SearchView: View {
//
//    @Binding var search: String
//
//    var body: some View {
//        HStack {
//            Image(systemName: "magnifyingglass")
//                .padding(.trailing, 8)
//            TextField("Search for product or category", text: $search)
//        }
//        .padding(.all, 15)
//        .background(.white)
//        .cornerRadius(10)
//        .shadow(radius: 2)
//        .padding()
//    }
//}
