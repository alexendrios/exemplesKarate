package br.com.fiserv.dataBase;

import br.com.fiserv.utils.utils;
import com.google.gson.JsonObject;

import java.util.Map;

public class DataBase {

    public static Map<String, String> selectMerchant() {
        String query = "queryGetBoadingMerchant.sql";

        return OracleDao.select(query);
    }

    public static Map<String, String> selectTerminalData() {
        String query = "queryGetTerminalData.sql";

        return OracleDao.select(query);
    }

    public static Map<String, String> selectTerminalIpgActive() {
        String query = "queryGetTerminalIpgActive.sql";

        return OracleDao.select(query);
    }

    public static Map<String, String> selectTerminalTefActive() {
        String query = "queryGetTerminalTefActive.sql";

        return OracleDao.select(query);
    }

    public static Map<String, String> selectTerminalBatchActive() {
        String query = "queryGetTerminalBatchActive";

        return OracleDao.select(query);
    }

    public static Map<String, String> selectTerminalChange() {
        String query = "queryGetTerminalChange.sql";

        return OracleDao.select(query);
    }

    public static Map<String, String> selectAccount(String brand) {
        String query = "queryGetMerchantAccount.sql";
        return OracleDao.select(query, brand);
    }

    public static Map<String, String> selectTransactionToCancel(String brand, String product) {
        String query = "";
        String destination = "";
        String installmentGroup = "";
        String tranDate = utils.notationToDate("D+0","yyyyMMdd");

        if (product.toLowerCase().equals("debit") || product.toLowerCase().equals("credit")) {
            query = "queryGetMerchantTransaction.sql";
        } else {
            query = "queryGetMerchantIssuerTransaction.sql";
            if(product.toLowerCase().equals("install")){
                installmentGroup = "002";
            }else{
                installmentGroup = "003";
            }
        }

        if (brand.toLowerCase().equals("amex")) {
            switch (product.toLowerCase()) {
                case "credit":
                case "issuer":
                    destination = "014";
                    break;
                case "install":
                    destination = "983";
                    break;
            }
        }

        if (brand.toLowerCase().equals("hiper")) {
            switch (product.toLowerCase()) {
                case "credit":
                case "issuer":
                    destination = "920";
                    break;
                case "install":
                    destination = "921";
                    break;
            }
        }

        if (brand.toLowerCase().equals("master")) {
            switch (product.toLowerCase()) {
                case "debit":
                    destination = "164";
                    break;
                case "credit":
                case "issuer":
                    destination = "156";
                    break;
                case "install":
                    destination = "290";
                    break;
            }
        }

        if (brand.toLowerCase().equals("visa")) {
            switch (product.toLowerCase()) {
                case "debit":
                    destination = "952";
                    break;
                case "credit":
                case "issuer":
                    destination = "935";
                    break;
                case "install":
                    destination = "953";
                    break;
            }
        }

        if (brand.toLowerCase().equals("cabal")) {
            switch (product.toLowerCase()) {
                case "debit":
                    destination = "192";
                    break;
                case "credit":
                case "issuer":
                    destination = "191";
                    break;
                case "install":
                    destination = "194";
                    break;
            }
        }

        if (brand.toLowerCase().equals("elo")) {
            switch (product.toLowerCase()) {
                case "debit":
                    destination = "927";
                    break;
                case "credit":
                case "issuer":
                    destination = "926";
                    break;
                case "install":
                    destination = "928";
                    break;
            }
        }

        if(product.toLowerCase().equals("install") || product.toLowerCase().equals("issuer")){
            return OracleDao.select(query, installmentGroup ,destination, tranDate);
        }
        return OracleDao.select(query, destination, tranDate);
    }

}
