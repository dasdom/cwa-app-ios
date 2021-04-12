////
// 🦠 Corona-Warn-App
//

import Foundation

enum CoronaTestQRCodeInformation {
	case pcr(String)
	case antigen(RapidTestInformation, String)
	
	// we cant declare the enum type to Int because we have properties inside the cases
	
	var testType: CoronaTestType {
		switch self {
		case .pcr:
			return .pcr
		case .antigen:
			return .antigen
		}
	}
}
