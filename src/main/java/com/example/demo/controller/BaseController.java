package com.example.demo.controller;

import com.example.demo.entity.Orders;
import com.example.demo.service.OrdersService;
import com.example.demo.service.ProductService;
import com.example.demo.service.SysLogService;
import com.example.demo.service.UsersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.mail.*;
import javax.mail.internet.MimeUtility;
import javax.mail.search.FlagTerm;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.security.Security;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Properties;

@Controller
@RequestMapping()
public class BaseController {

    @Autowired
    private OrdersService ordersService;

    @Autowired
    private ProductService productService;

    @Autowired
    private UsersService usersService;

    @Autowired
    private SysLogService sysLogService;

    private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    /**
     * 登录
     * @return
     */
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView login() {
        return new ModelAndView("base-login");
    }

    /**
     * 跳转
     * @return
     */
    @RequestMapping(value = "/jump", method = RequestMethod.GET)
    public ModelAndView jump() throws Exception {
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        org.springframework.security.core.userdetails.User user = (org.springframework.security.core.userdetails.User) principal;

        Store store = connectMailServer();
        ArrayList<HashMap> mail = getMail(store);
        store.close();

        ModelAndView mv = new ModelAndView();
        mv.addObject("user", user);
        mv.addObject("mail", mail);
        mv.addObject("loginTime", sdf.format(new Date()));
        mv.setViewName("base-jump");
        return mv;
    }

    /**
     * 首页
     * @return
     */
    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public ModelAndView index() {

        List<Orders> ordersList = ordersService.findPending();
        for (int i = 0; i < ordersList.size(); i++) {
            int id = ordersList.get(i).getId();
            Orders ordersInfo = ordersService.findById(id);
            ordersList.set(i, ordersInfo);
        }

        ModelAndView mv = new ModelAndView();
        mv.addObject("ordersList", ordersList);
        mv.addObject("ordersCount", ordersService.findAll(1,1).getTotal());
        mv.addObject("productCount", productService.findAll(1, 1).getTotal());
        mv.addObject("usersCount", usersService.findAll(1, 1).getTotal());
        mv.addObject("syslogCount", sysLogService.findAll().size());
        mv.setViewName("content-index");
        return mv;
    }

    /**
     * 个人中心
     * @return
     */
    @RequestMapping(value = "/profile", method = RequestMethod.GET)
    public ModelAndView profile() {
        return new ModelAndView("content-profile");
    }

    private ArrayList<HashMap> getMail(Store store) throws MessagingException, UnsupportedEncodingException {
        // 通过imap协议获得Store对象调用这个方法时，邮件夹名称只能指定为"INBOX"
        Folder folder = store.getFolder("INBOX");
        // 设置对邮件帐户的访问权限
        folder.open(Folder.READ_WRITE);
        Message[] messages = folder.getMessages(); // 所有邮件
        Message[] unreadMessage = folder.search(new FlagTerm(new Flags(Flags.Flag.SEEN), false)); // 未读邮件
        ArrayList<HashMap> mail = new ArrayList<>();
        for (Message message : unreadMessage) {
            HashMap<String, Object> i = new HashMap<>();
            i.put("subject", message.getSubject());// 获得邮件主题
            Address from = message.getFrom()[0];
            i.put("sender", decodeText(from.toString()).split(" <")[0]); // 解析发送者,不显示地址
            i.put("date", sdf.format(message.getSentDate())); // 发送时间
            mail.add(i);
            /*Enumeration headers = message.getAllHeaders();
              while (headers.hasMoreElements()) {
                     Header header = (Header)headers.nextElement();
                 }*/ //解析header
            // parseMultipart((Multipart) message.getContent()); // 解析邮件内容
            message.setFlag(Flags.Flag.SEEN, false);//imap读取后邮件状态会变为已读,还原为未读
        }
        folder.close(false);// 关闭邮件夹对象
        return mail;
    }

    private Store connectMailServer() throws MessagingException {
        Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());

        String protocol = "imap";
        String port = "993";
        String imapServer = "imap.qq.com";
        String username = "815379806@qq.com";
        String password = "rapzhodcadlebcij";

        Properties props = new Properties();
        props.setProperty("mail.imap.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.setProperty("mail.imap.socketFactory.fallback", "false");
        props.setProperty("mail.transport.protocol", protocol);
        props.setProperty("mail.imap.port", port);
        props.setProperty("mail.imap.socketFactory.port", port);

        // 获取连接
        Session session = Session.getDefaultInstance(props);
        session.setDebug(false);

        // 获取Store对象
        Store store = session.getStore(protocol);
        store.connect(imapServer, username, password); // 登陆认证
        return store;
    }

    protected static String decodeText(String text) throws UnsupportedEncodingException {
        if (text == null)
            return null;
        if (text.startsWith("=?GB") || text.startsWith("=?gb"))
            text = MimeUtility.decodeText(text);
        else
            text = new String(text.getBytes("ISO8859_1"));
        return text;
    }

    public static void parseMultipart(Multipart multipart) throws MessagingException, IOException {
        int count = multipart.getCount();
        System.out.println("couont =  "+count);
        for (int idx=0;idx<count;idx++) {
            BodyPart bodyPart = multipart.getBodyPart(idx);
            System.out.println(bodyPart.getContentType());
            if (bodyPart.isMimeType("text/plain")) {
                System.out.println("plain................."+bodyPart.getContent());
            } else if(bodyPart.isMimeType("text/html")) {
                System.out.println("html..................."+bodyPart.getContent());
            } else if(bodyPart.isMimeType("multipart/*")) {
                Multipart mpart = (Multipart)bodyPart.getContent();
                parseMultipart(mpart);

            } else if (bodyPart.isMimeType("application/octet-stream")) {
                String disposition = bodyPart.getDisposition();
                System.out.println(disposition);
                if (disposition.equalsIgnoreCase(BodyPart.ATTACHMENT)) {
                    String fileName = bodyPart.getFileName();
                    InputStream is = bodyPart.getInputStream();
                    copy(is, new FileOutputStream("D:\\"+fileName));
                }
            }
        }
    }

    public static void copy(InputStream is, OutputStream os) throws IOException {
        byte[] bytes = new byte[1024];
        int len = 0;
        while ((len=is.read(bytes)) != -1 ) {
            os.write(bytes, 0, len);
        }
        if (os != null)
            os.close();
        if (is != null)
            is.close();
    }
}
