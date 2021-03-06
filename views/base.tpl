<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN">
<html lang="en" ng-app="turnoverSuncor">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>  
    {% block head %}
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="http://nakupanda.github.io/bootstrap3-dialog/assets/bootstrap-dialog/css/bootstrap-dialog.min.css">
    <link rel="stylesheet" href="http://getbootstrap.com/examples/jumbotron-narrow/jumbotron-narrow.css">
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <title>{% block title %}{% endblock %} - Suncor T/O</title>
    <style type="text/css">
      .jumbotron{
        padding-bottom: 80px;
        padding-top: 1px;
      }
      h2{
        text-align: left;
      }
      .modal-open .modal{
        background-color: rgba(0, 0, 0, 0.5);
      }
    </style>
    {% endblock %}
</head>
<body>
    {% block body %}
    <div class="container" ng-controller="{% block containerController %}{% endblock %}" 
                           ng-init="{% block containerInit %}{% endblock %}">
      {% block nav %}
      <div class="header">
        <nav>
          <ul class="nav nav-pills pull-right">
            <li role="presentation" class="active"><a href="/punches"><b>Punches Database</b></a></li>
            <li role="presentation" class="active"><a href="#"><b>Completion Logs</b></a></li>
            <li role="presentation" class="active"><a href="#"><b>Audits</b></a></li>
          </ul>
        </nav>
        <h3 class="text-muted">Suncor T/O</h3>
      </div>
      {% endblock %}
      <div class="jumbotron">
      {% block container %}{% endblock %}
      </div>
      {% block details %}{% endblock %}
      <footer class="footer">
          {% block footer %}
          <div class="pull-right">
            Developed by <a href="http://goo.gl/mdFz56">Alonso Suarez</a>.
          </div>
          {% endblock %}
      </div>
    </div>
    {% endblock %}
    {% block js %}
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    <script src="/static/js/angular.min.js"></script>
    <script src="/static/js/ui-bootstrap-tpls-0.12.1.min.js"></script>
    <script src="/static/js/app.js"></script>
    <script>
      function detectIE() {
        var ua = window.navigator.userAgent;

        var msie = ua.indexOf('MSIE ');
        if (msie > 0) {
            // IE 10 or older => return version number
            return parseInt(ua.substring(msie + 5, ua.indexOf('.', msie)), 10);
        }

        var trident = ua.indexOf('Trident/');
        if (trident > 0) {
            // IE 11 => return version number
            var rv = ua.indexOf('rv:');
            return parseInt(ua.substring(rv + 3, ua.indexOf('.', rv)), 10);
        }

        var edge = ua.indexOf('Edge/');
        if (edge > 0) {
           // IE 12 => return version number
           return parseInt(ua.substring(edge + 5, ua.indexOf('.', edge)), 10);
        }

        // other browser
        return false;
      }
    </script>
    {% endblock%}
    
</body>
<script type="text/javascript">
  $(document).ready(function () {
    setTimeout(function(){
      {% block onReady %}{% endblock %}  
    },200);
    
  });
</script>
