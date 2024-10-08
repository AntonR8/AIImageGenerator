//
//  ViewModel.swift
//  AIImageGenerator
//
//  Created by Антон Разгуляев on 12.09.2024.
//

import SwiftUI
import AppTrackingTransparency
import ApphudSDK
import StoreKit

class ViewModel: ObservableObject {

    // Paywall
    @Published var products: [ApphudProduct] = []
    @Published var chosenSubscription: ApphudProduct?
    @AppStorage("firstLaunch") var firstLaunch = true
    @Published var proSubscriptionBought = false
    @Published var showSubscriptionSheet = false
    @Published var showInGeneratingVIewSubscriptionSheet = false
    @Published var firstLaunchPaywall = true

    // DownLoading
    let downloadManager = DownloadManager()
    @Published var curentPromt = ""
    @Published var curentNegativePromt = ""
    @Published var styleChosen: ImageStyle?
    @Published var imageURLs: [String] = []
    @Published var requestError = false

    // GeneratingView
    @AppStorage("freeGenerationsLeft") var freeGenerationsLeft = 3
    @Published var isGenerating = false
    @State var timer: Timer?
    @State var speed: Double = 0.5
    @Published var completed: TimeInterval = 100

    // Navigation
    @Published var tabSelection = 1
    @Published var path = NavigationPath()
    @Published var inspirationChosen = true

    // Views
    @Published var notificationsTurnedON = false {
        didSet {requestAuthorization()}
    }
    @Published var recents: [String] = [] {
        didSet {saveRecents()}
    }
    @Published var hardCodeImages: [HardCodeImageModel] = []
    @Published var savedHardCodeImages: [HardCodeImageModel] = [] {
        didSet {saveHardCodeSaved()        }
    }
    @Published var savedAssyncImages: [String] = [] {
        didSet {saveAssyncImagesSaved()}
    }

    // MARK: - init
    init() {
        Task {
            await Apphud.start(apiKey: "app_4NRvpYLT2p4DQYbuDiV2yk3Bw6YUhn")
            await loadProducts()
        }

        self.proSubscriptionBought = Apphud.hasActiveSubscription()

        getHardCodeImages()

        guard
            let recentsData = UserDefaults.standard.data(forKey: "Recents"),
            let decodedRecents = try? JSONDecoder().decode([String].self, from: recentsData)
        else { return }
        self.recents = decodedRecents

        guard
            let savedHardCodeImagesData = UserDefaults.standard.data(forKey: "SavedHardCodeImages"),
            let decodedsavedHardCodeImages = try? JSONDecoder().decode([HardCodeImageModel].self, from: savedHardCodeImagesData)
        else { return }
        self.savedHardCodeImages = decodedsavedHardCodeImages

        guard
            let savedAssyncImagesData = UserDefaults.standard.data(forKey: "savedAssyncImages"),
            let decodedsavedAssyncImages = try? JSONDecoder().decode([String].self, from: savedAssyncImagesData)
        else { return }
        self.savedAssyncImages = decodedsavedAssyncImages
    }


    // MARK: - Functions

    // Paywall
    func loadProducts() async {
        async let loadedPlacement = await Apphud.placement("PlacementOnBoarding")
        let myPlacement = await loadedPlacement

        await MainActor.run {
            self.products = myPlacement?.paywall?.products ?? []
            if !products.isEmpty {
                self.chosenSubscription = products[2]
                print("По умолчанию задан продукт: \(chosenSubscription?.name ?? "не задан")")
            }
        }
        print("products successfully fetched: \(products.map { $0.name })")
    }

    func makePurchase(product: ApphudProduct?) {
        Task {
            if let product {
                await Apphud.purchase(product) { result in
                    if result.success {
                        print("Purchase successful")
                        self.proSubscriptionBought = true
                    }
                }
            }
        }
    }


