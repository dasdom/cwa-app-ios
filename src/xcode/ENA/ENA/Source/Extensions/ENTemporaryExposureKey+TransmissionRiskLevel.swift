//
// Corona-Warn-App
//
// SAP SE and all other contributors
// copyright owners license this file to you under the Apache
// License, Version 2.0 (the "License"); you may not use this
// file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.
//

import Foundation
import ExposureNotification

enum SymptomsOnset {

	case noInformation
	case nonSymptomatic
	case symptomaticWithUnknownOnset
	case lastSevenDays
	case oneToTwoWeeksAgo
	case moreThanTwoWeeksAgo
	case daysSinceOnset(Int)

	// MARK: - Internal

	/// Transmission risk level by days since the exposure.
	/// These factors are applied to each `ENTemporaryExposureKey`'s `transmissionRiskLevel`
	///
	/// Index 0 of the array represents the day of the exposure
	/// Index 1 the next day, and so on.
	/// These factors are supplied by RKI
	///
	/// - important: The first element of the array is not used. That is because the ExposureNotification framework
	/// does not return the current day's key - so the first key we have in the array is actually from yesterday.
	///
	/// - see also: [Risk Score Calculation Docs](https://github.com/corona-warn-app/cwa-documentation/blob/master/solution_architecture.md#risk-score-calculation)
	var transmissionRiskVector: [ENRiskLevel] {
		switch self {
		case .noInformation:
			return [5, 6, 7, 7, 7, 6, 4, 3, 2, 1, 1, 1, 1, 1, 1]
		case .nonSymptomatic:
			return [4, 4, 3, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
		case .symptomaticWithUnknownOnset:
			return [5, 6, 8, 8, 8, 7, 5, 3, 2, 1, 1, 1, 1, 1, 1]
		case .lastSevenDays:
			return [4, 5, 6, 7, 7, 7, 6, 5, 4, 3, 2, 1, 1, 1, 1]
		case .oneToTwoWeeksAgo:
			return [1, 1, 1, 1, 2, 3, 4, 5, 6, 6, 7, 7, 6, 6, 4]
		case .moreThanTwoWeeksAgo:
			return [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 3, 4, 5]
		case .daysSinceOnset(let daysSinceOnset):
			return daysSinceOnsetRiskVectors[daysSinceOnset]
		}
	}

	// MARK: - Private

	private var daysSinceOnsetRiskVectors: [[ENRiskLevel]] {
		[
			[8, 8, 7, 6, 4, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1],
			[8, 8, 8, 7, 6, 4, 2, 1, 1, 1, 1, 1, 1, 1, 1],
			[6, 8, 8, 8, 7, 6, 4, 2, 1, 1, 1, 1, 1, 1, 1],
			[5, 6, 8, 8, 8, 7, 6, 4, 2, 1, 1, 1, 1, 1, 1],
			[3, 5, 6, 8, 8, 8, 7, 6, 4, 2, 1, 1, 1, 1, 1],
			[2, 3, 5, 6, 8, 8, 8, 7, 6, 4, 2, 1, 1, 1, 1],
			[2, 2, 3, 5, 6, 8, 8, 8, 7, 6, 4, 2, 1, 1, 1],
			[1, 2, 2, 3, 5, 6, 8, 8, 8, 7, 6, 4, 2, 1, 1],
			[1, 1, 2, 2, 3, 5, 6, 8, 8, 8, 7, 6, 4, 2, 1],
			[1, 1, 1, 2, 2, 3, 5, 6, 8, 8, 8, 7, 6, 4, 2],
			[1, 1, 1, 1, 2, 2, 3, 5, 6, 8, 8, 8, 7, 6, 4],
			[1, 1, 1, 1, 1, 2, 2, 3, 5, 6, 8, 8, 8, 7, 6],
			[1, 1, 1, 1, 1, 1, 2, 2, 3, 5, 6, 8, 8, 8, 7],
			[1, 1, 1, 1, 1, 1, 1, 2, 2, 3, 5, 6, 8, 8, 8],
			[1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 3, 5, 6, 8, 8],
			[1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 3, 5, 6, 8],
			[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 3, 5, 6],
			[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 3, 5],
			[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 3],
			[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2],
			[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2],
			[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
		]
	}

}

extension Array where Element: ENTemporaryExposureKey {

	/// The maximum number of keys to be submitted
	var maxKeyCount: Int { 14 }

	/// In-place prepare an array of `ENTemporaryExposureKey` for exposure submission.
	///
	/// Performs the following steps:
	/// 1. Sorts the keys by their `rollingStartNumber`
	/// 2. Takes the first `maxKeyCount` (14) keys using `prefix(_ :)`
	/// 3. Applies the `transmissionRiskDefaultVector` to the sorted keys
	mutating func applyTransmissionRiskLevels(for symptomsOnset: SymptomsOnset) {
		sort {
			$0.rollingStartNumber > $1.rollingStartNumber
		}

		self = Array(prefix(maxKeyCount))
		for (key, vectorElement) in zip(self, symptomsOnset.transmissionRiskVector.dropFirst()) {
			key.transmissionRiskLevel = vectorElement
		}
	}

}
