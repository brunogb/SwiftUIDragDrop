//
//  View+Droppable.swift
//  SwiftUIDragDrop
//
//  Created by Bruno Bilescky on 16/07/2019.
//  Copyright © 2019 Bilescky. All rights reserved.
//

import SwiftUI

public extension View {
    func droppable(containerId: UUID)-> ModifiedContent<Self, DropContainerModifier> {
        ModifiedContent(content: self, modifier: DropContainerModifier(elementId: containerId))
    }
}
