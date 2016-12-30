public class TemperatureConverter {
    // Takes a Fahreinheit temp and returns the Celsius equivalent
    public static Decimal FahreinheitToCelsius(Decimal fh) {
        Decimal cs = (fh - 32) * 5/9;
        return cs.setScale(2);
    }
}