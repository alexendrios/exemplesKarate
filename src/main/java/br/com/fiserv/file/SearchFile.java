package br.com.fiserv.file;


import java.io.IOException;
import java.nio.file.FileVisitor;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

public class SearchFile {


    public static Path find(String fileName) {


        SearchFileVisitor searchFileVisitor = new SearchFileVisitor(fileName);
        try {
            Files.walkFileTree(Paths.get("."), searchFileVisitor);
        } catch (IOException e) {
            throw new RuntimeException(e.getMessage());
        }
        return searchFileVisitor.getFileFound();
    }
}
