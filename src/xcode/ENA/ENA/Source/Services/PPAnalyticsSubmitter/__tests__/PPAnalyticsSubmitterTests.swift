////
// 🦠 Corona-Warn-App
//

import XCTest
@testable import ENA

class PPAnalyticsSubmitterTests: XCTestCase {

	// MARK: - Success

	func testGIVEN_SubmissionIsTriggered_WHEN_EverythingIsGiven_THEN_Success() {
		// GIVEN
		let store = MockTestStore()
		let client = ClientMock()
		var config = SAP_Internal_V2_ApplicationConfigurationIOS()
		config.privacyPreservingAnalyticsParameters.common.probabilityToSubmit = 3
		let appConfigurationProvider = CachedAppConfigurationMock(with: config)
		let analyticsSubmitter = PPAnalyticsSubmitter(
			store: store,
			client: client,
			appConfig: appConfigurationProvider
		)

		let expectation = self.expectation(description: "completion handler is called without an error")

		store.privacyPreservingAnalyticsConsentAccept = true
		store.submissionAnalytics = Calendar.current.date(byAdding: .day, value: -5, to: Date())
		store.onboardedDate = Calendar.current.date(byAdding: .day, value: -5, to: Date())
		store.lastAppReset = Calendar.current.date(byAdding: .day, value: -5, to: Date())
		let ppacToken = PPACToken(apiToken: "FakeApiToken", deviceToken: "FakeDeviceToken")

		// WHEN
		analyticsSubmitter.triggerSubmitData(ppacToken: ppacToken, completion: { result in
			switch result {
			case .success:
				expectation.fulfill()
			case .failure:
				XCTFail("Test should not fail")
			}
		})

		// THEN
		waitForExpectations(timeout: .short)
	}

	// MARK: - Failures

	func testGIVEN_SubmissionIsTriggered_WHEN_UserConsentIsMissing_THEN_UserConsentErrorIsReturned() {
		// GIVEN
		let store = MockTestStore()
		let client = ClientMock()
		let config = SAP_Internal_V2_ApplicationConfigurationIOS()
		let appConfigurationProvider = CachedAppConfigurationMock(with: config)
		let analyticsSubmitter = PPAnalyticsSubmitter(
			store: store,
			client: client,
			appConfig: appConfigurationProvider
		)

		let expectation = self.expectation(description: "completion handler is called with an error")

		// WHEN
		var ppasError: PPASError?
		analyticsSubmitter.triggerSubmitData(ppacToken: nil, completion: { result in
			switch result {
			case .success:
				XCTFail("Test should not success")
			case let .failure(error):
				ppasError = error
				expectation.fulfill()
			}
		})

		// THEN
		waitForExpectations(timeout: .short)
		XCTAssertEqual(ppasError, .userConsentError)
	}

	func testGIVEN_SubmissionIsTriggered_WHEN_AppConfigIsMissing_THEN_ProbibilityErrorIsReturned() {
		// GIVEN
		let store = MockTestStore()
		let client = ClientMock()
		let config = SAP_Internal_V2_ApplicationConfigurationIOS()
		let appConfigurationProvider = CachedAppConfigurationMock(with: config)
		let analyticsSubmitter = PPAnalyticsSubmitter(
			store: store,
			client: client,
			appConfig: appConfigurationProvider
		)

		let expectation = self.expectation(description: "completion handler is called with an error")
		store.privacyPreservingAnalyticsConsentAccept = true

		// WHEN
		var ppasError: PPASError?
		analyticsSubmitter.triggerSubmitData(ppacToken: nil, completion: { result in
			switch result {
			case .success:
				XCTFail("Test should not success")
			case let .failure(error):
				ppasError = error
				expectation.fulfill()
			}
		})

		// THEN
		waitForExpectations(timeout: .short)
		XCTAssertEqual(ppasError, .probibilityError)
	}

	func testGIVEN_SubmissionIsTriggered_WHEN_ProbabilityIsLow_THEN_ProbibilityErrorIsReturned() {
		// GIVEN
		let store = MockTestStore()
		let client = ClientMock()
		var config = SAP_Internal_V2_ApplicationConfigurationIOS()
		config.privacyPreservingAnalyticsParameters.common.probabilityToSubmit = -1
		let appConfigurationProvider = CachedAppConfigurationMock(with: config)
		let analyticsSubmitter = PPAnalyticsSubmitter(
			store: store,
			client: client,
			appConfig: appConfigurationProvider
		)

		let expectation = self.expectation(description: "completion handler is called with an error")
		store.privacyPreservingAnalyticsConsentAccept = true

		// WHEN
		var ppasError: PPASError?
		analyticsSubmitter.triggerSubmitData(ppacToken: nil, completion: { result in
			switch result {
			case .success:
				XCTFail("Test should not success")
			case let .failure(error):
				ppasError = error
				expectation.fulfill()
			}
		})

		// THEN
		waitForExpectations(timeout: .short)
		XCTAssertEqual(ppasError, .probibilityError)
	}

