package pl.wsb.programowaniejava.maciejgowin.zadanie31.service;

import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.math.RoundingMode;

@Service
public class CurrencyService {

    public enum Currency {
        PLN(new BigDecimal("1.0")),
        EUR(new BigDecimal("0.22")),
        DOL(new BigDecimal("0.24"));

        private final BigDecimal exchangeRate;

        Currency(BigDecimal exchangeRate) {
            this.exchangeRate = exchangeRate;
        }

        public BigDecimal getExchangeRate() {
            return exchangeRate;
        }
    }

    public BigDecimal convert(Currency fromCurrency, Currency toCurrency, BigDecimal amount) {
        if (fromCurrency == toCurrency) {
            return amount;
        }
        BigDecimal fromRate = fromCurrency.getExchangeRate();
        BigDecimal toRate = toCurrency.getExchangeRate();
        return amount.multiply(toRate).divide(fromRate, 2, RoundingMode.HALF_UP);
    }



}
