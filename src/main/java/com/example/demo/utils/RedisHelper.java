package com.example.demo.utils;

import org.springframework.dao.DataAccessException;
import org.springframework.data.redis.connection.RedisConnection;
import org.springframework.data.redis.connection.RedisStringCommands;
import org.springframework.data.redis.connection.RedisZSetCommands;
import org.springframework.data.redis.core.RedisCallback;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.types.Expiration;

import java.nio.charset.Charset;
import java.util.Collection;
import java.util.List;
import java.util.Random;
import java.util.Set;
import java.util.UUID;
import java.util.concurrent.TimeUnit;

/**
 * @author: moc
 * @date: 2018/11/8 4:56 PM
 */
public class RedisHelper {

    public static final Charset utf8 = Charset.forName("utf8");

    /**
     * 模糊查询键
     * @author hyosunghan
     * @date 2019/11/21 17:17:45
     * @param redis
     * @param keyPre
     * @return
     */
    public static Set parttenKeys(RedisTemplate<String, String> redis, final String keyPre) {
        return redis.keys(keyPre + "*");
    }

    /**
     * 批量查询值
     * @author hyosunghan
     * @date 2019/11/21 17:19:23
     * @param redis
     * @param keys
     * @return
     */
    public static List bulkValues(RedisTemplate<String, String> redis, final Set keys) {
        return redis.opsForValue().multiGet(keys);
    }

    /**
     * 设置值
     */
    public static void set(RedisTemplate<String, String> redis, final String hkey, final String value) {
        redis.opsForValue().set(hkey, value);
    }

    /**
     * 设置值-并设置过期时间
     */
    public static void set(RedisTemplate<String, String> redis, final String hkey, final String value, final Long timeout, final TimeUnit unit) {
        redis.opsForValue().set(hkey, value, timeout, unit);
    }

    /**
     * 获取值
     */
    public static String get(RedisTemplate<String, String> redis, final String hmKey) {
        return redis.opsForValue().get(hmKey);
    }
//
//    /**
//     * 获取值
//     */
//    public static <T> T get(RedisTemplate<String, String> redis, final String hmKey, Class<T> clazz) {
//        String str = get(redis, hmKey);
//        if (!StringUtils.isEmpty(str)) {
//            return JsonWriteContext.toBean(str, clazz);
//        }
//        return null;
//    }

    /**
     * 删除
     */
    public static void delete(RedisTemplate<String, String> redis, String key) {
        redis.delete(key);
    }

    /**
     * 设置值,如果存在，则忽略并返回false
     */
    public static boolean setNX(RedisTemplate<String, String> redis, final String hkey, final String value) {
        return redis.opsForValue().setIfAbsent(hkey, value);
    }

    /**
     * 设置值-并设置过期时间,如果存在，则忽略并返回false
     */
    public static boolean setNX(RedisTemplate<String, String> redis, final String hkey, final String value, final Integer timeout) {
        return setNX(redis, hkey, value, timeout, TimeUnit.SECONDS);
    }

    /**
     * 设置值-并设置过期时间,如果存在，则忽略并返回false。
     */
    public static boolean setNX(RedisTemplate<String, String> redis, final String hkey, final String value, final Integer timeout, TimeUnit timeUnit) {
        return redis.execute(new RedisCallback<Boolean>() {
            @Override
            public Boolean doInRedis(RedisConnection redisConnection) throws DataAccessException {
                return redisConnection.set(hkey.getBytes(), value.getBytes(), Expiration.from(timeout, timeUnit), RedisStringCommands.SetOption.SET_IF_ABSENT);
            }
        });
    }

    /**
     * 过期key
     * 制定key过期时间
     */
    public static boolean expire(RedisTemplate<String, String> redis, final String key, Long timeout) {
        return redis.expire(key, timeout, TimeUnit.SECONDS);
    }

    /**
     * 过期key
     */
    public static boolean expire(RedisTemplate<String, String> redis, final String key) {
        return redis.expire(key, 0, TimeUnit.SECONDS);
    }

    /**
     * 验证是否过期
     */
    public static boolean isExpired(RedisTemplate<String, String> redis, final String key) {
        return redis.hasKey(key) && redis.getExpire(key) > 0;
    }

    /**
     * 验证是否存在
     */
    public static boolean contain(RedisTemplate<String, String> redis, final String key) {
        return redis.hasKey(key);
    }

