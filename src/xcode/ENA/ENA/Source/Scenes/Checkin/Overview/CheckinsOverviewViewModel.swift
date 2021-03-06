//
// 🦠 Corona-Warn-App
//

import UIKit
import OpenCombine
import AVFoundation

class CheckinsOverviewViewModel {

	// MARK: - Init

	init(
		store: EventStoringProviding,
		eventCheckoutService: EventCheckoutService,
		onEntryCellTap: @escaping (Checkin) -> Void,
		cameraAuthorizationStatus: @escaping () -> AVAuthorizationStatus = {
			AVCaptureDevice.authorizationStatus(for: .video)
		}
	) {
		self.store = store
		self.eventCheckoutService = eventCheckoutService
		self.onEntryCellTap = onEntryCellTap
        self.cameraAuthorizationStatus = cameraAuthorizationStatus

		store.checkinsPublisher
			.sink { [weak self] in
				self?.update(from: $0)
			}
			.store(in: &subscriptions)
	}

	// MARK: - Internal

	enum Section: Int, CaseIterable {
		case add
		case missingPermission
		case entries
	}

	@OpenCombine.Published var triggerReload: Bool = false

	var onUpdate: (() -> Void)?

	var checkinCellModels: [CheckinCellModel] = []

	var numberOfSections: Int {
		Section.allCases.count
	}

	var isEmpty: Bool {
		numberOfRows(in: Section.entries.rawValue) == 0
	}

	var isEmptyStateVisible: Bool {
		isEmpty && !showMissingPermissionSection
	}

	func numberOfRows(in section: Int) -> Int {
		switch Section(rawValue: section) {
		case .add:
			return showMissingPermissionSection ? 0 : 1
		case .missingPermission:
			return showMissingPermissionSection ? 1 : 0
		case .entries:
			return checkinCellModels.count
		case .none:
			fatalError("Invalid section")
		}
	}

	func canEditRow(at indexPath: IndexPath) -> Bool {
		return indexPath.section == Section.entries.rawValue
	}

	func didTapEntryCell(at indexPath: IndexPath) {
		guard indexPath.section == Section.entries.rawValue else {
			fatalError("didTapEntryCell can only be called from the entries section")
		}

		onEntryCellTap(checkinCellModels[indexPath.row].checkin)
	}

	func didTapEntryCellButton(at indexPath: IndexPath) {
		guard indexPath.section == Section.entries.rawValue else {
			fatalError("didTapEntryCell can only be called from the entries section")
		}

		eventCheckoutService.checkout(
			checkin: checkinCellModels[indexPath.row].checkin,
			manually: true
		)
	}

	func removeEntry(at indexPath: IndexPath) {
		store.deleteCheckin(id: checkinCellModels[indexPath.row].checkin.id)
	}

	func removeAll() {
		store.deleteAllCheckins()
	}

	func updateForCameraPermission() {
		triggerReload = true
	}

	func checkoutOverdueCheckins() {
		eventCheckoutService.checkoutOverdueCheckins()
	}

	// MARK: - Private

	private let store: EventStoringProviding
	private let eventCheckoutService: EventCheckoutService
	private let onEntryCellTap: (Checkin) -> Void
	private let cameraAuthorizationStatus: () -> AVAuthorizationStatus

	private var subscriptions: [AnyCancellable] = []

	private var showMissingPermissionSection: Bool {
		let status = cameraAuthorizationStatus()

		return status != .notDetermined && status != .authorized
	}

	private func update(from checkins: [Checkin]) {
		if checkins.map({ $0.id }) != checkinCellModels.map({ $0.checkin.id }) {
			checkinCellModels.forEach {
				$0.invalidateTimer()
			}

			checkinCellModels = checkins.map { checkin in
				CheckinCellModel(
					checkin: checkin,
					eventCheckoutService: eventCheckoutService,
					onUpdate: { [weak self] in
						self?.onUpdate?()
					}
				)
			}

			triggerReload = true
		} else {
			checkinCellModels.forEach { cellModel in
				guard let checkin = checkins.first(where: { $0.id == cellModel.checkin.id }) else {
					return
				}

				cellModel.update(with: checkin)
			}
		}
	}

}
