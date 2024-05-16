//
//  BottomTabBarView.swift
//
//
//  Created by Mohamad Mustapha on 14/05/2024.
//

import Pixel
import SwiftUI

public struct BottomTabBarView: View {

    public enum Tab: String, CaseIterable {

        case home, search, library

        var title: String {
            switch self {
            case .home:
                return "Home"
            case .search:
                return "Search"
            case .library:
                return "My Library"
            }
        }

        func icon(_  isActive: Bool) -> Image {
            switch self {
            case .home:
                return isActive ? Image(systemName: "house.fill") : Image(systemName: "house")
            case .search:
                return Image(systemName: "magnifyingglass")
            case .library:
                return isActive ? Image(systemName: "square.stack.3d.up.fill") : Image(systemName: "square.stack.3d.up")
            }
        }
    }

    @Binding var selectedTab: Tab

    public init(selectedTab: Binding<Tab>) {
        self._selectedTab = selectedTab
    }

    public var body: some View {
        HStack {
            ForEach(Tab.allCases, id: \.rawValue) { tab in
                Button {
                    selectedTab = tab
                } label: {
                    HStack {
                        Spacer()
                        VStack {
                            tab.icon(isActive(tab))
                                .resizable()
                                .scaledToFit()
                                .foregroundStyle(image(isActive(tab)).color)
                                .frame(width: 23, height: 23)
                            PixelText(configuration: .title(isActive(tab)), text: tab.title)
                        }
                        Spacer()
                    }
                    .sensoryFeedback(.selection, trigger: selectedTab)
                    .contentShape(Rectangle())
                }
                .buttonStyle(TabButtonStyle())
            }
        }
        .padding(.vertical, .p5)
        .padding(.bottom, .p11)
    }

    private func image(_ isActive: Bool) -> PixelColorStyle {
        return .conditional(activeColorStyle: .single(color: PixelColor.light1),
                            inactiveColorStyle: .single(color: .gray),
                            isActive: isActive)
    }

    private func isActive(_ tab: Tab) -> Bool {
        return selectedTab == tab
    }
}

fileprivate extension PixelTextConfiguration {

    static func title(_ isActive: Bool) -> PixelTextConfiguration {
        return .init(alignment: .center,
                     colorStyle: .conditional(
                        activeColorStyle: .single(color: PixelColor.light1),
                        inactiveColorStyle: .single(color: .gray),
                        isActive: isActive),
                     fontStyle: .single(font: .superSmall1),
                     lineLimit: 1)
    }
}

private struct TabButtonStyle: ButtonStyle {

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.8 : 1)
            .animation(.bouncy(duration: 0.3), value: configuration.isPressed)
    }
}

#Preview {
    BottomTabBarView(selectedTab: .constant(.library))
}
