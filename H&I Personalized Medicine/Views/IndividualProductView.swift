//
//  IndividualProductView.swift
//  H&I Personalized Medicine
//
//  Created by Marcus Grant on 11/27/22.
//

//import SwiftUI
//
//struct IndividualProductView: View {
//    @StateObject var cartManager = CartManager()
//    @State var search = ""
//
//    var body: some View {
////
////        NavigationView {
////            ScrollView {
////
////                Text("Please note: Not all products are available in our app. Please visit our website for the full catalog of products.")
////                    .font(.caption)
////                    .fontWeight(.semibold)
////                    .padding(15)
////
////                Text("Reccomended Products:")
////                    .frame(maxWidth: .infinity, alignment: .leading)
////                    .font(.title3)
////                    .fontWeight(.bold)
////                    .padding()
////
////
////                VStack(spacing: 55) {
////                    HStack(spacing: 15) {
////                        NavigationLink(destination: ProductDetailedView(product: productList[0]), label: {
////                            ProductCard(product: productList[0])
////                        })
////                        NavigationLink(destination: ProductDetailedView(product: productList[1]), label: {
////                            ProductCard(product: productList[1])
////                        })
////                    }
////                    HStack(spacing: 15) {
////                        NavigationLink(destination: ProductDetailedView(product: productList[2]), label: {
////                            ProductCard(product: productList[2])
////                        })
////                        NavigationLink(destination: ProductDetailedView(product: productList[3]), label: {
////                            ProductCard(product: productList[3])
////                        })
////                    }
////                    HStack(spacing: 15) {
////                        NavigationLink(destination: ProductDetailedView(product: productList[4]), label: {
////                            ProductCard(product: productList[4])
////                        })
////                        NavigationLink(destination: ProductDetailedView(product: productList[5]), label: {
////                            ProductCard(product: productList[5])
////                        })
////                    }
////                    HStack(spacing: 15) {
////                        NavigationLink(destination: ProductDetailedView(product: productList[6]), label: {
////                            ProductCard(product: productList[6])
////                        })
////                        NavigationLink(destination: ProductDetailedView(product: productList[7]), label: {
////                            ProductCard(product: productList[7])
////                        })
////                    }
////                    HStack {
////                        NavigationLink(destination: ProductDetailedView(product: productList[8]), label: {
////                            ProductCard(product: productList[8])
////                        })
////                        NavigationLink(destination: ProductDetailedView(product: productList[9]), label: {
////                            ProductCard(product: productList[9])
////                        })
////                    }
////                    HStack {
////                        NavigationLink(destination: ProductDetailedView(product: productList[10]), label: {
////                            ProductCard(product: productList[10])
////                        })
////                        NavigationLink(destination: ProductDetailedView(product: productList[11]), label: {
////                            ProductCard(product: productList[11])
////                        })
////                    }
////                    HStack {
////                        NavigationLink(destination: ProductDetailedView(product: productList[12]), label: {
////                            ProductCard(product: productList[12])
////                        })
////                        NavigationLink(destination: ProductDetailedView(product: productList[13]), label: {
////                            ProductCard(product: productList[13])
////                        })
////                    }
////
////                }
////                .environmentObject(cartManager)
////
////            }
////            .navigationTitle("Shop")
////            .toolbar {
////                if cartManager.products.isEmpty {
////                    NavigationLink {
////                        CartView()
////                            .environmentObject(cartManager)
////                    } label: {
////                        CartButton(numberOfProducts: cartManager.products.count)
////                    }
////                    .disabled(true)
////                } else {
////                    NavigationLink {
////                        CartView()
////                            .environmentObject(cartManager)
////                    } label: {
////                        CartButton(numberOfProducts: cartManager.products.count)
////                    }
////                }
////            }
////        }
//    }
//}
//
//struct IndividualProductView_Previews: PreviewProvider {
//    static var previews: some View {
//        IndividualProductView()
//    }
//}
