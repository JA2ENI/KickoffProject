package com.teamcommit.kickoff.Dao;


import com.teamcommit.kickoff.Common.AbstractDAO;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository("placeDAO")
public class PlaceDAO extends AbstractDAO {

    public void insertFutsal(Map<String, Object> map) throws Exception {
        insert("com.teamcommit.kickoff.Dao.place.insertFutsal", map);
    }

}