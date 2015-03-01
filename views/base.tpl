<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN">
<html lang="en">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    {% block head %}
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="http://getbootstrap.com/examples/jumbotron-narrow/jumbotron-narrow.css">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <title>{% block title %}{% endblock %} - Suncor T/O</title>
    {% endblock %}
</head>
<body>
    <div class="container">
      {% block nav %}
      <div class="header">
        <nav>
          <ul class="nav nav-pills pull-right">
            <li role="presentation" class="{% block addPage %}{% endblock%}"><a href="#">Add</a></li>
            <li role="presentation" class="{% block updatePage %}{% endblock%}"><a href="#">Update</a></li>
            <li role="presentation" class="{% block reportsPage %}{% endblock%}"><a href="#">Reports</a></li>
            <li role="presentation" class="{% block logsPage %}{% endblock%}"><a href="#">Logs</a></li>
          </ul>
        </nav>
        <h3 class="text-muted">Suncor T/O</h3>
      </div>
      {% endblock %}
      <div class="jumbotron">
      {% block container %}{% endblock %}
      </div>
      <footer class="footer">
          {% block footer %}
          &copy; Copyright 2015 by <a href="http://goo.gl/mdFz56">Alonso Suarez</a>.
          {% endblock %}
      </div>
    </div>
    {% block js %}
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js"></script>
    {% endblock%}
</body>


<!-- Latest compiled and minified JavaScript -->
