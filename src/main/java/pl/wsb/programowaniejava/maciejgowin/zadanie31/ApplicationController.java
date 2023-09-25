package pl.wsb.programowaniejava.maciejgowin.zadanie31;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import pl.wsb.programowaniejava.maciejgowin.zadanie31.service.CurrencyService;

import java.math.BigDecimal;


@Controller
public class ApplicationController {

    @Autowired
    private CurrencyService currencyService;


    @RequestMapping("/**")
    public String showCurrencyConverter(Model model) {
        // Kod inicjalizujący ustawienie początkowych wartości w modelu
        model.addAttribute("inputValue", ""); // Domyślna pusta wartość
        model.addAttribute("outputValue", ""); // Puste pole wyniku
        return "currency"; // Zwracamy nazwę widoku (JSP)
    }

    @PostMapping("/calculate")
    public String calculateCurrency(
            @RequestParam("inputValue") BigDecimal inputValue,
            @RequestParam("inputCurrency") CurrencyService.Currency inputCurrency,
            @RequestParam("outputCurrency") CurrencyService.Currency outputCurrency,
            Model model) {
        // Konwersja walut
        BigDecimal result = currencyService.convert(inputCurrency, outputCurrency, inputValue);

        // Aktualizacja modelu z wynikiem
        model.addAttribute("inputValue", inputValue);
        model.addAttribute("inputCurrency", inputCurrency);
        model.addAttribute("outputCurrency", outputCurrency);
        model.addAttribute("outputValue", result);

        // Zwracamy nazwę widoku (JSP)
        return "currency";
    }

    @PostMapping("/clearFields")
    public String clearFields(Model model) {
        // Wyczyść pola inputValue i outputValue
        model.addAttribute("inputValue", "");
        model.addAttribute("outputValue", "");

        // Przekieruj z powrotem do widoku "currencyConverter"
        return "currency";
    }

}

