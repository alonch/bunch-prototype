{% extends "base.tpl" %}
{% block title %}Update Punch{% endblock %}
{% block updatePage %}active{% endblock %}
{% block containerController%}punchController{% endblock%}
{% block container %}
<h2>Change Status</h2>
<h3 class="pull-left">Filter by:</h3>
<div class="clearfix"></div>
<form class="form-horizontal" novalidate>
  <div punch-filter-form> </div>
  <a href="/" class="btn btn-danger pull-left" style="margin-right:10px;" role="button">Main menu</a>
  <a href="/punches" class="btn btn-danger pull-left" role="button">Punches menu</a>
  <button class="btn btn-success pull-right" ng-click="refreshPunches()">Show Punches</button>
</form>
{% endblock %}
{% block details %}
<div ng-show="hasRecents()" id="punches">
  <h4>Punches</h4>
  <div punch-details></div>
</div>
{% endblock %}