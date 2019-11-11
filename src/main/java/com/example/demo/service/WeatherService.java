package com.example.demo.service;

import org.json.JSONObject;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.util.logging.Logger;

/**
 * @author hyosunghan
 * @since 2019-11-09
 */
@Service
public class WeatherService {

    private Logger log = Logger.getLogger("WeatherService");

    @Async("taskExecutor")
    public void pullCityList() throws Exception{
        log.info("开始拉取城市列表");
        URL u = new URL("http://api.k780.com/?app=weather.city&cou=1&appkey=10003&sign=b59bc3ef6191eb9f747dd4e83c99f2a4&format=json");
        JSONObject data = new JSONObject(getString(u)).optJSONObject("result").optJSONObject("datas");

        data.keySet().parallelStream().forEach(i -> {
            JSONObject object = data.optJSONObject(i);

//            String aqi = null;
//            try {
//                URL u1 = new URL("http://api.k780.com/?app=weather.pm25&weaid=" + object.optString("weaid") + "&appkey=10003&sign=b59bc3ef6191eb9f747dd4e83c99f2a4&format=json");
//                aqi = new JSONObject(getString(u1)).optJSONObject("result").optString("aqi");
//            } catch (IOException e) {
//                e.printStackTrace();
//            }

            System.out.println(/*object.optString("weaid") + */":"
                    + object.optString("area_1") + ":"
                    + object.optString("area_2") + ":"
                    + object.optString("area_3"));
        });
        log.info("完成城市列表拉取");
    }

    private String getString(URL u) throws IOException {
        InputStream in = u.openStream();
        ByteArrayOutputStream out = new ByteArrayOutputStream();
        try {
            byte buf[] = new byte[1024];
            int read = 0;
            while ((read = in.read(buf)) > 0) {
                out.write(buf, 0, read);
            }
        } finally {
            if (in != null) {
                in.close();
            }
        }
        byte b[] = out.toByteArray();
        return new String(b, "utf-8");
    }
}
