package com.cater.service;

import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.cater.dao.QuoteDAO;
import com.cater.dao.RestaurantDAO;
import com.cater.model.Quote;
import com.cater.model.Restaurant;

@Component
public class RestaurantService {
	@Autowired
	private RestaurantDAO restaurantDAO;
	@Autowired
	private QuoteDAO quoteDAO;

	public List<Restaurant> fetchAllRestaurants() {
		return restaurantDAO.fetchAllRestaurants();
	}

	public Set<Restaurant> fetchRestaurantsOfType(String cuisine) {
		return restaurantDAO.fetchRestaurantsOfType(cuisine);
	}

	public Restaurant findRestaurantWithId(int restaurantId) {
		return restaurantDAO.findById(restaurantId);
	}

	public Restaurant findRestaurantWithLoginId(int loginID) {
		return restaurantDAO.findByLoginID(loginID);
	}

	public Quote findQuoteWithId(int quoteId) {
		return quoteDAO.findById(quoteId);
	}

	public boolean saveOrUpdateQuote(Quote q) {
		return quoteDAO.saveOrUpdate(q);
	}
}
