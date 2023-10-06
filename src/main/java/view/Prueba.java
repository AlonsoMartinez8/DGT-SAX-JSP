package view;

import java.util.ArrayList;

import manejador.ManejadorWeb;
import model.Incidente;

public class Prueba {

	public static void main(String[] args) {
		
		ManejadorWeb manejador = new ManejadorWeb("https://infocar.dgt.es/etraffic/rss_ca_13.xml");
		ArrayList<Incidente> incidentes = manejador.parsear();
		
		for (Incidente i:incidentes) {
			System.out.println(i);
		}

	}

}
