{% extends "base.tpl" %}
{% block title %}Add Punch{% endblock %}
{% block addPage %}active{% endblock %}
{% block containerController%}punchController{% endblock%}
{% block container %}
<h2>Add Punch</h2>
<form class="form-horizontal" novalidate>
  <div punch-form> </div>
  <a href="/" class="btn btn-danger pull-left" style="margin-right:10px;" role="button">Main menu</a>
  <a href="/punches" class="btn btn-danger pull-left" role="button">Punches menu</a>
  <button class="btn btn-success pull-right" ng-click="save()">Save</button>
</form>
{% endblock %}
{% block details %}
<div ng-show="hasRecents()">
  <h4>Recently saved</h4>
  <div punch-details></div>
</div>
{% endblock %}