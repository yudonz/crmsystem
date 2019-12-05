package com.crazycode.service.impl;

import com.crazycode.entity.Product;
import com.crazycode.dao.LuceneMapper;
import com.crazycode.mapper.ProductMapper;
import com.crazycode.service.LuceneService;
import org.apache.lucene.queryparser.classic.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.List;
@Service
public class LuceneServiceImpl implements LuceneService {

    @Autowired
    LuceneMapper luceneMapper;

    @Autowired
    ProductMapper productMapper;

    @Override
    public void createProductIndex() throws IOException {
        List<Product> products = productMapper.selectAll();
        System.out.println(products);
        luceneMapper.createIndex(products);
    }

    @Override
    public List<Product> searchProduct(String query) throws IOException, ParseException {
        return luceneMapper.searchProduct(query);
    }
}
