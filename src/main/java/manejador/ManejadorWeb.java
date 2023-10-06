package manejador;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;

import javax.xml.parsers.ParserConfigurationException;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;

import org.xml.sax.Attributes;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;
import org.xml.sax.XMLReader;
import org.xml.sax.helpers.DefaultHandler;

import model.Incidente;

public class ManejadorWeb extends DefaultHandler {

	private XMLReader xr;
	private String lastContent;
	private InputSource is;
	private ArrayList<Incidente> incidentesList;
	private Incidente incidente;
	private boolean isItem = false;

	public ManejadorWeb(String strUrl) {
		SAXParserFactory parserFactory = SAXParserFactory.newInstance();
        parserFactory.setNamespaceAware(true);
        SAXParser parser;
		try {
			parser = parserFactory.newSAXParser();
	        xr = parser.getXMLReader();
	        this.is=new InputSource(new URL(strUrl).openStream());
		} catch (ParserConfigurationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SAXException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		xr.setContentHandler(this);
		xr.setErrorHandler(this);
	}

	public ArrayList<Incidente> parsear() {
		// En este caso como el xml esta en Internet debemos crear el stream y
		// con este el source
		try {
			// La llamada a este metodo es el que desencadena todo el proceso
			xr.parse(this.is);
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (SAXException e) {
			e.printStackTrace();
		}
		return incidentesList;
	}

	@Override
	public void startDocument() throws SAXException {
		incidentesList = new ArrayList<Incidente>();
	}

	@Override
	public void startElement(String uri, String localName, String qName, Attributes attributes) throws SAXException {
		// TODO Auto-generated method stub
		super.startElement(uri, localName, qName, attributes);
		lastContent = "";
		if (localName.equals("item")) {
			incidente = new Incidente();
			isItem = true;
		}
	}

	@Override
	public void endElement(String uri, String localName, String qName) throws SAXException {
		// TODO Auto-generated method stub
		super.endElement(uri, localName, qName);
		if (localName.equals("item")) {
			incidentesList.add(incidente);
			isItem = false;
		} else if (localName.equals("title") && isItem) {
			incidente.setCausa(lastContent);
		} else if (localName.equals("link") && isItem) {
			incidente.setLink(lastContent);
		} else if (localName.equals("pubDate") && isItem) {
			incidente.setFecha(lastContent);
		} else if (localName.equals("description") && isItem) {
			incidente.setDescripcion(lastContent);
			incidente.setIcon(lastContent);
		}
	}
	
	@Override
	public void characters(char[] ch, int start, int length)
			throws SAXException {
		lastContent += String.valueOf(ch, start, length);
	}

}
