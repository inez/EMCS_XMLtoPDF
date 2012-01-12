package polandemcs;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;
import java.util.logging.Logger;

import javax.activation.DataHandler;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.Part;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.util.ByteArrayDataSource;
import javax.servlet.ServletContext;
import javax.servlet.http.*;
import javax.xml.transform.Result;
import javax.xml.transform.Source;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamResult;
import javax.xml.transform.stream.StreamSource;

import org.apache.fop.apps.Driver;
import org.apache.fop.configuration.Configuration;
import org.apache.fop.configuration.ConfigurationReader;
import org.xml.sax.InputSource;

@SuppressWarnings("serial")
public class MailHandlerServlet extends HttpServlet {

	private static final Logger log = Logger.getLogger(MailHandlerServlet.class.getName());
	 
	private ByteArrayOutputStream transformXML(InputStream xml, InputStream xsl) throws Exception {
		TransformerFactory factory = TransformerFactory.newInstance();
		factory.setURIResolver(new MyURIResolverImpl(getServletContext()));
		
		Source xslt = new StreamSource(new BufferedInputStream(xsl));
		Source src = new StreamSource(new BufferedInputStream(xml));
		
		ByteArrayOutputStream bout = new ByteArrayOutputStream();
		OutputStream out = new BufferedOutputStream(bout);
		Result res = new StreamResult(out);

		Transformer transformer = factory.newTransformer(xslt);
		transformer.setOutputProperty("indent", "yes");
		transformer.setOutputProperty("{http://xml.apache.org/xslt}indent-amount", "2");
		transformer.transform(src, res);

		return bout;
	}
	
	private ByteArrayOutputStream convertToPDF(ByteArrayOutputStream stream) throws Exception {
		ServletContext context = getServletContext();
		
		InputStream inputStream = context.getResourceAsStream("/WEB-INF/emcs_fonts/fopconfig.xml");
		InputSource inputSource = new InputSource(inputStream);
		ConfigurationReader cr = new ConfigurationReader(inputSource);
		cr.start();
		Configuration.put("baseDir", context.getRealPath("/WEB-INF/emcs_fonts/"));
		
		InputSource source = new InputSource(new ByteArrayInputStream(stream.toByteArray()));
		ByteArrayOutputStream pdf = new ByteArrayOutputStream();
		Driver driver = new Driver(source, pdf);
		
		driver.setRenderer(1);
		driver.run();
		
		return pdf;
	}
	
	private void process(Message message, Part part, Session session) throws Exception {
		String fileName = part.getFileName();

		if(fileName != null) {
			ServletContext context = getServletContext();
			InputStream xml = part.getInputStream();
			InputStream xsl = null;
			String filenamePart1 = null;
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			String filenamePart2 = sdf.format(new Date());
			
			if(fileName.equals("CD801.xml") || fileName.equals("IE801.xml")) {
				xsl = context.getResourceAsStream("/WEB-INF/emcs_xsl/IE801.xsl");
				filenamePart1 = "801";
			}
			
			if(xsl != null && filenamePart1 != null) {

				ByteArrayOutputStream bout = transformXML(xml, xsl);
				ByteArrayOutputStream pdf = convertToPDF(bout);
				
				String messageFrom = ((InternetAddress)message.getFrom()[0]).getAddress();
				String messageTo = ((InternetAddress)message.getRecipients(Message.RecipientType.TO)[0]).getAddress();
				String replyto;

				if(messageTo.equals("polandemcs@polandemcs.appspotmail.com") || messageTo.equals("emcspoland@gmail.com")) {
					replyto = messageFrom;
				} else {
					replyto = messageTo;
				}

				Message msg = new MimeMessage(session);
				msg.setFrom(new InternetAddress("polandemcs@polandemcs.appspotmail.com"));
				msg.addRecipient(Message.RecipientType.TO, new InternetAddress(replyto));
				msg.setSubject(message.getSubject() + " (PDF)");
				
				Multipart mp = new MimeMultipart();

				MimeBodyPart htmlPart = new MimeBodyPart();
				htmlPart.setContent("XML -> PDF", "text/html");
				mp.addBodyPart(htmlPart);
				
				MimeBodyPart attachment = new MimeBodyPart();
				attachment.setFileName(filenamePart2 + " " + filenamePart1 + ".pdf");
		        attachment.setDataHandler(new DataHandler(new ByteArrayDataSource(pdf.toByteArray(), "application/pdf")));
				mp.addBodyPart(attachment);

				msg.setContent(mp);
				Transport.send(msg);
			}
		}
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {

		Properties props = new Properties(); 
        Session session = Session.getDefaultInstance(props, null);

        try {
        	MimeMessage message = new MimeMessage(session, req.getInputStream());

        	if(message.isMimeType("multipart/*")) {
        		Multipart mp = (Multipart)message.getContent();
    			int count = mp.getCount();
    			for (int i = 0; i < count; i++) {
    				Part part = mp.getBodyPart(i);
    				this.process(message, part, session);
    			}
        	}
        	
        } catch (Exception e) {
        	log.info(e.getMessage());
        }

	}
}
