//
//  ProfileViewModel.swift
//  iOS-FakeNFT-Extended
//
//  Created by Hajime4life on 22.10.2025.
//

import SwiftUI

@MainActor
@Observable
final class ProfileViewModel: ObservableObject {
    private let profileService: ProfileServiceImpl
    
    private(set) var user: User?
    private(set) var editingUser: User?
    private(set) var isSaveInProgress: Bool = false
    var wantExitHasChanges: Bool = false
    var needToShowContextMenu: Bool = false
    var needToshowSiteEditAlert: Bool = false
    var shouldShowSaveButton: Bool = false
    var temporaryAvatarUrl: String = ""
    
    init(profileService: ProfileServiceImpl) {
        self.profileService = profileService
    }
    
    func showContextMenu() {
        needToShowContextMenu = true
    }
    
    func hideContextMenu() {
        needToShowContextMenu = false
    }
    
    func showSiteEditAlert() {
        temporaryAvatarUrl = editingUser?.avatar?.absoluteString ?? ""
        needToshowSiteEditAlert = true
    }
    
    func hideSiteEditAlert() {
        needToshowSiteEditAlert = false
        temporaryAvatarUrl = ""
    }
    
    func setAvatarToDefault() {
        editingUser?.avatar = user?.avatar
        temporaryAvatarUrl = ""
        updateSaveButton()
    }
    
    func applyAvatarUrl() {
        if let url = URL(string: temporaryAvatarUrl), url.scheme != nil {
            editingUser?.avatar = url
        } else {
            editingUser?.avatar = nil
        }
        temporaryAvatarUrl = ""
        updateSaveButton()
    }
    
    func loadProfile() async {
        do {
            self.user = try await profileService.loadProfile()
            self.editingUser = user
            shouldShowSaveButton = false
        } catch {
            print("Failed to load profile: \(error)")
        }
    }
    
    func setUserToDefault() {
        editingUser = user
        shouldShowSaveButton = false
    }
    
    func hasChanges() -> Bool {
        guard let user = user, let editingUser = editingUser else { return false }
        return user != editingUser
    }
    
    func saveProfile() async {
        // guard let editingUser = editingUser else { return }
        // isSaveInProgress = true
        // defer { isSaveInProgress = false }
        
        // do {
        //     try await profileService.updateProfile(editingUser)
        //     self.user = editingUser
        //     shouldShowSaveButton = false
        // } catch {
        //     print("Failed to save profile: \(error)")
        // }
    }
    
    func deleteAvatar() {
        editingUser?.avatar = nil
        updateSaveButton()
    }
    
    func checkExit() {
        wantExitHasChanges = hasChanges()
    }
    
    func cancelExit() {
        wantExitHasChanges = false
    }
    
    private func updateSaveButton() {
        shouldShowSaveButton = hasChanges()
    }
    
    var nameBinding: Binding<String> {
        Binding(
            get: { self.editingUser?.name ?? "" },
            set: { newValue in
                self.editingUser?.name = newValue
                self.updateSaveButton()
            }
        )
    }
    
    var descriptionBinding: Binding<String> {
        Binding(
            get: { self.editingUser?.description ?? "" },
            set: { newValue in
                self.editingUser?.description = newValue.isEmpty ? nil : newValue
                self.updateSaveButton()
            }
        )
    }
    
    var websiteBinding: Binding<String> {
        Binding(
            get: { self.editingUser?.website?.absoluteString ?? "" },
            set: { newValue in
                self.editingUser?.website = URL(string: newValue)
                self.updateSaveButton()
            }
        )
    }
    
    var avatarBinding: Binding<String> {
        Binding(
            get: { self.temporaryAvatarUrl },
            set: { newValue in
                self.temporaryAvatarUrl = newValue
            }
        )
    }
}
