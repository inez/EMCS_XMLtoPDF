package polandemcs;
import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletContext;
import javax.xml.transform.Source;
import javax.xml.transform.TransformerException;
import javax.xml.transform.URIResolver;
import javax.xml.transform.stream.StreamSource;

public class MyURIResolverImpl implements URIResolver {

	private ServletContext context = null;
	
	public MyURIResolverImpl(ServletContext context) {
		this.context = context;
	}

	public Source resolve(String href, String base) throws TransformerException {
		return new StreamSource(new BufferedInputStream(context.getResourceAsStream("/WEB-INF/emcs_xsl/" + href)));
	}

}