	func testGIVEN_SubmissionIsTriggered_WHEN_SubmissionWas2HoursAgo_THEN_Submission23hoursErrorIsReturned() {
		// GIVEN
		let store = MockTestStore()
		let client = ClientMock()
		var config = SAP_Internal_V2_ApplicationConfigurationIOS()
		config.privacyPreservingAnalyticsParameters.common.probabilityToSubmit = 3
		let appConfigurationProvider = CachedAppConfigurationMock(with: config)
		let analyticsSubmitter = PPAnalyticsSubmitter(
			store: store,
			client: client,
			appConfig: appConfigurationProvider
		)

		let expectation = self.expectation(description: "completion handler is called with an error")
		store.privacyPreservingAnalyticsConsentAccept = true
		store.submissionAnalytics = Calendar.current.date(byAdding: .hour, value: -2, to: Date())

		// WHEN
		var ppasError: PPASError?
		analyticsSubmitter.triggerSubmitData(ppacToken: nil, completion: { result in
			switch result {
			case .success:
				XCTFail("Test should not success")
			case let .failure(error):
				ppasError = error
				expectation.fulfill()
			}
		})

		// THEN
		waitForExpectations(timeout: .short)
		XCTAssertEqual(ppasError, .submission23hoursError)
	}

	func testGIVEN_SubmissionIsTriggered_WHEN_OnboardingWas2HoursAgo_THEN_OnboardingErrorIsReturned() {
		// GIVEN
		let store = MockTestStore()
		let client = ClientMock()
		var config = SAP_Internal_V2_ApplicationConfigurationIOS()
		config.privacyPreservingAnalyticsParameters.common.probabilityToSubmit = 3
		let appConfigurationProvider = CachedAppConfigurationMock(with: config)
		let analyticsSubmitter = PPAnalyticsSubmitter(
			store: store,
			client: client,
			appConfig: appConfigurationProvider
		)

		let expectation = self.expectation(description: "completion handler is called with an error")
		store.privacyPreservingAnalyticsConsentAccept = true
		store.submissionAnalytics = Calendar.current.date(byAdding: .day, value: -5, to: Date())
		store.onboardedDate = Calendar.current.date(byAdding: .hour, value: -2, to: Date())

		// WHEN
		var ppasError: PPASError?
		analyticsSubmitter.triggerSubmitData(ppacToken: nil, completion: { result in
			switch result {
			case .success:
				XCTFail("Test should not success")
			case let .failure(error):
				ppasError = error
				expectation.fulfill()
			}
		})

		// THEN
		waitForExpectations(timeout: .short)
		XCTAssertEqual(ppasError, .onboardingError)
	}

	func testGIVEN_SubmissionIsTriggered_WHEN_AppResetWas2HoursAgo_THEN_AppResetErrorIsReturned() {
		// GIVEN
		let store = MockTestStore()
		let client = ClientMock()
		var config = SAP_Internal_V2_ApplicationConfigurationIOS()
		config.privacyPreservingAnalyticsParameters.common.probabilityToSubmit = 3
		let appConfigurationProvider = CachedAppConfigurationMock(with: config)
		let analyticsSubmitter = PPAnalyticsSubmitter(
			store: store,
			client: client,
			appConfig: appConfigurationProvider
		)

		let expectation = self.expectation(description: "completion handler is called with an error")
		store.privacyPreservingAnalyticsConsentAccept = true
		store.submissionAnalytics = Calendar.current.date(byAdding: .day, value: -5, to: Date())
		store.onboardedDate = Calendar.current.date(byAdding: .day, value: -5, to: Date())
		store.lastAppReset = Calendar.current.date(byAdding: .hour, value: -2, to: Date())

		// WHEN
		var ppasError: PPASError?
		analyticsSubmitter.triggerSubmitData(ppacToken: nil, completion: { result in
			switch result {
			case .success:
				XCTFail("Test should not success")
			case let .failure(error):
				ppasError = error
				expectation.fulfill()
			}
		})

		// THEN
		waitForExpectations(timeout: .short)
		XCTAssertEqual(ppasError, .appResetError)
	}

	func testGIVEN_SubmissionIsTriggered_WHEN_PpacCouldNotAuthorize_THEN_PpacErrorIsReturned() {
		// GIVEN
		let store = MockTestStore()
		let client = ClientMock()
		var config = SAP_Internal_V2_ApplicationConfigurationIOS()
		config.privacyPreservingAnalyticsParameters.common.probabilityToSubmit = 3
		let appConfigurationProvider = CachedAppConfigurationMock(with: config)
		let analyticsSubmitter = PPAnalyticsSubmitter(
			store: store,
			client: client,
			appConfig: appConfigurationProvider
		)

		let expectation = self.expectation(description: "completion handler is called with an error")
		store.privacyPreservingAnalyticsConsentAccept = true
		store.submissionAnalytics = Calendar.current.date(byAdding: .day, value: -5, to: Date())
		store.onboardedDate = Calendar.current.date(byAdding: .day, value: -5, to: Date())
		store.lastAppReset = Calendar.current.date(byAdding: .day, value: -5, to: Date())

		// WHEN
		var ppasError: PPASError?
		analyticsSubmitter.triggerSubmitData(ppacToken: nil, completion: { result in
			switch result {
			case .success:
				XCTFail("Test should not success")
			case let .failure(error):
				ppasError = error
				expectation.fulfill()
			}
		})

		// THEN
		waitForExpectations(timeout: .short)
		XCTAssertEqual(ppasError, .ppacError)
	}
}
