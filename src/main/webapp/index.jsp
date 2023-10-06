<%@page import="model.Incidente"%>
<%@page import="java.util.ArrayList"%>
<%@page import="manejador.ManejadorWeb"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <!doctype html>
    <html lang="en">
    
    <head>
        <title>traficoSAX</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous" />
    </head>
    
    <body class="bg-dark">
    <%
        ManejadorWeb manejador = new ManejadorWeb("https://infocar.dgt.es/etraffic/rss_ca_13.xml");
    	ArrayList<Incidente> incidentes = manejador.parsear();
    %>
    
        <div class="container bg-light p-0">
    
            <nav class="navbar navbar-expand navbar-light shadow mb-5">
                <ul class="nav navbar-nav align-items-center justify-content-between w-100 px-3">
                    <li class="nav-item">
                        <a class="nav-link img-fluid" href="#" aria-current="page"><img
                                src="img/dgtMinisterioInteriorLogo.jpg" alt="logo" width="200" /></a>
                    </li>
                    <li class="nav-item">
                        <h3 class="text-muted">REGISTRO DE INCIDENTES DE TRAFICO</h3>
                    </li>
                </ul>
            </nav>
    
            <div class="row m-0 p-3 d-flex align-items-center">
    
                <div id="carouselId" class="carousel slide col-12 col-md-6 p-0" style="max-height: 300px;"
                    data-bs-ride="carousel">
                    <ol class="carousel-indicators">
                        <li data-bs-target="#carouselId" data-bs-slide-to="0" class="active" aria-current="true"
                            aria-label="First slide"></li>
                        <li data-bs-target="#carouselId" data-bs-slide-to="1" aria-label="Second slide"></li>
                        <li data-bs-target="#carouselId" data-bs-slide-to="2" aria-label="Third slide"></li>
                    </ol>
                    <div class="carousel-inner text-center" style="max-height: 300px;" role="listbox">
                        <div class="carousel-item active">
                            <img class="img-fluid" width="600" src="img/i1.jpg" alt="First slide">
                        </div>
                        <div class="carousel-item">
                            <img class="img-fluid" width="600" src="img/i2.jpg" alt="Second slide">
                        </div>
                        <div class="carousel-item">
                            <img class="img-fluid" width="600" src="img/i3.jpg" class="w-100 d-block" alt="Third slide">
                        </div>
                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselId" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carouselId" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>
    
                <div class="col-12 col-md-6 py-3">
                    <h4 class="text-center text-muted">A un clic</h4>
                    <div class="list list-group click p-0">
                        <p class="text-center">
                            <a href="http://www.interior.gob.es/" class="list-group-item list-group-item-action"
                                target="_blank">Ministerio
                                del Interior</a>
    
                            <a href="https://datos.gob.es/" class="list-group-item list-group-item-action"
                                target="_blank">Datos
                                abiertos del Gobierno de España</a>
    
                            <a href="https://administracion.gob.es/" class="list-group-item list-group-item-action"
                                target="_blank">Punto de
                                acceso a las Administraciones Públicas</a>
    
                            <a href="https://clave.gob.es/clave_Home/clave.html"
                                class="list-group-item list-group-item-action" target="_blank">Cl@ve</a>
    
                            <a href="https://transparencia.gob.es/" class="list-group-item list-group-item-action"
                                target="_blank">Portal
                                de Transparencia de la AGE</a>
                        </p>
                    </div>
                </div>
            </div>
    
            <div class="row m-0 p-3">
                <h3 class="text-center mt-4 py-3 shadow bg-warning">INCIDENTES</h3>
                <%
                for (Incidente i:incidentes) {
                %>
                <div class="col-12 col-lg-6 p-1">
                    <div class="card shadow" style="min-height: 300px;">
                        <div class="card-body">
                            <div class="row" style="min-height: 80px;">
                                <h5 class=" col-8 card-title"><%= i.getCausa() %></h5>
                                <p class=" col-4 card-text small text-end"><%= i.getFecha() %></p>
                            </div>
                            <a href="<%= i.getLink() %>" class="text-nowrap">Link</a>
                            <hr>
                            <p class="card-text"><b>Descripcion :</b></p>
                            <div style="max-height: 80px; overflow-y: scroll;">
                                <p class="card-text"><%=i.getDescripcion()%></p>
                            </div>
                        </div>
                    </div>
                </div>
                <%
                }
                %>
            </div>
    
            <footer class="mt-4 p-3 shadow bg-dark text-light text-center text-muted">
                <p>Alonso Martinez | I.E.S. AZARQUIEL | Acceso a Datos</p>
                <h1>INCIDENCIAS DE TRAFICO</h1>
                <small>JSP web & XML parsed to Java by SAX</small>
            </footer>
        </div>
    
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
            integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous">
            </script>
    
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.min.js"
            integrity="sha384-7VPbUDkoPSGFnVtYi0QogXtr74QeVeeIs99Qfg5YCF+TidwNdjvaKZX19NZ/e6oz" crossorigin="anonymous">
            </script>
    </body>
    
    </html>