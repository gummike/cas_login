package com.hesc.core.dao;

import com.hesc.core.pojo.Identifiable;

import java.util.List;

public interface BaseDao<T extends Identifiable> {


    int insert(T var1);

    int delete(T var1);

    int deleteById(String var1);

    int update(T var1);

    Long selectCount(T var1);

    <V extends T> V selectById(String var1);

    <V extends T> List<V> selectList(T var1);

}