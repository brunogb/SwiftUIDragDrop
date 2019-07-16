//
//  View+Draggable.swift
//  SwiftUIDragDrop
//
//  Created by Bruno Bilescky on 16/07/2019.
//  Copyright © 2019 Bilescky. All rights reserved.
//

import SwiftUI

extension View {
    func draggable(id: UUID, manager: DragNDropManager) -> Self.Modified<DragElementModifier> {
        Modified(content: self, modifier: DragElementModifier(manager: manager, elementId: id))
    }
}
