//
//  NFTCollectionsListView.swift
//  iOS-FakeNFT-Extended
//
//  Created by Vladimir on 15.10.2025.
//  Copyright © 2025 com.example. All rights reserved.
//

import SwiftUI

struct NFTCollectionsListView: View {

    @State private var viewModel: NFTCollectionsListViewModel
    @State private var isSelectingSortingType = false

    var body: some View {
        scrollView
            .overlay {
                ProgressView()
                    .tint(.ypBlack)
                    .background {
                        RoundedRectangle(cornerRadius: 5)
                            .fill(Color.ypUGrey)
                            .opacity(0.5)
                            .scaleEffect(2)
                    }
                    .scaleEffect(1.5)
                    .opacity(viewModel.state == .loading ? 1 : 0)
            }
            .navigationTitle("Lmao")
            .confirmationDialog(
                "sorting",
                isPresented: $isSelectingSortingType
            ) {
                ForEach(CatalogSorting.allCases) { sorting in
                    Button(sorting.description) {
                        viewModel.sort(by: sorting)
                    }
                }
            } message: {
                Text(NSLocalizedString("Catalog.Sorting", comment: ""))
            }
            .toolbarPreference(imageName: .sort) {
                isSelectingSortingType = true
            }
            .onAppear {
                Task {
                    print("loading from start")
                    await viewModel.fetchNewCollections(number: 10)
                }
            }
    }

    var scrollView: some View {
        ScrollView {
            LazyVStack(spacing: 8) {
                ForEach(viewModel.collections) { collection in
                    button(for: collection)
                        .onAppear {
                            if collection == viewModel.collections.last {
                                Task {
                                    print("loading from list end")
                                    await viewModel.fetchNewCollections(number: 10)
                                }
                            }
                        }
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 20)
        }
        .background(.ypWhite)
    }

    private func button(for collection: NFTCollectionModel) -> some View {
        Button {
            print("\(collection) tapped")
        } label: {
            NFTCollectionCellView(collection: collection)
        }
        .buttonStyle(.plain)
    }

    init(viewModel: NFTCollectionsListViewModel) {
        self.viewModel = viewModel
    }

}

#Preview {

    NavigationStack {
        NFTCollectionsListView(
            viewModel: NFTCollectionsListViewModel(
                collectionsProvider: NFTCollectionsProvider()
            )
        )
    }

}
