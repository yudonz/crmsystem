package com.crazycode.dao.impl;

import com.crazycode.entity.Product;
import com.crazycode.dao.LuceneMapper;
import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.document.TextField;
import org.apache.lucene.index.DirectoryReader;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.queryparser.classic.ParseException;
import org.apache.lucene.queryparser.classic.QueryParser;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.TopDocs;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Repository
public class LuceneMapperImpl implements LuceneMapper {
    @Autowired
    Analyzer analyzer;

    @Autowired
    IndexWriter indexWriter;

    @Override
    public void createIndex(List<Product> products) throws IOException {
        for (Product product:products){
            Document document=new Document();
            document.add(new TextField("id", product.getId(), Field.Store.YES));
            document.add(new TextField("productNum", product.getProductNum(), Field.Store.YES));
            document.add(new TextField("productName", product.getProductName(), Field.Store.YES));
            document.add(new TextField("cityName", product.getCityName(), Field.Store.YES));
            document.add(new TextField("departureTime", product.getDepartureTime(), Field.Store.YES));
            document.add(new TextField("productPrice", product.getProductPrice().toString(), Field.Store.YES));
            document.add(new TextField("productDesc", product.getProductDesc(), Field.Store.YES));
            document.add(new TextField("productStatus", product.getProductStatus().toString(), Field.Store.YES));
            indexWriter.addDocument(document);
        }
        indexWriter.commit();
    }

    @Override
    public List<Product> searchProduct(String queryStr) throws IOException, ParseException {
        Directory directory= FSDirectory.open(new File("e://index").toPath());
        IndexReader indexReader= DirectoryReader.open(directory);
        IndexSearcher indexSearcher=new IndexSearcher(indexReader);

        QueryParser queryParser=new QueryParser("productDesc",analyzer);
        Query query=queryParser.parse(queryStr);

        TopDocs topDocs=indexSearcher.search(query,20);
        System.out.println("查询结果"+topDocs.totalHits);

        List<Product> list=new ArrayList<>();
        ScoreDoc[] scoreDocs = topDocs.scoreDocs;
        for(ScoreDoc scoreDoc:scoreDocs){
            int doc = scoreDoc.doc;
            Document document=indexSearcher.doc(doc);
            Product product=new Product();
            product.setId(document.get("id"));
            product.setProductNum(document.get("num"));
            product.setCityName(document.get("cityName"));
            product.setProductStatus(Integer.parseInt(document.get("productStatus")));
            product.setProductDesc(document.get("productDesc"));
            product.setDepartureTime(document.get("departureTime"));
            product.setProductPrice(Double.valueOf(document.get("productPrice")));
            product.setProductName(document.get("productName"));
            list.add(product);
        }
        return list;
    }
}