    // init
    func getHardCodeImages() {
        var arrayOfImages: [HardCodeImageModel] = []
        DispatchQueue.global().async{
            for i in (0...55) {
                let newImage = HardCodeImageModel(imageName: "image\(i+1)", prompt: Prompts().prompts[i], style: Prompts().arts[i])
                arrayOfImages.append(newImage)
            }
            DispatchQueue.main.async{
                self.hardCodeImages = arrayOfImages
            }
        }
    }


    // View
    func saveRecents() {
        let encodedRecents = try? JSONEncoder().encode(recents)
        UserDefaults.standard.setValue(encodedRecents, forKey: "Recents")
    }

    func saveHardCodeSaved() {
        let encodedSavedImages = try? JSONEncoder().encode(savedHardCodeImages)
        UserDefaults.standard.setValue(encodedSavedImages, forKey: "SavedHardCodeImages")
    }

    func saveAssyncImagesSaved() {
        let encodedSavedImages = try? JSONEncoder().encode(savedAssyncImages)
        UserDefaults.standard.setValue(encodedSavedImages, forKey: "savedAssyncImages")
    }

    func saveAsyncImageToGallery(imageURL: String) async {
        if let url = URL(string: imageURL),
           let data = try? await URLSession.shared.data(from: url),
           let image = UIImage(data: data.0) {
            UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        }
    }

    func saveHardCodeImageToGallery(inputImage: UIImage) {
            UIImageWriteToSavedPhotosAlbum(inputImage, nil, nil, nil)
    }

    func copyPrompt(newPrompt: String) {
        curentPromt = newPrompt
    }

    func returnHardCodeImageIndex(image: HardCodeImageModel) -> Int? {
        return hardCodeImages.firstIndex(where: {$0.id == image.id})
    }

    func addOrDeleteHardCodeImageToFavourites(index: Int?) {
        if let index {
            hardCodeImages[index] = hardCodeImages[index].addOrDeleteHardCodeImageToFavourites()
        } else { return }
    }

    func addToFavourites(image: HardCodeImageModel) {
        savedHardCodeImages.append(image)
    }

    func addToFavourites(imageURL: String) {
        savedAssyncImages.append(imageURL)
    }

    func createButtonPushed() {
        if proSubscriptionBought {
            generateImage()
        } else {
            if freeGenerationsLeft > 0 {
                generateImage()
            } else {
                showSubscriptionSheet = true
            }
        }
    }

    // DownLoading
    func generateImage() {
        Task {
            do {
                async let requestID = try await self.downloadManager.getRequestID(prompt: curentPromt, selectedStyle: styleChosen ?? .none)
                let response = try await downloadManager.returnNotEmptyResponse(receivedRequestID: requestID)
                 let imageURLs = downloadManager.getImageURLs(response: response)
                await MainActor.run {
                    self.imageURLs = imageURLs
                    self.completed = 0
                    self.path.append("asdf")
                    self.isGenerating = false
                    self.completed = 100
                    for item in response.data.result {
                        self.recents.append(item.url)
                    }
                    self.freeGenerationsLeft -= 1
                }
            } catch {
                print("Request failed with error: \(error)")
                await MainActor.run {
                    requestError = true
                }
            }
        }
    }

    // GeneratingView
   func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { _ in
            if self.completed > 0 {
                self.completed -= 1
            } else {
                self.stopTimer()
            }
        }
    }

    func stopTimer() {
        timer?.invalidate()
    }


    // Navigation
    func returnNavigationTitle() -> String {
        switch tabSelection {
        case 1: return "AI Art"
        case 2: return "Remove BG"
        case 3: return "Explore"
        case 4: return "Saved"
        default: return ""
        }
    }

    
    // Notifications
    func requestAuthorization() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { success, error in
            if let error = error {
                print("Ошибка или отказ: \(error)")
            } else {
                switch success {
                case true:
                    print("Запрос на отправку уведомлений одобрен")
                    self.notificationsTurnedON = true
                case false: print("Запрос на отправку уведомлений отклонен")
                }
            }
        }
    }

}