    /**
     * 获取唯一Id
     *
     * @param key
     * @param delta 增加量（不传采用1）
     * @return
     * @throws Exception
     */
    public static String incrementString(RedisTemplate<String, String> redis, String key, Long delta) {
        try {
            if (null == delta){
                delta = 1L;
            }
            return redis.opsForValue().increment(key, delta).toString();
        } catch (Exception e) {
            //redis宕机时采用uuid的方式生成唯一id
            int first = new Random(10).nextInt(8) + 1;
            int randNo = UUID.randomUUID().hashCode();
            if (randNo < 0) {
                randNo = -randNo;
            }
            return first + String.format("%16d", randNo);
        }
    }

    /**
     * 自增值
     * @param redis
     * @param key
     * @param delta 增加量（不传采用1）
     * @return
     */
    public static Long increment(RedisTemplate<String,String> redis, String key, Long delta) {
        try {
            if (null == delta){
                delta=1L;
            }
            return redis.opsForValue().increment(key, delta);
        } catch (Exception e) {
            return null;
        }
    }

    /**
     * 自增值1
     * @param redis
     * @param key
     * @return
     */
    public static Long increment(RedisTemplate<String,String> redis, String key) {
        return increment(redis, key, 1L);
    }

    /**
     * 返回集合中所有元素
     *
     * @return
     * @paramkey
     */
    public static Set<String> members(RedisTemplate<String, String> redis, String key) {
        return redis.opsForSet().members(key);
    }

    /**
     * 添加set元素
     *
     * @return
     * @paramkey
     * @paramvalues
     */
    public static Long addSet(RedisTemplate<String, String> redis, String key, String... values) {
        return redis.opsForSet().add(key, values);
    }

    /**
     * 判断set集合中是否有value
     *
     * @return
     * @paramkey
     * @paramvalue
     */
    public static boolean isMember(RedisTemplate<String, String> redis, String key, Object value) {
        return redis.opsForSet().isMember(key, value);
    }

    public static Boolean zAdd(RedisTemplate<String, String> redis, final String key, final Object value, final double score) {
        return redis.execute(new RedisCallback<Boolean>() {
            @Override
            public Boolean doInRedis(RedisConnection connection) throws DataAccessException {
//                String v;
//                if (value instanceof Object) {
//                    v = JsonHelper.objectToJson(value);
//                } else {
//                    v = value.toString();
//                }
                String v = value.toString();
                return connection.zAdd(key.getBytes(utf8), score, v.getBytes(utf8));
            }
        });
    }

    /**
     * 指定list从左入栈
     *
     * @paramkey
     * @return当前队列的长度
     */
    public static Long leftPush(RedisTemplate<String, String> redis, String key, String value) {
        return redis.opsForList().leftPush(key, value);
    }

    /**
     * 指定list从左出栈
     * 如果列表没有元素,会在100毫秒内返回空，或者获取到100毫秒内的新值
     *
     * @paramkey
     * @return出栈的值
     */
    public static String leftPop(RedisTemplate<String, String> redis, String key) {
        return redis.opsForList().leftPop(key, 100L, TimeUnit.MILLISECONDS);
    }

    /**
     * 指定list从左入栈
     *
     * @paramkey
     * @return当前队列的长度
     */
    public static Long leftPushAll(RedisTemplate<String, String> redis, String key, Collection<String> value) {
        return redis.opsForList().leftPushAll(key, value);
    }

    /**
     * 获取队列的长度
     * @paramkey
     * @return出栈的值
     */
    public static Long listSize(RedisTemplate<String, String> redis, String key) {
        return redis.opsForList().size(key);
    }


    public static Set<RedisZSetCommands.Tuple> zRange(RedisTemplate<String, String> redis, String key, long start, long stop){
        return redis.execute(new RedisCallback< Set<RedisZSetCommands.Tuple>>() {
            public  Set<RedisZSetCommands.Tuple> doInRedis(RedisConnection connection) throws DataAccessException {
                Set<RedisZSetCommands.Tuple> tuples = connection.zRangeWithScores(key.getBytes(utf8), start, stop);
                return tuples;
            }
        });
    }

    public static Long zrem(RedisTemplate<String, String> redis, String key,String values){
        return redis.execute(new RedisCallback<Long>() {
            public  Long doInRedis(RedisConnection connection) throws DataAccessException {
                Long tuples = connection.zRem(key.getBytes(utf8),values.getBytes(utf8));
                return tuples;
            }
        });
    }

}
