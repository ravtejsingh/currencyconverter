package com.converter.domain;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

/**
 * Created by ravtej on 6/3/17.
 */
@JsonIgnoreProperties(ignoreUnknown = true)
public class ExchangeRate {

    private String to;

    private String rate;

    private String from;
    
    private String v;

    public ExchangeRate() {
    }

    public String getTo() {
        return to;
    }

    public void setTo(String to) {
        this.to = to;
    }

    public String getRate() {
        return rate;
    }

    public void setRate(String rate) {
        this.rate = rate;
    }

    public String getFrom() {
        return from;
    }

    public void setFrom(String from) {
        this.from = from;
    }

	public String getV() {
		return v;
	}

	public void setV(String v) {
		this.v = v;
	}

	@Override
    public String toString() {
        return "ExchangeRate{" +
                "to='" + to + '\'' +
                ", rate='" + rate + '\'' +
                ", from='" + from + '\'' +
                ", value='" + v + '\'' +
                '}';
    }
}
