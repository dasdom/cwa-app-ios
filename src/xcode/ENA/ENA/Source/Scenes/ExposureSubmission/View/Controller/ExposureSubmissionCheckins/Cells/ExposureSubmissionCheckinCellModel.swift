////
// 🦠 Corona-Warn-App
//

import UIKit
import OpenCombine

class ExposureSubmissionCheckinCellModel {
	
	// MARK: - Init
	
	init(checkin: Checkin) {
		self.checkin = checkin
	}

	// MARK: - Internal
	
	let checkin: Checkin
	
	var description: String {
		checkin.traceLocationDescription
	}

	var address: String {
		checkin.traceLocationAddress
	}
		
	var dateInterval: String {
		let dateFormatter = DateIntervalFormatter()
		dateFormatter.dateStyle = .short
		dateFormatter.timeStyle = .short

		return dateFormatter.string(from: checkin.checkinStartDate, to: checkin.checkinEndDate)
	}
	
	var selected: Bool = false {
		didSet {
			cellIsSelected = selected
			checkmarkImage = selected ? UIImage(named: "Checkin_Checkmark_Selected") : UIImage(named: "Checkin_Checkmark_Unselected")
		}
	}

	@OpenCombine.Published private(set)  var cellIsSelected: Bool = false
	@OpenCombine.Published private(set) var checkmarkImage = UIImage(named: "Checkin_Checkmark_Unselected")

}
