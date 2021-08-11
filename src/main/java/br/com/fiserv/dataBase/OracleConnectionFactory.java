package br.com.fiserv.dataBase;

import java.sql.DriverManager;
import java.sql.Connection;

public class OracleConnectionFactory {

    public static Connection getOracleConnectionFactory() {

        String serverName   = "bkwdbc1.1dc.com";
        String portNumber   = "1521";
        String ssid         = "BKWBZCAT";
        String userName     = "fdb_automation";
        String password     = "fdbautom#1234";
        String classForName = "oracle.jdbc.driver.OracleDriver";

        String url = "jdbc:oracle:thin:@" + serverName + ":" + portNumber + ":" + ssid;
        Connection connection = null;

        try {
            Class.forName(classForName);
            connection = DriverManager.getConnection(url, userName, password);
        } catch (Exception e) {
            throw new RuntimeException(e.getMessage());
        }

        return connection;
    }

}
