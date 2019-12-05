package com.crazycode.config;

import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriterConfig;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.wltea.analyzer.lucene.IKAnalyzer;

import java.io.File;
import java.io.IOException;

@Configuration
public class LuceneConfig {

    private static final String INDEXPATH = "e://index";

    @Bean
    public Analyzer analyzer() {
        return new IKAnalyzer();
    }

    @Bean
    public Directory directory() throws IOException {
        File dir = new File(INDEXPATH);
        if (!dir.exists()) {
            dir.mkdirs();
        }
        return FSDirectory.open(dir.toPath());
    }

    @Bean
    public IndexWriter indexWriter(Directory directory, Analyzer analyzer) throws IOException {
        IndexWriter indexWriter = new IndexWriter(directory, new IndexWriterConfig(analyzer));
        System.out.println("删除索引库");
        indexWriter.deleteAll();
        indexWriter.commit();
        return indexWriter;
    }
}
