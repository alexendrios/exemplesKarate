package br.com.fiserv.file;

import java.io.IOException;
import java.nio.file.FileVisitResult;
import java.nio.file.Path;
import java.nio.file.SimpleFileVisitor;
import java.nio.file.attribute.BasicFileAttributes;

public class SearchFileVisitor extends SimpleFileVisitor<Path> {

    private String fileName;
    private Path fileFound;

    public SearchFileVisitor(String fileName) {
        this.fileName = fileName;
    }

    public Path getFileFound() {
        if(this.fileFound != null) {
            return this.fileFound;
        }
        throw new RuntimeException("arquivo não localizado");
    }

    @Override
    public FileVisitResult visitFile(Path file, BasicFileAttributes attr) throws IOException {
        if (file.getFileName().toString().toLowerCase().endsWith(fileName.toLowerCase()) && fileFound == null) {
            fileFound = file.toAbsolutePath();
        }
        return FileVisitResult.CONTINUE;
    }
}
