package com.crazycode.service;

import com.crazycode.entity.Product;
import org.apache.lucene.queryparser.classic.ParseException;

import java.io.IOException;
import java.util.List;

public interface LuceneService {

    //创建索引库
    public void createProductIndex() throws IOException;
    //
    public List<Product> searchProduct(String query) throws IOException, ParseException;
}
