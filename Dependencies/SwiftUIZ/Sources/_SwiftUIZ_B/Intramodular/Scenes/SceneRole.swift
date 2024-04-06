//
// Copyright (c) Vatsal Manot
//

import SwiftUI

@OptionSet<Int>
public struct SceneRole {
    private enum Options: Int {
        case documentBrowser
        case documentEditor
        case documentViewer
        case form
        case inspector
        case preview
    }
}
