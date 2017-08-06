//  Copyright © 2017 cutting.io. All rights reserved.

class RemoteGameCoordinator {

    private let pickFeature: PickFeature

    private var pickCoordinator: PickCoordinator?

    init(pickFeature: PickFeature) {
        self.pickFeature = pickFeature
    }

    func start(window: WindowWireframe) {
        startPickFeature(window: window)
    }
}

extension RemoteGameCoordinator: PickCoordinatorDelegate {

    private func startPickFeature(window: WindowWireframe) {
        pickCoordinator = pickFeature.makeCoordinator()
        pickCoordinator?.delegate = self
        pickCoordinator?.start(window: window)
    }

    func didPick(result: PickInteractorResult) {
        finishPickFeature()
        showRemotePlay(result: result)
    }

    private func finishPickFeature() {
        pickCoordinator = nil
    }
}

extension RemoteGameCoordinator {

    private func showRemotePlay(result: PickInteractorResult) {
        print("sending remotely: \(result)")
    }
}
