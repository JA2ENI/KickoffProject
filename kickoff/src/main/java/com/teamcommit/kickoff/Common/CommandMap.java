package com.teamcommit.kickoff.Common;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

public class CommandMap {

    Map<String, Object> map = new HashMap<String, Object>();

    public Object get(String key) {
        return map.get(key);
    }

    public void put(String key, Object value) {
        map.put(key, value);
    }

    public Object remove(String key) {
        return map.remove(key);
    }

    public void clear() {
        map.clear();
    }

    public boolean isEmpty() {
        return map.isEmpty();
    }

    public Map<String, Object> getMap() {
        return map;
    }
}
