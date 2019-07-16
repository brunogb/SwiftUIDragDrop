//
//  View+Droppable.swift
//  SwiftUIDragDrop
//
//  Created by Bruno Bilescky on 16/07/2019.
//  Copyright © 2019 Bilescky. All rights reserved.
//

import SwiftUI

public extension View {
    func droppable(containerId: UUID)-> Self.Modified<DropContainerModifier> {
        Modified(content: self, modifier: DropContainerModifier(elementId: containerId))
    }
}
