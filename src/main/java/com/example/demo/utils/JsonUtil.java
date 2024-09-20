package com.example.demo.utils;

import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.*;
import com.fasterxml.jackson.databind.type.CollectionType;
import org.springframework.util.StringUtils;

import java.io.IOException;
import java.io.StringReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class JsonUtil {

    private static final ObjectMapper OBJECT_MAPPER = new ObjectMapper();

    private static final ObjectMapper OBJECT_NULL_MAPPER = new ObjectMapper();

    static {
        OBJECT_MAPPER.setSerializationInclusion(Include.NON_NULL);

        OBJECT_MAPPER.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);

        OBJECT_NULL_MAPPER.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
		/*
		// 序列化和反序列化的时候针对浮点类型使用BigDecimal转换，避免精度损失和科学计数法
		OBJECT_MAPPER.enable(DeserializationFeature.USE_BIG_DECIMAL_FOR_FLOATS);
		OBJECT_MAPPER.disable(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES);
		SimpleModule simpleModule = new SimpleModule();
		simpleModule.addSerializer(Double.class, BigDecimalForDoubleSerializer.SINGLETON);
		OBJECT_MAPPER.registerModule(simpleModule);
		OBJECT_MAPPER.setSerializationInclusion(Include.NON_NULL);
		 */
    }

    public static String writeValueAsString(Object object) {
        try {
            return OBJECT_MAPPER.writeValueAsString(object);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    public static String writeValueAsStringRetainNull(Object object) {
        try {
            return OBJECT_NULL_MAPPER.writeValueAsString(object);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    public static <T> T writeValueAsObject(String json, Class<T> targetClass) {
        try {
            return OBJECT_MAPPER.readValue(json, targetClass);
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    public static <T> T writeValueAsObjectRetainNull(String json, Class<T> targetClass) {
        try {
            return OBJECT_NULL_MAPPER.readValue(json, targetClass);
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    public static <T> List<T> writeValueAsList(String json, Class<T> targetClass) {
        try {
            CollectionType listType = OBJECT_MAPPER.getTypeFactory().constructCollectionType(ArrayList.class, targetClass);
            return OBJECT_MAPPER.readValue(json, listType);
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    public static <T> T writeObjectAsObject(Object object, Class<T> targetClass) {
        return writeValueAsObject(writeValueAsString(object), targetClass);
    }

    public static <T> List<T> writeObjectAsList(Object object, Class<T> targetClass) {
        return writeValueAsList(writeValueAsString(object), targetClass);
    }

    public static JsonNode readTree(Object obj) {
        try {
            if (obj instanceof String) {
                return OBJECT_NULL_MAPPER.readTree((String) obj);
            }
            return OBJECT_NULL_MAPPER.readTree(JsonUtil.writeValueAsString(obj));
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    public static boolean validate(String string) {
        try {
            OBJECT_NULL_MAPPER.readTree(string);
            return true;
        } catch (JsonParseException e) {
            return false;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}