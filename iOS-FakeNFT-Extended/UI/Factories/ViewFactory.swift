//
//  ViewFactory.swift
//  iOS-FakeNFT-Extended
//
//  Created by Симонов Иван Дмитриевич on 09.10.2025.
//

import SwiftUI

@MainActor
final class ViewFactory {
    private let rootCoordinator: any RootCoordinator
    
    init(rootCoordinator: any RootCoordinator) {
        self.rootCoordinator = rootCoordinator
    }
    
    // сюда добавляются все экраны, которые перекрывают tabView,
    // и относятся к navigationStack
    @ViewBuilder
    func makeScreenView(for screen: Screen) -> some View {
        let networkClient = DefaultNetworkClient()
        let profileService = ProfileServiceImpl(networkClient: networkClient)
        let nftStorage = NftStorageImpl()
        let nftService = NftServiceImpl(networkClient: networkClient, storage: nftStorage)
        let viewModel = ProfileViewModel(profileService: profileService, nftsService: nftService)
        let rootCoordinator = RootCoordinatorImpl()
        let profileCoordinator = ProfileCoordinatorImpl(rootCoordinator: rootCoordinator)
        switch screen {
            case .dummy:
                EmptyView()
            case .payment:
                EmptyView()
            case .web:
                EmptyView()
            case .successPayment:
                EmptyView()
            case .myNfts:
                MyNFTList()
                    .environmentObject(viewModel)
            case .favorites:
                FavoriteNFTsList()
                    .environmentObject(viewModel)
            case .profileEdit:
                ProfileEditView(coordinator: profileCoordinator)
                    .environmentObject(viewModel)
        }
    }
    // сюда вроде бы кроме корзины никто ничего не добавляет,
    // но мне эта заготовка нужна в корне проекта
    // в теории можно добавлять свои экраны, которые
    // накладываются сверху, а не через navigationStack
    @ViewBuilder
    func makeCoverView(for coverType: Cover) -> some View {
        switch coverType {
            case .dummy:
                EmptyView()
            case .deleteConfirmation:
                EmptyView()
        }
    }
    @ViewBuilder
    func makeTabView(for tab: Tab) -> some View {
        switch tab {
            case .catalog:
                TestCatalogView()
            case .cart:
                EmptyView()
            case .profile:
                let networkClient = DefaultNetworkClient()
                let profileService = ProfileServiceImpl(networkClient: networkClient) //MockProfileServiceImpl()
                let nftService = NftServiceImpl(networkClient: networkClient, storage: NftStorageImpl())
                let profileViewModel = ProfileViewModel(profileService: profileService, nftsService: nftService)
                let profileCoordinator = ProfileCoordinatorImpl(rootCoordinator: rootCoordinator)
                ProfileView(coordinator: profileCoordinator)
                    .environmentObject(profileViewModel)
            case .statistic:
                EmptyView()
        }
    }
}
