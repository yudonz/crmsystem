package com.crazycode.dao;

import com.crazycode.entity.Product;
import org.apache.lucene.queryparser.classic.ParseException;

import java.io.IOException;
import java.util.List;

public interface LuceneMapper {
    //创建索引库
    public void createIndex(List<Product> products) throws IOException;
    //
    public List<Product> searchProduct(String query) throws IOException, ParseException;
}
