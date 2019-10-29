package com.example.demo.config;

import org.springframework.stereotype.Component;

import javax.mail.Address;
import javax.mail.BodyPart;
import javax.mail.Flags;
import javax.mail.Folder;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Store;
import javax.mail.internet.MimeUtility;
import javax.mail.search.FlagTerm;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.security.Security;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Properties;
import java.util.UUID;

/**
 * @author hyosunghan
 * @since 2019-10-25
 */
@Component
public class EmailServer {

    private static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    public static ArrayList<HashMap> pullMail(String type) throws MessagingException, UnsupportedEncodingException {
        // 连接邮箱服务器
        Store store = connectMailServer();
        // 通过imap协议获得Store对象调用这个方法时，邮件夹名称只能指定为"INBOX"
        Folder folder = store.getFolder("INBOX");
        // 设置对邮件帐户的访问权限
        folder.open(Folder.READ_WRITE);
        Message[] messages = {};
        if ("all".equals(type)) {
            // 所有邮件
            messages = folder.getMessages();
        } else if ("unread".equals(type)) {
            // 未读邮件
            messages = folder.search(new FlagTerm(new Flags(Flags.Flag.SEEN), false));
        }
        ArrayList<HashMap> mail = new ArrayList<>();
        for (Message message : messages) {
            HashMap<String, Object> i = new HashMap<>();
            i.put("id", message.getMessageNumber());
            i.put("subject", message.getSubject());// 获得邮件主题
            Address from = message.getFrom()[0];
            i.put("sender", decodeText(from.toString()).split(" <")[0]); // 解析发送者,不显示地址
            i.put("sentDate", sdf.format(message.getSentDate())); // 发送时间
            Flags flags = message.getFlags();
            if (flags.contains(Flags.Flag.SEEN))
                i.put("status", "read");
            else {
                i.put("status", "unread");
                message.setFlag(Flags.Flag.SEEN, false);//imap读取后邮件状态会变为已读,还原为未读
            }
            mail.add(i);
            /*Enumeration headers = message.getAllHeaders();
              while (headers.hasMoreElements()) {
                     Header header = (Header)headers.nextElement();
                 }*/ //解析header
            // parseMultipart((Multipart) message.getContent()); // 解析邮件内容
        }
        folder.close(false);// 关闭邮件夹对象
        // 断开连接
        store.close();
        return mail;
    }

    public static HashMap getMail(int id) throws MessagingException, IOException {
        // 连接邮箱服务器
        Store store = connectMailServer();
        // 通过imap协议获得Store对象调用这个方法时，邮件夹名称只能指定为"INBOX"
        Folder folder = store.getFolder("INBOX");
        // 设置对邮件帐户的访问权限
        folder.open(Folder.READ_WRITE);

        Message message = folder.getMessage(id);

        HashMap<String, Object> mail = new HashMap<>();
        mail.put("id", message.getMessageNumber());
        mail.put("subject", message.getSubject());// 获得邮件主题
        Address from = message.getFrom()[0];
        mail.put("sender", decodeText(from.toString()).split(" <")[0]); // 解析发送者,不显示地址
        mail.put("sentDate", sdf.format(message.getSentDate())); // 发送时间
        message.setFlag(Flags.Flag.SEEN, true);//imap读取后邮件状态设置为已读

        if (message.getContent() instanceof String && ((String) message.getContent()).startsWith("<")) {
            mail.put("content", message.getContent());
        } else if (message.getContent() instanceof String && !((String) message.getContent()).startsWith("<")){
            mail.put("text", message.getContent());
        } else {
            parseMultipart((Multipart) message.getContent(), mail); // 解析邮件内容
        }

        mail.put("count", folder.getMessageCount());
        if (!mail.containsKey("text")) {
            mail.put("text", "");
        }
        if (!mail.containsKey("content")) {
            mail.put("content", "");
        }

        folder.close(false);// 关闭邮件夹对象
        // 断开连接
        store.close();
        return mail;
    }

    public static Store connectMailServer() throws MessagingException {
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

    public static String decodeText(String text) throws UnsupportedEncodingException {
        if (text == null)
            return null;
        if (text.startsWith("=?GB") || text.startsWith("=?gb"))
            text = MimeUtility.decodeText(text);
        else
            text = new String(text.getBytes("ISO8859_1"));
        return text;
    }

    public static void parseMultipart(Multipart multipart, HashMap<String, Object> mail) throws MessagingException, IOException {
        ArrayList<HashMap> list = new ArrayList<>();

        for (int i=0;i<multipart.getCount();i++) {
            HashMap<String, Object> map = new HashMap<>();
            BodyPart bodyPart = multipart.getBodyPart(i);
//            System.out.println(bodyPart.getContentType());
            if (bodyPart.isMimeType("text/plain")) {
                    mail.put("text",bodyPart.getContent());
//                System.out.println("plain................."+bodyPart.getContent());
            } else if(bodyPart.isMimeType("text/html")) {
                    mail.put("content",bodyPart.getContent());
//                System.out.println("html..................."+bodyPart.getContent());
            } else if(bodyPart.isMimeType("multipart/*")) {
                Multipart mpart = (Multipart)bodyPart.getContent();
                parseMultipart(mpart, mail);
            } else if (bodyPart.isMimeType("application/octet-stream")) {
                String disposition = bodyPart.getDisposition();
//                System.out.println(disposition);
//                if (disposition.equalsIgnoreCase(BodyPart.ATTACHMENT)) {
//                    copy(bodyPart.getInputStream(), new FileOutputStream("D:\\"+UUID.randomUUID().toString()/*bodyPart.getFileName()*/));
//                }
            }
            list.add(map);
        }
        mail.put("multipart", list);
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
