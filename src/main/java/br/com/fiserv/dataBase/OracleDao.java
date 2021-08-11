package br.com.fiserv.dataBase;

import br.com.fiserv.file.SearchFile;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.sql.*;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

public class OracleDao {



    public static Map<String, String> select(String query) {
        Locale.setDefault(Locale.ENGLISH);
        Map<String, String> result = new HashMap<>();
        query = query.toLowerCase().endsWith(".sql") ? getQuery(SearchFile.find(query)).replace(";", "") : query;
        try {
            Connection conn = OracleConnectionFactory.getOracleConnectionFactory();
            Statement stmt = conn.createStatement();
            ResultSet rst = stmt.executeQuery(query);
            while (rst.next()) {
                for (int i = 1; i <= rst.getMetaData().getColumnCount(); i++) {
                    result.put(rst.getMetaData().getColumnName(i), rst.getString(i));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;

    }

    public static Map<String, String> select( String fileSql, String ... values) {
        Locale.setDefault(Locale.ENGLISH);
        ResultSet rs = null;
        Map<String, String> result = new HashMap<>();
        Connection conn = OracleConnectionFactory.getOracleConnectionFactory();
        String query = getQuery(SearchFile.find(fileSql)).replace(";", "");
        PreparedStatement pstmt = null;
        try {
            pstmt = conn.prepareStatement(query);
        } catch (SQLException e1) {
            e1.printStackTrace();
        }
        int index = 1;
        System.out.println(fileSql);
        System.out.println(query);
        for (String s : values) {
            try {
                System.out.printf("Parametro%s = '%s'\n", index, s);
                pstmt.setString(index++, s.replace("[", "").replace("]", ""));
            } catch (SQLException e) {
                System.err.println("[SQL] Erro ao converter os parametros! "+ e.getMessage());
            }
        }

        if (query.length() == 0) {
            throw new IllegalArgumentException("Problema com a query do arquivo .sql");
        }

        try {
            rs = pstmt.executeQuery();

            JsonArray array = new JsonArray();

            while (rs.next()) {

                for (int i = 1; i <= rs.getMetaData().getColumnCount(); i++) {
                    result.put(rs.getMetaData().getColumnName(i), rs.getString(i));
                }

            }



        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        }

        try {
            conn.close();
        } catch (SQLException exception) {
            exception.printStackTrace();
        }

        return result;
    }



    public static String getQuery(Path path) {

        List<String> linhas = null;
        StringBuilder query = new StringBuilder();

        try {
            linhas = Files.readAllLines(path, StandardCharsets.ISO_8859_1);
        } catch (IOException e1) {
            e1.printStackTrace();
        }

        for (String linha : linhas) {
            query.append(" " + linha);
        }

        return query.toString();
    }

}
