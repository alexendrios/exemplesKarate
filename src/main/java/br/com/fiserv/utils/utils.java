package br.com.fiserv.utils;

import org.apache.commons.lang3.RandomStringUtils;

import java.security.SecureRandom;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.Date;
import java.util.Random;
import java.util.TimeZone;

public class utils {

    public static long getCurrentTimestamp() {
        return new Timestamp((System.currentTimeMillis() / 1000)).getTime();
    }

    public static long getCurrentTimestampPlusMinutes(int min) {
        Calendar c = Calendar.getInstance();
        c.add(Calendar.MINUTE, min);
        return new Timestamp(c.getTimeInMillis() / 1000).getTime();
    }

    public static String getDateNowFormat(String format) {
        SimpleDateFormat sdf = new SimpleDateFormat(format);
        return sdf.format(new Date());
    }

    public static String getAddMinutesToDate(String dateTime, String format, int minutes) throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat(format);
        Calendar cal = Calendar.getInstance();
        cal.add(Calendar.MINUTE, minutes);
        return sdf.format(cal.getTime());
    }

    public static String formatDateTime(String dateTime, String format) throws ParseException {
        SimpleDateFormat formatt = new SimpleDateFormat("yyyy-MM-dd");
        Date dateFormat = formatt.parse(dateTime);
        SimpleDateFormat parser = new SimpleDateFormat(format);
        return parser.format(dateFormat);
    }

    public static String getNextHourFormat(String format, int hours) {
        Calendar c = Calendar.getInstance();
        c.add(Calendar.HOUR_OF_DAY, hours);
        SimpleDateFormat sdf = new SimpleDateFormat(format);
        return sdf.format(c.getTime());
    }

    public static String getDateNowTimeZone(String format, String timeZone) {
        Date date = new Date();
        TimeZone.setDefault(TimeZone.getTimeZone(timeZone));
        Calendar calendar = Calendar.getInstance(TimeZone.getTimeZone("GMT"));
        date = calendar.getTime();
        SimpleDateFormat sdf = new SimpleDateFormat(format);
        return sdf.format(date);
    }


    public static String notationToDate() {
        String notation = "D+1";
        String newPattern = "yyyyMMdd";
        SimpleDateFormat sdf = new SimpleDateFormat(newPattern);
        if (notation.matches("(D||d)[-+]\\d{1,3}")) {
            int numberOfDays = Integer.parseInt(notation.split("[-+]")[1]);
            LocalDate date = LocalDate.now();
            date = notation.contains("+") ? date.plusDays(numberOfDays) : date.minusDays(numberOfDays);
            return date.format(DateTimeFormatter.ofPattern(newPattern));
        }
        return LocalDate.now().format(DateTimeFormatter.ofPattern(newPattern));
    }

    public static String notationToDate(String notation, String newPattern) {
        SimpleDateFormat sdf = new SimpleDateFormat(newPattern);
        if (notation.matches("(D||d)[-+]\\d{1,3}")) {
            int numberOfDays = Integer.parseInt(notation.split("[-+]")[1]);
            LocalDate date = LocalDate.now();
            date = notation.contains("+") ? date.plusDays(numberOfDays) : date.minusDays(numberOfDays);
            return date.format(DateTimeFormatter.ofPattern(newPattern));
        }
        return LocalDate.now().format(DateTimeFormatter.ofPattern(newPattern));
    }


    public static String generateName() {

        int i, nrRandomVowel, nrRandomConsonant;

        final String vowel[] = {"a", "e", "i", "o", "u"};
        String nameYou = "", name = "";
        final String consonant[] = {
                "b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p",
                "q", "r", "s", "t", "w", "x", "y", "z"
        };
        final Random random = new Random();
        for (i = 0; i <= 8; i++) {
            nrRandomVowel = 0 + random.nextInt(4);
            nrRandomConsonant = 0 + random.nextInt(19);
            nameYou = vowel[nrRandomVowel] + consonant[nrRandomConsonant];
            name = name + "" + nameYou;
        }
        return name;
    }

    public static String generateCPF() throws Exception {

        int digito1 = 0, digito2 = 0, resto = 0;
        String nDigResult;
        String numerosContatenados;
        String numeroGerado;

        Random numeroAleatorio = new Random();


        int n1 = numeroAleatorio.nextInt(10);
        int n2 = numeroAleatorio.nextInt(10);
        int n3 = numeroAleatorio.nextInt(10);
        int n4 = numeroAleatorio.nextInt(10);
        int n5 = numeroAleatorio.nextInt(10);
        int n6 = numeroAleatorio.nextInt(10);
        int n7 = numeroAleatorio.nextInt(10);
        int n8 = numeroAleatorio.nextInt(10);
        int n9 = numeroAleatorio.nextInt(10);


        int soma = n9 * 2 + n8 * 3 + n7 * 4 + n6 * 5 + n5 * 6 + n4 * 7 + n3 * 8 + n2 * 9 + n1 * 10;

        int valor = (soma / 11) * 11;

        digito1 = soma - valor;

        resto = (digito1 % 11);

        if (digito1 < 2) {
            digito1 = 0;
        } else {
            digito1 = 11 - resto;
        }

        int soma2 = digito1 * 2 + n9 * 3 + n8 * 4 + n7 * 5 + n6 * 6 + n5 * 7 + n4 * 8 + n3 * 9 + n2 * 10 + n1 * 11;

        int valor2 = (soma2 / 11) * 11;

        digito2 = soma2 - valor2;

        resto = (digito2 % 11);

        if (digito2 < 2) {
            digito2 = 0;
        } else {
            digito2 = 11 - resto;
        }

        numerosContatenados = String.valueOf(n1) + String.valueOf(n2) + String.valueOf(n3) + "." + String.valueOf(n4) +
                String.valueOf(n5) + String.valueOf(n6) + "." + String.valueOf(n7) + String.valueOf(n8) +
                String.valueOf(n9) + "-";

        nDigResult = String.valueOf(digito1) + String.valueOf(digito2);

        numeroGerado = numerosContatenados + nDigResult;

        return numeroGerado;
    }

    public static String randomestring() {
        String generatedstring = RandomStringUtils.randomAlphabetic(8);
        return (generatedstring);
    }


    public static String generateEmail() {
        String email = randomestring() + "@teste.com";
        return email;
    }

    public String randomNum(Integer digitos) {
        String generatedString2 = RandomStringUtils.randomNumeric(digitos);
        return (generatedString2);
    }

    public static String formatMerchantNumber(String merchant) {
        merchant = merchant.replace("0000000", "").replace("[", "").replace("]", "").replaceAll("^\"+|\"+$", "").trim();
        return merchant;
    }




}
