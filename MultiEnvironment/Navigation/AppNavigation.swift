//
//  AppNavigation.swift
//  MultiEnvironment
//
//  Created by Kwame on 12/02/2025.
//

import SwiftUI
import UIKit

/// Class to manages app-wide navigation.
class AppNavigation {
    static var shared = AppNavigation(startingRoute: .firstScreen(number: 2))
    let startingRoute: AppRoute

    init(navigationController: UINavigationController = .init(), startingRoute: AppRoute) {
        self.startingRoute = startingRoute
    }

    func startingViewController() -> UIViewController{
        let view = startingRoute.view()
        let navigationController: UINavigationController = .init()
        let viewWithCoordinator = view.environmentObject(navigationController)
        let viewController = UIHostingController(rootView: viewWithCoordinator)
        
        // we set starting route identifier to vc's restoration identifier
        viewController.restorationIdentifier = startingRoute.identifier
        navigationController.setViewControllers([viewController], animated: false)
        return navigationController
    }

    func present(_ route: AppRoute, source: UINavigationController, animated: Bool = true, modalPresentationStyle: UIModalPresentationStyle = .fullScreen) {
        let view = route.view()
        let destinationNavigationController: UINavigationController = .init()
        let viewWithNavigator = view.environmentObject(destinationNavigationController)
        let viewController = UIHostingController(rootView: viewWithNavigator)
        destinationNavigationController.modalPresentationStyle = modalPresentationStyle
        destinationNavigationController.setViewControllers([viewController], animated: animated)
        source.present(destinationNavigationController, animated: animated)
    }

    func navigate(_ route: AppRoute, source: UINavigationController, animated: Bool = true) {
        let view = route.view()
        let viewWithNavigator = view.environmentObject(source)
        let viewController = UIHostingController(rootView: viewWithNavigator)
        
        // we set route identifier to vc's restoration identifier
        viewController.restorationIdentifier = route.identifier
        source.pushViewController(viewController, animated: animated)
    }

    func presentModally(_ route: AppRoute, source: UINavigationController, animated: Bool = true) {
        let view = route.view()
        let destinationNavigationController: UINavigationController = .init()
        let viewWithNavigator = view.environmentObject(destinationNavigationController)
        let viewController = UIHostingController(rootView: viewWithNavigator)
        destinationNavigationController.modalPresentationStyle = .formSheet
        destinationNavigationController.setViewControllers([viewController], animated: animated)
        source.present(destinationNavigationController, animated: animated)
    }
    
    func popToViewController(for route: AppRoute, source: UINavigationController, animated: Bool = true) {
        let _ = route.view()
        if let targetVC = source.viewControllers.first(where: { $0.restorationIdentifier == route.identifier }) {
            source.popToViewController(targetVC, animated: animated)
        }
    }
    
    func dismissViewController(source: UINavigationController, animated: Bool = true){
        source.dismiss(animated: animated)
    }
}



extension UINavigationController: ObservableObject {
    /// Performs navigation  push to new route
    func navigateTo(route: AppRoute) {
        AppNavigation.shared.navigate(route, source: self)
    }
    
    /// Present view modally
    func present(route: AppRoute) {
        AppNavigation.shared.present(route, source: self)
    }
    
    /// Pop current view
    func pop() {
        popViewController(animated: true)
    }

    /// Pops current view to root navigation  initial controller
    func popToRoot() {
        popToRootViewController(animated: true)
    }
    
    /// Pop current view to route specified
    func popTo(route: AppRoute) {
        AppNavigation.shared.popToViewController(for: route, source: self, animated: true)
    }
    
    /// Dismiss current view presented
    func dismiss(){
        AppNavigation.shared.dismissViewController(source: self, animated: true)
    }
}
