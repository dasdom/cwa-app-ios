//
// 🦠 Corona-Warn-App
//

import Foundation
import UIKit

typealias DownloadedPackagesStore = DownloadedPackagesStoreV2
typealias DownloadedPackagesSQLLiteStore = DownloadedPackagesSQLLiteStoreV2

protocol RequiresAppDependencies {
	var client: HTTPClient { get }
	var wifiClient: WifiOnlyHTTPClient { get }
	var store: Store { get }
	var taskScheduler: ENATaskScheduler { get }
	var downloadedPackagesStore: DownloadedPackagesStore { get }
	var appConfigurationProvider: AppConfigurationProviding { get }
	var riskProvider: RiskProvider { get }
	var exposureManager: ExposureManager { get }
	var serverEnvironment: ServerEnvironment { get }
	var warnOthersReminder: WarnOthersRemindable { get }
}

extension RequiresAppDependencies {
	var client: HTTPClient {
		UIApplication.coronaWarnDelegate().client
	}

	var wifiClient: WifiOnlyHTTPClient {
		UIApplication.coronaWarnDelegate().wifiClient
	}

	var downloadedPackagesStore: DownloadedPackagesStore {
		UIApplication.coronaWarnDelegate().downloadedPackagesStore
	}

	var store: Store {
		UIApplication.coronaWarnDelegate().store
	}

	var appConfigurationProvider: AppConfigurationProviding {
		UIApplication.coronaWarnDelegate().appConfigurationProvider
	}

	var riskProvider: RiskProvider {
		UIApplication.coronaWarnDelegate().riskProvider
	}

	var exposureManager: ExposureManager {
		UIApplication.coronaWarnDelegate().exposureManager
	}

	var taskScheduler: ENATaskScheduler {
		UIApplication.coronaWarnDelegate().taskScheduler
	}

	var serverEnvironment: ServerEnvironment {
		UIApplication.coronaWarnDelegate().serverEnvironment
	}
	
	var warnOthersReminder: WarnOthersRemindable {
		UIApplication.coronaWarnDelegate().warnOthersReminder
	}
}
