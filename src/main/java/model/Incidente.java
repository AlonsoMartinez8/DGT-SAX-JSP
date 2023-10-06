package model;

public class Incidente {
	private String causa;
	private String fecha;
	private String link;
	private String descripcion;
	private String icon;
	public Incidente() {
		super();
	}
	public Incidente(String causa, String fecha, String link, String descripcion, String icon) {
		super();
		this.causa = causa;
		this.fecha = fecha;
		this.link = link;
		this.descripcion = descripcion;
		this.icon = icon;
	}
	public String getCausa() {
		return causa;
	}
	public void setCausa(String causa) {
		this.causa = causa;
	}
	public String getFecha() {
		return fecha;
	}
	public void setFecha(String fecha) {
		this.fecha = fecha;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		String text = "<br/>";
		String content;
		int index = descripcion.indexOf(text);
		if(index == -1) {
			content = "";
		} else {
			content = descripcion.substring(index+11, descripcion.length()-7);
		}
		this.descripcion = content;
	}
	public String getIcon() {
		return icon;
	}
	public void setIcon(String descripcion) {
		String icon = "https://infocar.dgt.es/etraffic/";
		String img = "";
		int indexStart, indexEnd;
		
		indexStart = descripcion.indexOf("src='");
		indexEnd = descripcion.indexOf(".png");
		img = descripcion.substring(indexStart+5, indexEnd+4);
		icon+=img;
		
		this.icon = icon;
	}
	@Override
	public String toString() {
		return "Incidente [\ncausa = " + causa + "\nfecha = " + fecha + "\nlink = " + link + "\ndescripcion = " + descripcion + "\nicon = " + icon + "\n]\n";
	}
}
