package com.tin.service;

import java.time.YearMonth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tin.dao.StatsDAO;

@Service
public class StatsServiceImpl implements StatsService {

	@Autowired
	StatsDAO stats;
	
	@Override
	public String[][] getTotalPriceLast6Month() {
		String[][] result = new String[2][6];
		YearMonth currentTimes = YearMonth.now();
		for (int i = 0; i < 6; i++) {
			String month = currentTimes.minusMonths((long)i).getMonthValue() + "";
			String year = currentTimes.minusMonths((long)i).getYear() + "";
			result[0][5-i] = month + "-" + year;
			result[1][5-i] = stats.getTotalPricePerMonth(month, year);
		}
 		return result;
	}


}
