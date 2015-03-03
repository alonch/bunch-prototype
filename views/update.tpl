{% extends "base.tpl" %}
{% block title %}Update Punch{% endblock %}
{% block updatePage %}active{% endblock %}
{% block containerController%}punchController{% endblock%}
{% block container %}
<h2>Filter by</h2>
<form class="form-horizontal" novalidate>
  <div punch-filter-form> </div>
  <a href="/" class="btn btn-primary pull-left" role="button">Back</a>
  <button class="btn btn-success pull-right" ng-click="refreshPunches()">Show Punches</button>
</form>
{% endblock %}
{% block details %}
<div ng-show="hasRecents()">
  <h4>Punches</h4>
  <div punch-details></div>
</div>
{% endblock %}