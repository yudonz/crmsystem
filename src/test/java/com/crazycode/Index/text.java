package com.crazycode.Index;

import com.crazycode.entity.Product;
import com.crazycode.service.IProductService;
import com.crazycode.service.LuceneService;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.document.TextField;
import org.apache.lucene.index.*;
import org.apache.lucene.queryparser.classic.ParseException;
import org.apache.lucene.queryparser.classic.QueryParser;
import org.apache.lucene.search.*;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.wltea.analyzer.lucene.IKAnalyzer;

import java.io.File;
import java.io.IOException;
import java.util.List;

@SpringBootTest
public class text {
    @Autowired
    IProductService productService;
    @Autowired
    LuceneService luceneService;

    @Test
    void create() throws IOException {
        Directory directory = FSDirectory.open(new File("e:\\index").toPath());
        IndexWriter indexWriter = new IndexWriter(directory, new IndexWriterConfig(new IKAnalyzer()));
        List<Product> list = productService.list();
        System.out.println(list);
        for (Product product : list) {
            Document document = new Document();
            Field id = new TextField("id", product.getId(), Field.Store.YES);
            Field productNum = new TextField("productNum", product.getProductNum(), Field.Store.YES);
            Field productName = new TextField("productName", product.getProductName(), Field.Store.YES);
            Field cityName = new TextField("cityName", product.getCityName(), Field.Store.YES);
            Field departureTime = new TextField("departureTime", product.getDepartureTime(), Field.Store.YES);
            Field productPrice = new TextField("productPrice", product.getProductPrice().toString(), Field.Store.YES);
            Field productDesc = new TextField("productDesc", product.getProductDesc(), Field.Store.YES);
            Field productStatus = new TextField("productStatus", product.getProductStatus().toString(), Field.Store.YES);
            document.add(id);
            document.add(productNum);
            document.add(productName);
            document.add(cityName);
            document.add(departureTime);
            document.add(productPrice);
            document.add(productDesc);
            document.add(productStatus);
            indexWriter.addDocument(document);
        }
        indexWriter.close();
    }

    @Test
    void search() throws IOException, ParseException {
        Directory directory = FSDirectory.open(new File("e://index").toPath());
        IndexReader indexReader = DirectoryReader.open(directory);
        IndexSearcher indexSearcher = new IndexSearcher(indexReader);

//        QueryParser queryParser = new QueryParser("productDesc", new IKAnalyzer());
//        Query query = queryParser.parse("欧洲");
        Query query=new TermQuery(new Term("productDesc", "欧洲"));

        TopDocs topDocs = indexSearcher.search(query, 10);
        System.out.println(topDocs.totalHits);
        for (ScoreDoc scoreDoc : topDocs.scoreDocs) {
            int doc = scoreDoc.doc;
            Document document = indexSearcher.doc(doc);
            System.out.println(document.get("productDesc"));
        }
        indexReader.close();
    }

    @Test
    void search2() throws IOException, ParseException {
        List<Product> list = luceneService.searchProduct("欧洲");
        System.out.println(list);
    }
}
