{% extends "base.tpl" %}
{% block head %}
{{ super() }}
<style type="text/css">
.jumbotron{
  padding-bottom: 80px;
  padding-top: 1px;
}
h2{
  text-align: left;
}
</style>
{% endblock%}
{% block title %}Add Punch{% endblock %}
{% block addPage %}active{% endblock %}
{% block containerController%}punchController{% endblock%}
{% block container %}
<h2>Punch:{{test}}</h2>
<div punch-form></div>
{% endblock %}
{% block details %}
<div ng-show="hasRecents()">
  <h4>Recently saved</h4>
  <div punch-details></div>
</div>
{% endblock %}