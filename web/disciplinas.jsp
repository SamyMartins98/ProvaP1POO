<%-- 
    Document   : disciplinas
    Created on : 11/04/2021, 21:32:21
    Author     : samantamartins
--%>

<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Disciplinas</title>
        <%@include file="WEB-INF/jspf/header.jspf"%>
    </head>
    <body>
        <%
            List<String> disciplinas = new ArrayList<>();
            disciplinas.add("Estágio Supervisionado em Análise e Desenvolvimento de Sistemas");
            disciplinas.add("Trabalho de Graduação I");
            disciplinas.add("Programação Orientada a Objetos");
            disciplinas.add("Programação para Dispositivos Móveis");
            disciplinas.add("Redes de Computadores");
            disciplinas.add("Segurança da Informação");
            disciplinas.add("Inglês V");
            disciplinas.add("Gestão de Projetos");
            disciplinas.add("Laboratório de Engenharia de Software");

            if (request.getParameter("session.p1") != null) {
                Integer index = Integer.parseInt(request.getParameter("session.index"));
                session.setAttribute("session.notasP1" + index, request.getParameter("session.notap1"));
            }

            if (request.getParameter("session.p2") != null) {
                Integer index = Integer.parseInt(request.getParameter("session.index"));
                session.setAttribute("session.notasP2" + index, request.getParameter("session.notap2"));
            }
        %>
        <%if (session.getAttribute("session.name") == null) {%>
        <div style='color:red'>Você não tem permissão para acessar esta página</div>
        <%} else {%>
        <table>
            <thead>
                <tr>
                    <th>Nome da matéria</th>
                    <th>P1</th>
                    <th>P2</th>
                    <th>Ações</th>
                </tr>
            </thead>
            <tbody>
                <%for (int i = 0; i < disciplinas.size(); i++) {%>
                <tr>
                    <td><%= disciplinas.get(i)%></td>
                    <td><%= session.getAttribute("session.notasP1"+i)%></td>
                    <td><%= session.getAttribute("session.notasP2"+i)%></td>
                    <td>
                        <form>
                            <input type="hidden" name="session.index" value="<%= i%>"/>
                            <input type="number" name="session.notap1" min="0" max="10" />
                            <input type="submit" value="+ P1" name="session.p1">
                            <input type="number" name="session.notap2" min="0" max="10" />
                            <input type="submit" value="+ P2" name="session.p2">
                        </form>
                    </td>
                </tr>
            </tbody>

        </table>
        <%}
            }%>
    </body>
</html>
